function argon2
    set -l salt (openssl rand 16)
    /usr/bin/argon2 $salt $argv
end
