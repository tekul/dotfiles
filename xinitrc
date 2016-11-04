xrdb --merge .Xresources

xmodmap ~/.Xmodmap

syndaemon -i 1.0 -R -d -t -k

dbus-launch --exit-with-session /usr/bin/xmonad
