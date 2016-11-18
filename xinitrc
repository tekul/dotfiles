xrdb --merge .Xresources

xmodmap ~/.Xmodmap


eval "$(dbus-launch --sh-syntax --exit-with-session)"


fcitx

export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS="@im=fcitx"
export DefaultIMModule=fcitx

# Breaks toggling of touchpad on/off
#
# syndaemon -i 1.0 -R -d -t -k

exec /usr/bin/xmonad
