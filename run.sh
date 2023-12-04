#!/bin/sh

set -e

DAY=$1
gnatmake day_"${DAY}" -o day_"${DAY}".exe
./day_"${DAY}".exe
