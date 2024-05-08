{ pkgs, ... }:
pkgs.writeShellScriptBin "todofi" ''
  list() {
    output=$(todo.sh -p ls)

    # Remove the last two lines
    output=$(echo "$output" | sed '$d' | sed '$d')

    # Remove the numbers shown before each line
    output=$(echo "$output" | sed 's/^[0-9]* //')

    # Syntax highlighting
    output=$(echo "$output" | sed "s/@[^ ]*/<span foreground='#fab387'>&<\/span>/g")
    output=$(echo "$output" | sed "s/+[^ ]*/<span foreground='#cba6f7'>&<\/span>/g")
    output=$(echo "$output" | sed "s/^\((A) .*\)$/\<span foreground='#f38ba8'\>\1\<\/span\>/")
    output=$(echo "$output" | sed "s/^\((B) .*\)$/\<span foreground='#f9e2af'\>\1\<\/span\>/")
    output=$(echo "$output" | sed "s/^\((C) .*\)$/\<span foreground='#a6e3a1'\>\1\<\/span\>/")

    # Pipe the result to the less command
    echo "$output" | rofi -dmenu -markup-rows -p "Filter" -mesg "Press alt+c to run a command"
  }

  list
''
