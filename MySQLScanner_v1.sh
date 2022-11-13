#!/bin/bash
# Dit script vindt hosts waar MySQL is geinstalleerd!

nmap -sT 192.168.2.252/24 -p 3306 > /dev/null -oG mySQLscan
cat mySQLscan | grep open > mySQLscan2