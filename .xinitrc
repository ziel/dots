
export AWT_TOOLKIT=MToolkit

setxkbmap -option ctrl:nocaps
setxkbmap -option terminate:ctrl_alt_bksp

xrdb $HOME/.Xdefaults

xsetroot -cursor_name left_ptr
xsetroot -solid '#111111'

xset -b
xset +fp /usr/share/fonts/artwiz-fonts
xset +fp /usr/share/fonts/local

unclutter &

# /usr/lib/gnome-settings-daemon/gnome-settings-daemon &

(
  sleep 5;
  synclient TapButton1=1 TapButton2=2 TapButton3=3 VertTwoFingerScroll=1 HorizTwoFingerScroll=1 EmulateTwoFingerMinZ=10 EmulateTwoFingerMinW=6
) &

tmux new-session -d top
urxvt &

exec xmonad
