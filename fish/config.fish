if status is-interactive
    set -gx EDITOR /usr/bin/nvim
    set -gx BROWSER "firefox"
    set -gx LAUNCH_EDITOR launch_editor_script
    set -gx fish_greeting "是故滑疑之耀，聖人之所圖也"\n"shìgù huáyí zhī yào, shèngrén zhī suǒ tú yě"
    set -gx LS_COLORS "ow=31"
    # 200ms delay for sequences like "jk" below. Otherwise when we type "jj" (jujutsu) it waits 
    # indefinitely to see if the second j is part of the "jk" sequence
    set -gx fish_sequence_key_delay_ms 200
    fish_vi_key_bindings
    bind --mode insert --sets-mode default jk repaint
    source ~/dotfiles/aliases
    thefuck --alias | source
    ~/dotfiles/bin/check_updates &
end

