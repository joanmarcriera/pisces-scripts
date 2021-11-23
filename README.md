# Several scripts to help me manage pisces

See : piscesiot.com

Useful dashboard : https://github.com/briffy/PiscesQoLDashboard

## Usage Instructions ##

### Get ssh access. 

### The sure way
Put the following lines one at a time in your browser. 

```html
http://__YOURIP__/action.php/?action=shell&cmd=sudo%20adduser%20--disabled-password%20--gecos%20%22User%20to%20login%20into%20the%20box%22%20admin
http://__YOURIP__/action.php/?action=shell&cmd=echo%20admin:admin%20|%20sudo%20chpasswd
http://__YOURIP__/action.php/?action=shell&cmd=sudo%20usermod%20admin%20-g%20sudo
```

#### The automatic but not sure if it works way


1. Find the internal IP address of your Pisces miner.
2. Use the following link, replacing __YOURIP__ with the IP address of your miner:
```bash
http://__YOURIP__/action.php?action=shell&cmd=wget https://raw.githubusercontent.com/joanmarcriera/pisces-scripts/main/install/create-shell-user.sh -O - | sudo bash
```
3.  You should never run scripts without reading them first.  (Yes, this should have been number 2, I guess there is a lesson here. )
```bash
http://__YOURIP__/action.php?action=shell&cmd=wget https://raw.githubusercontent.com/joanmarcriera/pisces-scripts/main/install/create-shell-user.sh -O - 
   ```
4. Now you should be able to ssh to __YOURIP__ with 
```bash
$> ssh __YOURIP__ -l admin 
```
  - Password: admin

5. Change your password right away. 
```bash
$> passwd 
```



