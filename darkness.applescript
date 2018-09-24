#!/usr/bin/osascript

on set_darkness(dark_mode)
  tell application "System Events"
    tell appearance preferences
      set dark mode to dark_mode
    end tell
  end tell
end set_darkness

on run argv
  -- darkness start, e.g. 25200 for 18:00
  -- darkness end, e.g. 64800 for 7:00
  set darknessStart to item 1 of argv as integer
  set darknessEnd to item 2 of argv as integer

  tell application "System Events"
    tell appearance preferences
      set dark_mode_enabled to (get dark mode) as boolean
    end tell
  end tell

  if not dark_mode_enabled and time of (current date) < darknessEnd and time of (current date) > darknessStart then
    set_darkness(true)
  else if dark_mode_enabled and time of (current date) > darknessEnd and time of (current date) < darknessStart then
    set_darkness(false)
  end if
end run
