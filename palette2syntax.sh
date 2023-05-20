#!/usr/bin/env bash


function usage() {
    cat >&2 <<EOF
$(basename "$0") [OPTIONS] PALETTE
Convert a color palette to a vim syntax.
This makes it easy to create "foreground-heavy" and "background-heavy"
VARIANTs of the same color scheme. This is not something that is usually
needed for syntax highlighting, but it can be helpful for biological sequence
highlighting. Foreground-highlighting is easier on the eyes, whereas
background-highlighting makes differences stand out more.

PALETTE is the path to a text file holding a color palette.

Expected input format:
A two-column text file. The base name of the file will be used as the base
name for the created syntax files.
* The first column contains the name of the matched character.
* The second column contains the hex code of the color to use for that
  character.

Example:
-- palettes/zappo.txt
A #FFAFAF
B #FFFFFF

Options:
  --foreground    Create a foreground color scheme. This is the default.
  --background    Create a background color scheme
EOF
    exit 1
}


function parse_args() {
    # Defaults
    VARIANT="fg"
    VARIANT_FULL="foreground"
    local positional_args=()
    while [[ $# -gt 0 ]]; do
        case $1 in
            --foreground)
                VARIANT="fg"
                VARIANT_FULL="foreground"
                ;;
            --background)
                VARIANT="bg"
                VARIANT_FULL="background"
                ;;
            -h|--help)
                usage
                ;;
            -*)
                echo "Unknown option $1" >&2
                usage
                ;;
            *)
                positional_args+=("$1")
                ;;
        esac
        shift
    done
    set -- "${positional_args[@]}"
    if [[ $# -eq 1 ]]; then
        PALETTE="$1"
    else
        echo "Single palette expected!" >&2
        exit 1
    fi
    readonly PALETTE VARIANT
}


function write_syn() {
    awk -v prefix="$SCHEME$VARIANT" '
    {
        name=prefix toupper($1)
        pattern="\"[" toupper($1) tolower($1) "]\""
        printf("syntax match %s %s containedin=@biosequence contained\n", name, pattern)
    }'
}


function write_hi_bg() {
    awk -v prefix="$SCHEME$VARIANT" '
    {
        pattern="\"[" toupper($1) tolower($1) "]\""
        name=prefix toupper($1)
        printf("highlight %s guifg=#000000 guibg=%s\n", name, $2)
    }'
}


function write_hi_fg() {
    awk -v prefix="$SCHEME$VARIANT" '
    {
        pattern="\"[" toupper($1) tolower($1) "]\""
        name=prefix toupper($1)
        printf("highlight %s guifg=%s guibg=NONE\n", name, $2)
    }'
}







function main() {
    # Get scheme name
    SCHEME="$(basename "$PALETTE")"
    SCHEME="${SCHEME%%.*}"

    echo "\" $SCHEME scheme - $VARIANT_FULL"
    write_syn < "$PALETTE"
    echo
    echo
    if [[ $VARIANT == "fg" ]]; then
        write_hi_fg < "$PALETTE"
    elif [[ $VARIANT == "bg" ]]; then
        write_hi_bg < "$PALETTE"
    fi
}

parse_args "$@"
main
