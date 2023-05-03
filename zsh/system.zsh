# list every errno defined on the system as an int and a name.
#
# borrowed with RESPECT from the moreutils makefile
function errno {
    local compilers=(clang gcc cc)
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
