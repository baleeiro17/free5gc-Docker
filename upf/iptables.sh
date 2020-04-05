#!/bin/bash

iptables -C FORWARD -i uptun -o ens33 -j ACCEPT
output=$?
if [ $output -eq 1 ]; then
    echo "Masquerade..."
    iptables -t nat -A POSTROUTING -o ens33 -j MASQUERADE
    echo "Conntrack..."
    iptables -A FORWARD -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT
    echo "Uptun..."
    iptables -A FORWARD -i uptun -o ens33 -j ACCEPT
fi
