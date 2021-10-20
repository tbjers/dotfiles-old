#!/bin/sh

set -e

xlsx2csv "$1" | less
