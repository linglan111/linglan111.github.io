#!/bin/sh

# Enable wlan0 interface
ifconfig wlan0 up

# Start wpa_supplicant with the specified configuration file
wpa_supplicant -D nl80211 -i wlan0 -c /etc/wpa_supplicant.conf -B

# Scan for available networks
wpa_cli -i wlan0 scan -B

# Display scan results
wpa_cli -i wlan0 scan_result

# Add a new network
wpa_cli -i wlan0 add_network

# Set the network parameters (replace ssid and psk with your actual values)
wpa_cli -i wlan0 set_network 1 psk '"写入你的热点密码"'
wpa_cli -i wlan0 set_network 1 ssid '"写入你的热点名称"'

# Select the configured network
wpa_cli -i wlan0 select_network 1

# Obtain an IP address using udhcpc
udhcpc -i wlan0 -q

