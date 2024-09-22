import sys
import wx
import json
import pyo

NCHNLS = 1  # Define the value of NCHNLS
#Slider labels and initial values
DEFAULT_SLIDERS = {
        "Wah":00, 
        "Delay":5, 
        "Reverb":10, 
        "Distort":15, 
        "Treble":20, 
        "Mid":15, 
        "Bass":10, 
        "Gain":50
        }
SLIDERS = DEFAULT_SLIDERS

class MyFrame(wx.Frame):
    def __init__(self, *args, **kw):
        super(MyFrame, self).__init__(*args, **kw)
        self.Bind(wx.EVT_CHAR_HOOK, self.onKey)
        self.panel = wx.Panel(self)
        self.panel.SetBackgroundColour(wx.Colour(0, 0, 0))

        # Create a horizontal box sizer
        sizer = wx.BoxSizer(wx.HORIZONTAL)
        self.build_sliders(sizer)

    def onKey(self, event):
        key_code = event.GetKeyCode()
        if key_code == wx.WXK_ESCAPE:
            print("Saving current slider settings...")
            with open('slider-vals.json', 'w') as sv:
                json.dump(SLIDERS, sv)
            print("Shutting down - But that's the way I like it baby, I don't wanna live forever")
            server.stop()
            sys.exit(0)
        else:
            event.Skip()        

    def build_sliders(self, sizer):
        sizer.AddSpacer(20)
        # Create and add sliders to the sizer
        for slider in SLIDERS:
            slider_sizer = wx.BoxSizer(wx.VERTICAL)
            slider_label = wx.StaticText(self.panel, label=slider)
            slider_label.SetForegroundColour(wx.Colour(255, 255, 255)) 
            sliderCtrl = wx.Slider(parent=self.panel, 
                               value=SLIDERS[slider], 
                               style=wx.SL_VERTICAL | wx.SL_INVERSE,
                               size=(30, 250),
                                minValue=0, maxValue=100,
                                name=slider
                               )
            sliderCtrl.Bind(wx.EVT_SCROLL_CHANGED, self.onSliderChange)
            sliderCtrl.SetForegroundColour(wx.Colour(255, 255, 255))
            slider_sizer.Add(sliderCtrl, 0, wx.CENTER | wx.ALL, 5)
            slider_sizer.Add(slider_label, 0, wx.CENTER | wx.ALL, 5)
            sizer.Add(slider_sizer, 0, wx.CENTER | wx.ALL, 5)
            
            # Add a 20-pixel gap after the "Distort" slider
            if slider == "Distort" or slider == "Bass":
                sizer.AddSpacer(20)
            
            sizer.AddStretchSpacer()
            
        vu_sizer = wx.BoxSizer(wx.VERTICAL)    
        vu_label = wx.StaticText(self.panel, label="dB")
        vu_label.SetForegroundColour(wx.Colour(255, 255, 255))
        vu_meter = meter = pyo.PyoGuiVuMeter(
            parent=self.panel, nchnls=NCHNLS, pos=(0, 0), size=(5 * NCHNLS, 250), orient=wx.VERTICAL, style=0
        )
        server.setMeter(vu_meter)
        vu_sizer.Add(vu_meter, 0, wx.CENTER | wx.ALL, 5)
        vu_sizer.Add(vu_label, 0, wx.CENTER | wx.ALL, 5)
        vu_sizer.AddStretchSpacer()
        sizer.Add(vu_sizer, 0, wx.CENTER | wx.ALL, 5)   
        sizer.AddSpacer(20)
                
        self.panel.SetSizer(sizer)
        self.panel.Layout()
        # self.ShowFullScreen(True)
        self.Fit()

    def onSliderChange(self, event):
        val = event.EventObject.GetValue()
        SLIDERS[event.EventObject.Name] = val

       

# load slider values from disk
try: 
    with open('slider-vals.json', 'r') as sv:
        SLIDERS = json.load(sv)
except:
    SLIDERS = DEFAULT_SLIDERS

app = wx.App(False)
print("Starting Audio...")
# set up pyo input and effectgs
server = pyo.Server(nchnls=NCHNLS).boot()
server.start()

# Start the UI
mainFrame = MyFrame(None, title="Pyo Control Sliders", size=(800, 480))
mainFrame.SetMaxSize(wx.Size(800, 480))
mainFrame.SetMinSize(wx.Size(800, 480))
mainFrame.Show()
app.MainLoop()

# Start the Audio processes
dry      = pyo.Input()
audio   = pyo.Input()
# wah effect
follow   = pyo.Follower(audio)
wahfq    = pyo.Scale(follow, outmin=300, outmax=20000)

delay    = pyo.SmoothDelay(audio, feedback=0.15)
reverb   = pyo.Freeverb(delay)
distort  = pyo.Disto(reverb)
eq       = pyo.MultiBand(distort, num=3, mul=[1,1,1])
wet      = pyo.Mix([eq])
wah      = pyo.ButBP(wet, freq=wahfq, q=30)
mix       = pyo.Mix([dry,wet,wah]).out()

while True:
 #   dry.mul         = 1 - SLIDERS["Wah"]
 #   wet.mul         = SLIDERS["Wah"]
 #   delay.delay     = SLIDERS["Delay"]
 #   reverb.size     = SLIDERS["Reverb"]
 #   distort.drive   =  SLIDERS["Distort"]**0.05
 #   wah.mul         = SLIDERS["Wah"]*30
 #   eq.mul          = [ SLIDERS["Treble"], SLIDERS["Mid"], SLIDERS["Bass"]*2]
    server.setAmp(pow(10, SLIDERS["Gain"] * 0.05))
