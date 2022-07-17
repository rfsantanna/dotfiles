#!/usr/bin/env bash

set -Eeuo pipefail
trap cleanup SIGINT SIGTERM ERR EXIT

declare  DOTFILES_FORCE_INSTALL="${DOTFILES_FORCE_INSTALL:-0}"
declare  DOTFILES_REMOVE_INSTALL="${DOTFILES_FORCE_INSTALL:-0}"


script_dir=$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd -P)

usage() {
  cat << EOF # remove the space between << and EOF, this is due to web plugin issue
Usage: $(basename "${BASH_SOURCE[0]}") [-h] [-v] [-f] -p param_value arg1 [arg2...]

:: Dotfiles setup

Arguments
  defaults        Default development environment 
  kitty           Installs and configure Kitty
  nvim|neovim     Installs Neovim
  lvim|lunarvim   Installs LunarVim (and required Neovim)

Available options:
  --force         Overwrite actual installation
  --remove        Remove actual installation
  -h, --help      Print this help and exit
EOF
  exit
}

cleanup() {
  trap - SIGINT SIGTERM ERR EXIT
  # script cleanup here
}

msg() {
  echo >&2 -e "${1-}"
}

die() {
  local msg=$1
  local code=${2-1} # default exit status 1
  msg "$msg"
  exit "$code"
}

parse_params() {
  # default values of variables set from params
  param=''

  while :; do
    case "${2-}" in
    --force) DOTFILES_FORCE_INSTALL=1 ;; 
    --remove) DOTFILES_REMOVE_INSTALL=1 ;; 
    #--param) # example named parameter
    #  param="${2-}"
    #  shift
    #  ;;
    -?*) die "Unknown option: $1" ;;
    *) break ;;
    esac
    shift
  done

  args=("$@")

  # check required params and arguments
  # [[ -z "${param-}" ]] && die "Missing required parameter: param"
  [[ ${#args[@]} -eq 0 ]] && die "Missing script arguments"

  return 0
}

check_neovim() {
  DOTFILES_NVIM_VERSION=$(nvim --version | head -1)
  msg "Neovim installed: $DOTFILES_NVIM_VERSION"
}

install_neovim() {
  msg "\n:: Installing Neovim"
  bash -c "$(curl -s https://raw.githubusercontent.com/LunarVim/LunarVim/rolling/utils/installer/install-neovim-from-release)"
}

install_lunarvim() {
  msg "\n:: Installing LunarVim"
  bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh) -y
}

uninstall_lunarvim() {
  msg "\n:: Uninstalling LunarVim"
  bash ~/.local/share/lunarvim/lvim/utils/installer/uninstall.sh
}

setup_neovim() {
  msg "\n:: Setup Neovim"
  command -v nvim >/dev/null 2>&1 && {
    [[ $DOTFILES_FORCE_INSTALL -eq 0 ]]
    # if forced installed script here
  } || {
    install_neovim
  }
  check_neovim
}

setup_zsh() {
  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
}

setup_lunarvim() {
  setup_neovim
  msg "\n:: Setup LunarVim"
  command -v lvim >/dev/null 2>&1 && {
    msg "LunarVim installed"
    [[ $DOTFILES_FORCE_INSTALL -eq 0 ]]
    # if forced installed script here
  } || {
    install_lunarvim
    msg "\n:: Copy LunarVim Files"
    cp -v -R ./lunarvim/{lua,ftdetect,ftplugin,config.lua} ~/.config/lvim/
    msg "\n:: PackerSync "
    lvim --headless \
      -c 'autocmd User PackerComplete quitall' \
      -c 'PackerSync' 2>/dev/null
  }
}

setup_kitty() {
  msg "\n:: Setup Kitty"
  DOTFILES_KITTY_CONF=~/.config/kitty/kitty.conf
  test -f "$DOTFILES_KITTY_CONF" && {
    [[ $DOTFILES_FORCE_INSTALL -eq 0 ]]
    msg "$DOTFILES_KITTY_CONF exists"
  } || {
    mkdir -p ~/.config/kitty 2>/dev/null
    cp -vR ./kitty/* ~/.config/kitty
  }
}

parse_params "$@"

# script logic here

case "$1" in
  lvim | lunarvim)
    [[ $DOTFILES_REMOVE_INSTALL -eq 1 ]] && uninstall_lunarvim || setup_lunarvim
    ;;
  nvim | neovim)
    setup_neovim
    ;;
  kitty)
    setup_kitty
    ;;
  zsh)
    setup_zsh
    ;;
  defaults)
    setup_lunarvim
    setup_kitty
    ;;
  check)
    check_neovim
    ;;
  *)
    echo "Unknown option: $1" 
    usage
    ;;
esac
