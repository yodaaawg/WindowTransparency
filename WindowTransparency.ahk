#NoTrayIcon

; Initialize global variables
transparencyEnabled := false
currentTransparency := 255 ; Default full opacity
titleChangeDuration := 1000 ; Duration in milliseconds (1 second) for which the tooltip is displayed

; Toggle transparency with CTRL + ALT + RMB (Right Mouse Button)
^!RButton::

if (!transparencyEnabled) {
    transparencyEnabled := true ; Enable transparency
    currentTransparency := 220 ; Initial transparency level
    UpdateTransparency("A") ; Apply transparency and show tooltip
} else {
    ; Disable transparency
    WinSet, Transparent, OFF, A
    transparencyEnabled := false ; Disable transparency
    currentTransparency := 255 ; Reset to full opacity
    ToolTip ; Remove tooltip
}
return

; Decrease transparency with CTRL + ALT + SCROLL DOWN
^!WheelDown::
if (transparencyEnabled) {
    currentTransparency -= 10
    if (currentTransparency < 0)
        currentTransparency := 0
    UpdateTransparency("A")
}
return

; Increase transparency with CTRL + ALT + SCROLL UP
^!WheelUp::
if (transparencyEnabled) {
    currentTransparency += 10
    if (currentTransparency > 255)
        currentTransparency := 255
    UpdateTransparency("A")
}
return

; Function to update transparency and show tooltip
UpdateTransparency(windowID) {
    global currentTransparency, transparencyEnabled, titleChangeDuration

    ; Apply transparency
    WinSet, Transparent, %currentTransparency%, %windowID%

    ; Show tooltip
    if (transparencyEnabled) {
        ToolTip, % "Opacity: " currentTransparency
        MouseGetPos, mouseX, mouseY ; Get the current mouse position
        ToolTip, % "Opacity: " currentTransparency, mouseX + 10, mouseY + 10 ; Show tooltip near the mouse pointer
        
        ; Remove the tooltip after the specified duration
        SetTimer, RemoveTooltip, -%titleChangeDuration%
    }
}

; Function to remove the tooltip after the specified time
RemoveTooltip:
ToolTip ; Remove tooltip
return