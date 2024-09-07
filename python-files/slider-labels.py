import wx

class RoundedRectFrame(wx.Frame):
    def __init__(self, parent, title):
        super(RoundedRectFrame, self).__init__(parent, title=title, size=(200, 400))
        self.Bind(wx.EVT_PAINT, self.OnPaint)
        self.Centre()
        self.Show(True)

    

    def OnPaint(self, event):
        dc = wx.PaintDC(self)
        dc.Clear()

        # Set the pen and brush for the rectangle
        pen = wx.Pen(wx.WHITE, 2)
        dc.SetPen(pen)
        brush = wx.Brush(wx.BLACK, wx.BRUSHSTYLE_SOLID)
        dc.SetBrush(brush)

        # Draw the rounded rectangle
        rect_width = 150
        rect_height = 350
        dc.DrawRoundedRectangle(25, 25, rect_width, rect_height, 10)
        dc.DrawRectangle(25, 25+rect_height-10, rect_width, 10) 

        # Draw the label at the top
        font = wx.Font(12, wx.FONTFAMILY_DEFAULT, wx.FONTSTYLE_NORMAL, wx.FONTWEIGHT_NORMAL)
        dc.SetFont(font)
        dc.SetTextForeground(wx.WHITE)
        dc.DrawText("Gain", 70, 30)  # Center the text approximately


app = wx.App(False)
frame = RoundedRectFrame(None, 'Rounded Rectangle Example')
app.MainLoop()
