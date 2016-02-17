
if [ -d /etc/X11/xinit/xinitrc.d ] ; then
	for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
		[ -x "$f" ] && . "$f"
	done
	unset f
fi

export GTK_THEME=Adwaita
export AWT_TOOLKIT=MToolkit
xrdb $HOME/.Xresources

setxkbmap -option ctrl:nocaps
setxkbmap -option terminate:ctrl_alt_bksp

hsetroot -solid '#111111'
xsetroot -cursor_name left_ptr
compton -b -c --shadow-exclude '! class_i *?= "fsmlurxvt"' -l -7 -t -7 -r 5

xset -b
xset +fp /usr/share/fonts/artwiz-fonts
xset +fp /usr/share/fonts/local
xrandr --dpi 75

xbindkeys
urxvtd -q -f -o
unclutter &

exec xmonad
