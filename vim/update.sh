#!/usr/bin/env bash
#
# Usage: ./update.sh [pattern]
#
#  alampros/vim-styled-jsx
#  altercation/vim-colors-solarized
#  ap/vim-css-color
#  docunext/closetag.vim
#  ervandew/supertab
#  haya14busa/incsearch.vim
#  itchyny/lightline.vim
#  junegunn/fzf.vim
#  junegunn/goyo.vim
#  mileszs/ack.vim
#  nathanaelkane/vim-indent-guides
#  qpkorr/vim-bufkill
#  scrooloose/nerdtree
#  sheerun/vim-polyglot
#  statico/vim-inform7
#  tomasr/molokai
#  tpope/vim-commentary
#  tpope/vim-endwise
#  tpope/vim-eunuch
#  tpope/vim-fugitive
#  tpope/vim-pathogen
#  tpope/vim-repeat
#  tpope/vim-rhubarb
#  tpope/vim-sleuth
#  tpope/vim-surround
#  tpope/vim-unimpaired
#  w0rp/ale
#  wellle/targets.vim
#  flazz/vim-colorschemes
#
#
# Specify [pattern] to update only repos that match the pattern.

repos=(
    gmarik/Vundle
    scrooloose/nerdtree
    Xuyuanp/nerdtree-git-plugin
    vim-airline/vim-airline
    vim-airline/vim-airline-themes
    junegunn/fzf.vim
    airblade/vim-gitgutter
    godlygeek/tabular
    plasticboy/vim-markdown
    tpope/vim-fugitive
    kien/rainbow_parentheses.vim
    chriskempson/base16-vim
    sickill/vim-monokai
    cakebaker/scss-syntax.vim
    tikhomirov/vim-glsl
    scrooloose/nerdcommenter
    mitsuhiko/vim-sparkup
    tell-k/vim-autopep8
    Chiel92/vim-autoformat
)

set -e
dir=~/.dotfiles/.vim/bundle

if [ -d $dir -a -z "$1" ]; then
  temp="$(mktemp -d -t bundle)"
  echo "▲ Moving old bundle dir to $temp"
  mv "$dir" "$temp"
fi

mkdir -p $dir

for repo in ${repos[@]}; do
  if [ -n "$1" ]; then
    if ! (echo "$repo" | grep -i "$1" &>/dev/null) ; then
      continue
    fi
  fi
  plugin="$(basename $repo | sed -e 's/\.git$//')"
  [ "$plugin" = "vim-styled-jsx" ] && plugin="000-vim-styled-jsx" # https://goo.gl/tJVPja
  dest="$dir/$plugin"
  rm -rf $dest
  (
    git clone --depth=1 -q https://github.com/$repo $dest
    rm -rf $dest/.git
    echo "· Cloned $repo"
  ) &
done
wait
