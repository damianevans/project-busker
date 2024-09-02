import wx
from pyo import Server, Sine, PyoGuiControlSlider, PyoGuiVuMeter

NCHNLS = 1  # Define the value of NCHNLS

class MyFrame(wx.Frame):
    def __init__(self, *args, **kw):
        super(MyFrame, self).__init__(*args, **kw)
        
        self.panel = wx.Panel(self)
        self.panel.SetBackgroundColour(wx.Colour(0, 0, 0))
        
        # Create a horizontal box sizer
        sizer = wx.BoxSizer(wx.HORIZONTAL)
        
        # Labels for the sliders
        labels = ["Wah", "Delay", "Reverb", "Distort", "Treble", "Mid", "Bass", "Gain"]
        sizer.AddSpacer(20)
        # Create and add sliders to the sizer
        for label in labels:
            slider_sizer = wx.BoxSizer(wx.VERTICAL)
            slider_label = wx.StaticText(self.panel, label=label)
            slider_label.SetForegroundColour(wx.Colour(255, 255, 255)) 
            slider = PyoGuiControlSlider(parent=self.panel,
                                         minvalue=0,
                                         maxvalue=100,
                                         init=50,
                                         size=(30, 250),
                                         orient=wx.VERTICAL)
            slider.SetForegroundColour(wx.Colour(255, 255, 255))
            slider_sizer.Add(slider, 0, wx.CENTER | wx.ALL, 5)
            slider_sizer.Add(slider_label, 0, wx.CENTER | wx.ALL, 5)
            sizer.Add(slider_sizer, 0, wx.CENTER | wx.ALL, 5)
            
            # Add a 20-pixel gap after the "Distort" slider
            if label == "Distort" or label == "Bass":
                sizer.AddSpacer(20)
            
            sizer.AddStretchSpacer()
            
        vu_sizer = wx.BoxSizer(wx.VERTICAL)    
        vu_label = wx.StaticText(self.panel, label="dB")
        vu_label.SetForegroundColour(wx.Colour(255, 255, 255))
        vu_meter = meter = PyoGuiVuMeter(
            parent=self.panel, nchnls=NCHNLS, pos=(0, 0), size=(5 * NCHNLS, 250), orient=wx.VERTICAL, style=0
        )
        vu_sizer.Add(vu_meter, 0, wx.CENTER | wx.ALL, 5)
        vu_sizer.Add(vu_label, 0, wx.CENTER | wx.ALL, 5)
        vu_sizer.AddStretchSpacer()
        sizer.Add(vu_sizer, 0, wx.CENTER | wx.ALL, 5)   
        sizer.AddSpacer(20)
                
        self.panel.SetSizer(sizer)
        self.panel.Layout()
        self.Fit()

app = wx.App(False)
mainFrame = MyFrame(None, title="Pyo Control Sliders", size=(800, 480))
mainFrame.SetMaxSize(wx.Size(800, 480))
mainFrame.SetMinSize(wx.Size(800, 480))
mainFrame.Show()
app.MainLoop()
