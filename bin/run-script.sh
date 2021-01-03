#!/bin/bash -el

colorize() { CODE=$1; shift; echo -e '\033[0;'"${CODE}"'m'"$*"'\033[0m'; }
red() { echo -e "$(colorize '1;31' "$@")"; }
green() { echo -e "$(colorize 32 "$@")"; }
yellow() { echo -e "$(colorize 33 "$@")"; }
cyan() { echo -e "$(colorize 36 "$@")"; }

script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
repo_dir="${script_dir}/.."

node_mcu_path="/dev/tty.SLAB_USBtoUART"

[[ ! -e $node_mcu_path ]] && { red "Error: did not find NodeMCU connected at ${node_mcu_path}"; exit 1; }


lua_script="$1"
[[ ! -n $lua_script ]] && { red "Error: Must pass in lua script name"; exit 1; }

lua_script_path="${repo_dir}/lua/${lua_script}"

[[ ! -f $lua_script_path ]] && { red "Error: lua script does not exist at path ${lua_script_path}"; exit 1; }


yellow "Running lua script at path ${lua_script_path}"

source "${repo_dir}/.venv/bin/activate"

python ${repo_dir}/luatool/luatool/luatool.py --port $node_mcu_path --src $lua_script_path --dest init.lua --dofile

green "Done!"
