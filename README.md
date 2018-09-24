# Darkness

Apple introduced a [dark mode](https://www.macrumors.com/how-to/enable-dark-mode-macos-mojave/)
in macOS Mojave. Unfortunatly, there is no way to conditionally enable this mode
based on a time schedule (or Night Shift). This is a straightforward script that
allows you to enable the dark mode based on a predefined window. For example,
between 18:00 and 7:00.

## Installation

Run the following commands to compile the script, and install it.

```bash
mkdir -p $HOME/Library/Scripts/
osacompile -o $HOME/Library/Scripts/darkness.scpt ./darkness.applescript

cp ./com.github.koenrh.darkness.plist $HOME/Library/LaunchAgents/
launchctl load $HOME/Library/LaunchAgents/com.github.koenrh.darkness.plist
```

## Configuration

By default, the dark mode window is set to 7:00 and 18:00.

You could change this window by updating the start and end time (in seconds), which
is the second and third argument at the following line  in the `.plist` file ,
respectively.

```xml
...
<string>osascript "$HOME/Library/Scripts/darkness.scpt" 25200 64800</string>
...
```
