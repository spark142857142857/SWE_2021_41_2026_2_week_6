#!/bin/bash
set -euo pipefail

export LC_ALL=C
cd -- "$(dirname -- "${BASH_SOURCE[0]}")"
shopt -s nullglob

for file in files/*; do
    [[ -f "$file" ]] || continue
    filename="${file##*/}"
    first_letter="${filename:0:1}"
    folder="${first_letter,,}"

    [[ "$folder" == [a-z] ]] || continue
    mkdir -p -- "$folder"
    mv -- "$file" "$folder/"
done
