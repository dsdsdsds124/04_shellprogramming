#!/bin/bash

. /root/bin/functions.sh

# Install the packages
# 1) gcc
# 2) php
# 3) vscode
# 4) chrome

# 1) gcc
# 2) php
PkgInst "gcc php"

# 3) vscode
VScodeInst
VScodeComment

# 4) chrome
ChromeInst