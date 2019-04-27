# check_nmap.sh
Simple shell script that uses NMAP to check if a Host is up.

Usage: check_nmap.sh [Hostame or IP]

Or define follwing command in Nagios-Config

define command {
                command_name                          check_nmap
                command_line                          $USER1$/check_nmap.sh $HOSTADDRESS$
}
