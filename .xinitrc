
if [ -d /etc/X11/xinit/xinitrc.d ] ; then
	for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
		[ -x "$f" ] && . "$f"
	done
	unset f
fi

export GTK_THEME=Adwaita
export AWT_TOOLKIT=MToolkit
xrdb $HOME/.Xdefaults

setxkbmap -option ctrl:nocaps
setxkbmap -option terminate:ctrl_alt_bksp

xsetroot -cursor_name left_ptr
xsetroot -solid '#111111'

xset -b
xset +fp /usr/share/fonts/artwiz-fonts
xset +fp /usr/share/fonts/local
xrandr --dpi 75

urxvtd -q -f -o
unclutter &

exec xmonad
