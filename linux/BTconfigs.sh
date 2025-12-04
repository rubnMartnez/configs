# To enable low freq BT pairing
sudo btmgmt --index hci1 le on
sudo btmgmt --index hci1 connectable on
sudo btmgmt --index hci1 bredr on
sudo btmgmt --index hci1 discov on

# Then connect nornally via console
sudo bluetoothctl
scan on
pair D3:B3:6F:41:39:4A
connect D3:B3:6F:41:39:4A
trust D3:B3:6F:41:39:4A

# To restart BT
sudo systemctl restart bluetooth
