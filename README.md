# ubuntu_security
Tips for ubuntu security

ssh access only from localhost
```
sudo ufw allow from 192.168.178.0/24 to any port 22
```

```
sudo apt-get install ufw
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow ssh
sudo ufw allow 22

sudo ufw status numbered
sudo ufw enable
sudo ufw disable
```

## change ssh port
ideally select between 30000 and 65535
```
sudo nano /etc/ssh/sshd_config
```

Then restart the ssh service to apply the change: 
```
sudo systemctl restart sshd.service
```
or
```
service ssh restart
```


# Cron job

```
sudo crontab -e
```
add this entry to the crontab
```
*/5 * * * *  /home/user/path/script.bash > /dev/null 2>&1
```

```
sudo service cron restart
```
