#!/bin/sh

show_usage() {
  echo "umichvpn - A simple CLI frontend for the University of Michigan VPN."
  echo ""
  echo "Usage:"
  echo "umichvpn help			Display the help page."
  echo "umichvpn connect		Connect to the VPN."
  echo "umichvpn disconnect		Disconnect from the VPN."
  echo "umichvpn [status/state]		Status of the connection."
  echo "umichvpn [profiles/hosts]	Display the available VPN profiles."
  echo "umichvpn stats			Display the VPN statistics."
  echo ""
}

# Filename of the install script
vpn_installer_script=umichvpn_install.sh

# Path at which the installer places the vpn controller executable by default
vpn_controller_executable=/opt/cisco/anyconnect/bin/vpn

# Check if the VPN is installed
if [ ! -f $vpn_controller_executable ]; then
  echo "Error: VPN not installed!" >&2
  echo >&2
  echo "VPN Controller Executable not found at path: $vpn_controller_executable" >&2
  echo "Hint: Have you run the $vpn_installer_script script to install the VPN?" >&2

  exit 1
fi

if [ "$#" -eq 0 ]; then
  show_usage
  exit 0
fi

# The University of Michigan VPN Gateway URL
vpn_gateway_url=umvpn.umnet.umich.edu

# "UMVPN - All Traffic profile" - Includes Access to the Library Databases
# https://its.umich.edu/enterprise/wifi-networks/vpn/getting-started
# (see the "Notes:" section for information on the VPN profiles and their offerings)
vpn_profile_all_traffic=umvpn-all-traffic-alt

# "UMVPN - Only U-M Traffic" - Allows access to most services that require the VPN
# https://its.umich.edu/enterprise/wifi-networks/vpn/getting-started
# (see the "Notes:" section for information on the VPN profiles and their offerings)
vpn_profile_only_um_traffic=umvpn-split-tunnel-alt

exit_status=0
case "$1" in
  connect)
    $vpn_controller_executable connect $vpn_gateway_url/$vpn_profile_only_um_traffic
    exit_status=$?
    ;;
  disconnect)
    $vpn_controller_executable disconnect
    exit_status=$?
    ;;
  status | state)
    $vpn_controller_executable status
    exit_status=$?
    ;;
  profiles | hosts )
    $vpn_controller_executable hosts
    exit_status=$?
    ;;
  stats )
    $vpn_controller_executable stats
    exit_status=$?
    ;;
  help)
    show_usage
    ;;
  *)
    echo "Error: Unrecognized command: $1"
    echo
    show_usage
    ;;
esac

# Forward the exit code from the VPN controller to the exit code of the frontend.
exit $exit_status
