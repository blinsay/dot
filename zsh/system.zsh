#shellcheck shell=bash

# list every errno defined on the system as an int and a name.
#
# borrowed with RESPECT from the moreutils makefile
function errno {
    local compilers=(gcc clang cc)
    local cc=""

    for compiler in $compilers; do
        if $compiler -v &> /dev/null; then
            cc=$compiler;
            break;
        fi
    done

    if [[ -z "$cc" ]]; then
        echo "welp, no C compiler is available (tried ${(j:, :)compilers})"
        return
    fi

    echo '#include <errno.h>' | \
        $cc -E -dD - | \
        awk '/^#define E[A-Z]* [0-9]+/ { printf "%4s %s\n", $3, $2 }'
}


# check to see if sip is enabled on a given binary.
#
# the SF_PROTECTED flag is defined in xnu headers.
# https://opensource.apple.com/source/xnu/xnu-4570.41.2/bsd/sys/stat.h.auto.html
function sip-enabled {
    for arg in "$@"; do
        local st_flags=$(stat -f '%#Xf' "$arg")
        local sip_enabled=$(printf '%X\n' $((st_flags & 0x00080000)))

        if (( sip_enabled == 0 )); then
            echo "$arg: not protected"
        else
            echo "$arg: sip-protected"
        fi
    done
}
