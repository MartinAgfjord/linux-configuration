#!/bin/bash
echo "if [ -f ~/.bash_variables ]; then" >> /etc/profile
echo "    . ~/.bash_variables" >> /etc/profile
echo "fi" >> /etc/profile
