Window Transparency Toggle Script
This is an AutoHotkey (AHK) script that allows you to control the transparency of any active window dynamically. The script enables you to toggle transparency on and off, as well as adjust the opacity in real-time, all through simple keyboard shortcuts. It also provides visual feedback via a tooltip showing the current transparency level near the mouse cursor.

Features:
Toggle Transparency: Activate or deactivate window transparency with a simple key combination.
Real-time Transparency Adjustment: Increase or decrease the window's transparency using the scroll wheel while holding specific modifier keys.
Tooltips for Feedback: When transparency is adjusted, a tooltip appears near your mouse cursor displaying the current transparency level. The tooltip disappears after a brief duration.
Full Transparency Control: Start with full opacity (255) and decrease transparency to any level down to complete transparency (0).
Controls:
Toggle Transparency: CTRL + ALT + Right Mouse Button (RMB)
Activates or deactivates the transparency effect for the active window.
When transparency is enabled, a tooltip shows the current transparency level.
Decrease Transparency: CTRL + ALT + Scroll Down
Lowers the transparency of the active window by 10 units, down to 0 (completely transparent).
Increase Transparency: CTRL + ALT + Scroll Up
Increases the transparency of the active window by 10 units, up to 255 (completely opaque).
How it Works:
Activation: When you hold CTRL + ALT and right-click on the window (with the mouse cursor inside), transparency is enabled. The window’s opacity starts at 220 and can be adjusted using the scroll wheel.
Transparency Adjustment: Use CTRL + ALT + Scroll Down to make the window more transparent, or CTRL + ALT + Scroll Up to make it more opaque.
Tooltip Display: A tooltip will appear near your mouse cursor showing the current transparency level in real-time. This tooltip automatically disappears after 3 seconds.
Customization:
Transparency Range: The transparency level starts at 220 (semi-transparent) and can be adjusted from 0 (completely transparent) to 255 (completely opaque).
Tooltip Duration: The tooltip is displayed for 3 seconds by default, but you can adjust this duration by modifying the titleChangeDuration variable in the script (in milliseconds).
Requirements:
AutoHotkey: You need to have AutoHotkey installed to run this script. Download AutoHotkey
Installation:
Install AutoHotkey.
Download or clone this repository to your local machine.
Right-click the script file and select "Run Script" to start controlling window transparency.
