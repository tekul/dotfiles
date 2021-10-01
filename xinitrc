# xrdb --merge .Xresources

xmodmap ~/.Xmodmap

source /etc/X11/xinit/xinitrc.d/50-systemd-user.sh

eval $(/usr/bin/gnome-keyring-daemon --start --components=secrets)

# See https://incenp.org/notes/2015/gnupg-for-ssh-authentication.html
gpg-connect-agent /bye
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)

# Allow us to toggle between key layouts easily depending on what
# keyboard is being used.
setxkbmap -layout gb,us -option grp:shifts_toggle

urxvtd -q -f -o

fcitx

export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS="@im=fcitx"
export DefaultIMModule=fcitx

exec xmonad
