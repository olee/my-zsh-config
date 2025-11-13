#!/bin/bash
set -e

rm -f $ZDOTDIR/conf.d/*.zsh

# Symlink all files in conf.d.source to conf.d
ln -sf $ZDOTDIR/conf.d.source/* ./conf.d/
