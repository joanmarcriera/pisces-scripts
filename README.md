# Several scripts to help me manage pisces

See : piscesiot.com

Useful dashboard : https://github.com/briffy/PiscesQoLDashboard

## Usage Instructions ##

### Get ssh access. 

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



