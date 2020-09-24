VERSION 5.00
Object = "{6BF52A50-394A-11D3-B153-00C04F79FAA6}#1.0#0"; "wmp.dll"
Begin VB.Form frmtv 
   BackColor       =   &H00404040&
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Online TV Player by James/Webmonster"
   ClientHeight    =   8895
   ClientLeft      =   195
   ClientTop       =   825
   ClientWidth     =   11400
   Icon            =   "frmtv.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   8895
   ScaleWidth      =   11400
   StartUpPosition =   3  'Windows Default
   Begin VB.PictureBox Picture1 
      Height          =   15
      Left            =   1440
      ScaleHeight     =   15
      ScaleWidth      =   15
      TabIndex        =   1
      Top             =   3000
      Visible         =   0   'False
      Width           =   15
   End
   Begin VB.Label Label4 
      BackStyle       =   0  'Transparent
      Caption         =   "Contact me by adding Webmosnter123@hotmail.com to your msn"
      ForeColor       =   &H00FFFFFF&
      Height          =   255
      Left            =   6600
      TabIndex        =   6
      Top             =   8640
      Width           =   4695
   End
   Begin VB.Line Line3 
      BorderColor     =   &H00FFFFFF&
      X1              =   6480
      X2              =   6480
      Y1              =   8520
      Y2              =   8880
   End
   Begin VB.Line Line2 
      BorderColor     =   &H00FFFFFF&
      X1              =   3960
      X2              =   3960
      Y1              =   8520
      Y2              =   8880
   End
   Begin VB.Label Label3 
      BackStyle       =   0  'Transparent
      Caption         =   "Online TV Player Open Source"
      ForeColor       =   &H00FFFFFF&
      Height          =   255
      Left            =   4080
      TabIndex        =   5
      Top             =   8640
      Width           =   2175
   End
   Begin VB.Label Label2 
      BackStyle       =   0  'Transparent
      Caption         =   "© 2007 Websofts.org"
      ForeColor       =   &H00FFFFFF&
      Height          =   255
      Left            =   2160
      TabIndex        =   4
      Top             =   8640
      Width           =   1695
   End
   Begin VB.Line Line1 
      BorderColor     =   &H00FFFFFF&
      X1              =   2040
      X2              =   2040
      Y1              =   8520
      Y2              =   8880
   End
   Begin VB.Label number 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "1"
      ForeColor       =   &H00FFFFFF&
      Height          =   195
      Left            =   1680
      TabIndex        =   3
      Top             =   8640
      Width           =   90
   End
   Begin VB.Label Label1 
      BackStyle       =   0  'Transparent
      Caption         =   "Screenshot Number:"
      ForeColor       =   &H00FFFFFF&
      Height          =   255
      Left            =   120
      TabIndex        =   2
      Top             =   8640
      Width           =   1455
   End
   Begin WMPLibCtl.WindowsMediaPlayer tv 
      Height          =   8535
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   11415
      URL             =   ""
      rate            =   1
      balance         =   0
      currentPosition =   0
      defaultFrame    =   ""
      playCount       =   1
      autoStart       =   -1  'True
      currentMarker   =   0
      invokeURLs      =   -1  'True
      baseURL         =   ""
      volume          =   50
      mute            =   0   'False
      uiMode          =   "full"
      stretchToFit    =   0   'False
      windowlessVideo =   0   'False
      enabled         =   -1  'True
      enableContextMenu=   -1  'True
      fullScreen      =   0   'False
      SAMIStyle       =   ""
      SAMILang        =   ""
      SAMIFilename    =   ""
      captioningID    =   ""
      enableErrorDialogs=   0   'False
      _cx             =   20135
      _cy             =   15055
   End
   Begin VB.Menu station 
      Caption         =   "Stations"
      Begin VB.Menu uk 
         Caption         =   "UK TV"
         Begin VB.Menu bbc24 
            Caption         =   "BBC News 24"
         End
         Begin VB.Menu bbcparl 
            Caption         =   "BBC Parliament"
         End
         Begin VB.Menu bbc 
            Caption         =   "BBC World"
         End
         Begin VB.Menu mosound 
            Caption         =   "Ministry Of Sound"
         End
         Begin VB.Menu itvplay 
            Caption         =   "ITV Play"
         End
         Begin VB.Menu skynews 
            Caption         =   "Sky News"
         End
         Begin VB.Menu skyone 
            Caption         =   "Sky One"
         End
      End
      Begin VB.Menu us 
         Caption         =   "US TV"
         Begin VB.Menu cnbc 
            Caption         =   "CNBC"
         End
         Begin VB.Menu fox5 
            Caption         =   "Fox 5"
         End
         Begin VB.Menu fox8 
            Caption         =   "Fox 8"
         End
      End
      Begin VB.Menu space 
         Caption         =   "-"
      End
      Begin VB.Menu other 
         Caption         =   "Other Channel"
      End
      Begin VB.Menu newstation 
         Caption         =   "Find New Stations"
      End
   End
   Begin VB.Menu tools 
      Caption         =   "Tools"
      Begin VB.Menu screen 
         Caption         =   "Take Screenshot"
         Shortcut        =   {F12}
      End
   End
End
Attribute VB_Name = "frmtv"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' Online TV Player Open Source
' © 2007 Websofts.org
' Contact me by adding Webmonster123@hotmail.com to your msn
' Or email J.webmonster@gmail.com

Option Explicit
' For screenshot
Private Declare Function BitBlt Lib "gdi32" (ByVal hDestDC As Long, _
    ByVal x As Long, ByVal y As Long, ByVal nWidth As Long, _
    ByVal nHeight As Long, ByVal hSrcDC As Long, ByVal xSrc As Long, _
    ByVal ySrc As Long, ByVal dwRop As Long) As Long
' Shell execute is for default browser
Private Declare Function ShellExecute Lib "shell32.dll" Alias "ShellExecuteA" (ByVal hwnd As Long, ByVal lpOperation As String, ByVal lpFile As String, ByVal lpParameters As String, ByVal lpDirectory As String, ByVal nShowCmd As Long) As Long

Private Sub bbc_Click()
tv.URL = "http://a1729.l2168647534.c21686.g.lm.akamaistream.net/D/1729/21686/v0001/reflector:56487"
End Sub

Private Sub bbc24_Click()
tv.URL = "http://www.bbc.co.uk/newsa/n5ctrl/tvseq/n24/nb/wm/video/heads_nb.asx"
End Sub

Private Sub bbcparl_Click()
tv.URL = "http://www.bbc.co.uk/newsa/n5ctrl/tvseq/parliament/nb/wm/video/parliament_16x9_nb.asx"
End Sub

Private Sub cnbc_Click()
tv.URL = "mms://a1991.l2229962829.c22299.n.lm.akamaistream.net/D/1991/22299/v0001/reflector:45586"
End Sub

Private Sub fox5_Click()
tv.URL = "mms://a1991.l2229962829.c22299.n.lm.akamaistream.net/D/1991/22299/v0001/reflector:45584?ptr=cc&k=op&r=908143"
End Sub

Private Sub fox8_Click()
tv.URL = "MMS://a1729.l2168647534.c21686.g.lm.akamaistream.net/D/1729/21686/v0001/reflector:50135"
End Sub

Private Sub itvplay_Click()
tv.URL = "http://play.itv.com/media/ITV_Play.asx"
End Sub

Private Sub mosound_Click()
tv.URL = "mms://a407.l954634696.c9546.g.lm.akamaistream.net/D/407/9546/v0001/reflector:34696enjoy"
End Sub

Private Sub skynews_Click()
tv.URL = "mms://live1.wm.skynews.servecast.net/skynews_wmlz_live300k"
End Sub

Private Sub skyone_Click()
tv.URL = "mms://82.36.233.110:8010"
End Sub

Private Sub other_Click()
tv.URL = InputBox("Enter the URL for the tv station", "Other Channel")
End Sub

Private Sub newstation_Click()
ShellExecute Me.hwnd, "open", "http://wwitv.com/portal.htm", "", "", 1
End Sub

Private Sub screen_Click()
' This will take a screenshot and save it in the application folder
Dim pic As PictureBox
Dim intScaleMode As Integer
intScaleMode = Me.ScaleMode
Set pic = Controls.Add("vb.PictureBox", "pic")
    With pic
        .Left = Me.Width + 1000
        .Width = tv.Width
        .Height = tv.Height
        .AutoRedraw = True
        .Visible = True
        .ScaleMode = vbPixels
    End With
        Me.ScaleMode = vbPixels
        With tv
        BitBlt pic.hDC, 0, 0, .Width, .Height, Me.hDC, .Left, .Top, vbSrcCopy
    End With
        Clipboard.Clear
        Clipboard.SetData pic.Image
        Controls.Remove pic
    Set pic = Nothing
        Me.ScaleMode = intScaleMode
Picture1.Picture = Clipboard.GetData()
SavePicture Picture1, App.Path & "\Screensot " & number.Caption & ".jpeg"
number.Caption = number.Caption + 1
End Sub
