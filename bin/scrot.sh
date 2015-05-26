#!/bin/sh
scrot  -s '%Y-%m-%d_$wx$h.png' -e 'mv $f ~/screenshots/ && shotwell ~/screenshots/$f'
