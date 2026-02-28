#Requires AutoHotkey v2.0.2
#SingleInstance Force

terminal := "wezterm-gui.exe"
winTerminal := "powershell"
browser := "zen"
editor := "code"
fileManager := "explorer.exe"
; menu := "hyprlauncher" ; aquí luego lo adaptamos

Komorebic(cmd) {
    Run(format("komorebic.exe {}", cmd), , "Hide")
}

#q:: Komorebic("close")
!m:: Komorebic("minimize")

; # = Win key
; ! = Alt key
; + = Shift key

; Bind keys to launch applications
#Enter:: Run(winTerminal)
#w:: Run(browser, , 'Hide')
#c:: Run(editor, , 'Hide')
#e:: Run(fileManager, , 'Hide')
; #m:: RunWait(menu, , 'Hide')

; Focus windows - Vim-style
#h:: Komorebic("focus left")
#j:: Komorebic("focus down")
#k:: Komorebic("focus up")
#l:: Komorebic("focus right")

; Focus windows - Arrow keys
#Left:: Komorebic("focus left")
#Down:: Komorebic("focus down")
#Up:: Komorebic("focus up")
#Right:: Komorebic("focus right")

!+[:: Komorebic("cycle-focus previous")
!+]:: Komorebic("cycle-focus next")

; Move windows
#+h:: Komorebic("move left")
#+j:: Komorebic("move down")
#+k:: Komorebic("move up")
#+l:: Komorebic("move right")

#+Left:: Komorebic("move left")
#+Down:: Komorebic("move down")
#+Up:: Komorebic("move up")
#+Right:: Komorebic("move right")

; Stack windows
!Left:: Komorebic("stack left")
!Down:: Komorebic("stack down")
!Up:: Komorebic("stack up")
!Right:: Komorebic("stack right")
!.:: Komorebic("unstack")
![:: Komorebic("cycle-stack previous")
!]:: Komorebic("cycle-stack next")

; Resize
!=:: Komorebic("resize-axis horizontal increase")
!-:: Komorebic("resize-axis horizontal decrease")
!+=:: Komorebic("resize-axis vertical increase")
!+_:: Komorebic("resize-axis vertical decrease")

; Manipulate windows
#t:: Komorebic("toggle-float")
#f:: Komorebic("toggle-monocle")

; Window manager options
!+r:: Komorebic("retile")
!p:: Komorebic("toggle-pause")

; Layouts
!x:: Komorebic("flip-layout horizontal")
!y:: Komorebic("flip-layout vertical")

; Workspaces
#1:: Komorebic("focus-workspace 0")
#2:: Komorebic("focus-workspace 1")
#3:: Komorebic("focus-workspace 2")
#4:: Komorebic("focus-workspace 3")
#5:: Komorebic("focus-workspace 4")
#6:: Komorebic("focus-workspace 5")
#7:: Komorebic("focus-workspace 6")
#8:: Komorebic("focus-workspace 7")

; Move windows across workspaces
#+1:: Komorebic("move-to-workspace 0")
#+2:: Komorebic("move-to-workspace 1")
#+3:: Komorebic("move-to-workspace 2")
#+4:: Komorebic("move-to-workspace 3")
#+5:: Komorebic("move-to-workspace 4")
#+6:: Komorebic("move-to-workspace 5")
#+7:: Komorebic("move-to-workspace 6")
#+8:: Komorebic("move-to-workspace 7")