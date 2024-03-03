# umichvpn

A simple CLI frontend for connecting to and disconnecting from the University of Michigan VPN.
Assumes client is on a GNU/Linux system.

Different OSes/Ubuntu should follow the [University of Michigan ITS's documentation](https://its.umich.edu/enterprise/wifi-networks/vpn/getting-started) for installation.

## Usage

- `$ ./umichvpn connect` - Connect to the University of Michigan VPN.
- `$ ./umichvpn disconnect` - Disconnect from the University of Michigan VPN.

## Motivation

For the vast majority of users of the University of Michigan VPN, the experience is fairly straightforward: a GUI is presented and the users are redirected to Duo Security to log in. However, for users running distributions and graphical environments other than Ubuntu and its defaults, the GUIs may fail to render, so a CLI utility is required for this very specific edge case.

Of note, ITS writes on the [Linux Installation Page](https://documentation.its.umich.edu/vpn/vpn-linux-vpn-instructions) that "Using VPN CLI without GUI sessions (for example SSH) is not supported." Through personal experience, the AnyConnect client provided by ITS works via CLI out-of-the-box. This frontend repository simply functions as an easy way to use this existing functionality.
