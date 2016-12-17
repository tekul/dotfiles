# xrdb --merge .Xresources

xmodmap ~/.Xmodmap

eval "$(dbus-launch --sh-syntax --exit-with-session)"

urxvtd -q -f -o

fcitx

export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS="@im=fcitx"
export DefaultIMModule=fcitx

exec /usr/bin/xmonad
