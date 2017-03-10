#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then







    xrdb -merge $sysresources

fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then







    xrdb -merge "$userresources"

fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

twm &
xclock -geometry 50x50-1+1 &
xterm -geometry 80x50+494+51 &
xterm -geometry 80x20+494-0 &
exec xterm -geometry 80x66+0+0 -name login
exec i3

! ------------------------------------------------------------------------------
! ROFI Color theme
! ------------------------------------------------------------------------------

! Use extended color scheme
rofi.color-enabled:                  true
! Color scheme for normal row
rofi.color-normal:                   argb:00000000, #1aa, argb:11FFFFFF, #1aa,#333
! Color scheme for urgent row
rofi.color-urgent:                   argb:00000000, #f99, argb:11FFFFFF, #f99,#333
! Color scheme for active row
rofi.color-active:                   argb:00000000, #aa1, argb:11FFFFFF, #aa1,#333
! Color scheme window
rofi.color-window:                   argb:ee333333, #1aa,#1aa
! Separator style (none, dash, solid)
rofi.separator-style:                dash
