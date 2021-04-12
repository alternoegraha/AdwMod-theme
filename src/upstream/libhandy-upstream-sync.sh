#!/usr/bin/env bash
# -*- coding: UTF-8 -*-
## Helper script to sync libhandy css from upstream to a destination folder
## usage:
##
##      libhandy-upstream-sync.sh --destination <path>
##
## options:
##    -d, --destination <path>    Destination folder - mandatory
# CLInt GENERATED_CODE: start

# No-arguments is not allowed
[ $# -eq 0 ] && sed -ne 's/^## \(.*\)/\1/p' $0 && exit 1

# Converting long-options into short ones
for arg in "$@"; do
  shift
  case "$arg" in
"--destination") set -- "$@" "-d";;
  *) set -- "$@" "$arg"
  esac
done

function print_illegal() {
    echo Unexpected flag in command line \"$@\"
}

# Parsing flags and arguments
while getopts 'had:' OPT; do
    case $OPT in
        h) sed -ne 's/^## \(.*\)/\1/p' $0
           exit 1 ;;
        d) _destination=$OPTARG ;;
        \?) print_illegal $@ >&2;
            echo "---"
            sed -ne 's/^## \(.*\)/\1/p' $0
            exit 1
            ;;
    esac
done
# CLInt  GENERATED_CODE: end

wget_check=`which wget | wc -l`
[ $wget_check == 0 ] && echo "install wget" && exit 1

root=https://gitlab.gnome.org/GNOME/libhandy/raw/master/src/themes

[ ! -d ${_destination} ] && echo ${_destination} folder does not exists && exit 1

files=(
    Adwaita-dark.css
    Adwaita-dark.scss
    Adwaita.css
    Adwaita.scss
    HighContrast.css
    HighContrast.scss
    HighContrastInverse.css
    HighContrastInverse.scss
    _Adwaita-base.scss
    _definitions.scss
    _fallback-base.scss
    _shared-base.scss
    fallback.css
    fallback.scss
    parse-sass.sh
    shared.css
    shared.scss
)

set -e
for i in ${files[@]}; do
    wget ${root}/${i} -O ${_destination}/${i}
done
