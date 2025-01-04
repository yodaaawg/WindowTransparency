#NoTrayIcon

; Initialize global variables
transparencyEnabled := false
currentTransparency := 255 ; Default full opacity
titleChangeDuration := 3000 ; Duration in milliseconds (3 seconds) for displaying the tooltip

; Toggle transparency with CTRL + ALT + RMB
^!RButton::
WinGetTitle, originalTitle, A
if (originalTitle = "") {
    return
}

if (!transparencyEnabled) {
    transparencyEnabled := true ; Enable transparency
    currentTransparency := 220 ; Starting transparency value
    UpdateTransparency("A") ; Apply transparency and show tooltip
} else {
    ; Disable transparency
    WinSet, Transparent, OFF, A
    transparencyEnabled := false ; Disable transparency
    currentTransparency := 255 ; Reset transparency to full opacity
    ToolTip ; Remove the tooltip
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

; Function to update transparency and display the tooltip
UpdateTransparency(windowID) {
    global currentTransparency, transparencyEnabled, titleChangeDuration

    ; Apply transparency
    WinSet, Transparent, %currentTransparency%, %windowID%

    ; Display the tooltip
    if (transparencyEnabled) {
        ToolTip, % "Transparency: " currentTransparency
        MouseGetPos, mouseX, mouseY ; Get the current position of the mouse cursor
        ToolTip, % "Transparency: " currentTransparency, mouseX + 10, mouseY + 10 ; Show tooltip near the mouse cursor
        
        ; Remove the tooltip after the specified duration
        SetTimer, RemoveTooltip, -%titleChangeDuration%
    }
}

; Function to remove the tooltip after the specified duration
RemoveTooltip:
ToolTip ; Remove the tooltip
return