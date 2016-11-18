xrdb --merge .Xresources

xmodmap ~/.Xmodmap

syndaemon -i 1.0 -R -d -t -k

eval "$(dbus-launch --sh-syntax --exit-with-session)"


fcitx

export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS="@im=fcitx"
export DefaultIMModule=fcitx

exec /usr/bin/xmonad
