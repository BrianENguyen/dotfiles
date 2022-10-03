#!/usr/bin/env bash
set -euo pipefail

sed -e '/START_KEYS/,/END_KEYS/p' sxhkdrc
