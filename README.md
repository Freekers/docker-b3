# Big Brother Bot (B3) as Docker
Runs current latest head from master at https://github.com/BigBrotherBot/big-brother-bot

Supports sqlite database as well as an external MariaDB/MySQL database.

# Usage
Create `data` folder with following folder structure:
```
/opt/b3/data
├── conf
├── extplugins
├── parsers
```
All folders are optional, i.e. if you don't use custom parsers, you don't have to create the directory `parsers` and the default parsers from the Big Brother Bot repo will be used. However, if you *do* create the folder, make sure to add *ALL* parsers you use, not just the custom ones.

In the examples below, the config file has been saved in `/opt/b3/b3/conf/` on the host, which matches the same location in the docker container.

## docker run
`docker run -ti -v /opt/b3:/data --rm freekers/docker-b3:latest -c /opt/b3/b3/conf/myserver.xml`

## docker-compose.yml
```
version: '3.7'
services:
  b3:
    image: freekers/docker-b3:latest
    container_name: b3
    restart: always
    volumes:
     - /opt/cod2/server1/server1.log:/var/log/server1.log
     - /opt/b3/b3:/data
    command: -c /opt/b3/b3/conf/myserver.xml
```

## Example config file - myserver.xml
```
<?xml version="1.0" encoding="UTF-8"?>
<configuration>
  <settings name="b3">
    <!--Name of the bot.-->
    <set name="bot_name">B3</set>
    <!--Ingame messages are prefixed with this code, you can use colorcodes.-->
    <set name="bot_prefix">B3</set>
    <!--You can arrange the time format as specified in python's time directives.-->
    <set name="time_format">%I:%M%p %Z %d/%m/%y</set>
    <!--Set your server's timezone so all timebased lookups will show the proper time.-->
    <set name="time_zone">CEST</set>
    <!--The amount of logging you want in your b3.log file. Lower numbers log more information.-->
    <set name="log_level">21</set>
    <!--Name and path of the logfile the bot will generate.<br/>@conf : the folder containing this config file-->
    <set name="logfile">@conf/cod2_server1.log</set>
    <!--Your game parser.-->
    <set name="parser">cod2</set>
    <!--Your database info: [mysql]://[db-user]:[db-password]@[db-server[:port]]/[db-name]-->
    <set name="database">sqlite://@conf/database.sqlite</set>
  </settings>
  <settings name="server">
    <!--Enter your rcon password.-->
    <set name="rcon_password">TopSekret</set>
    <!--Enter your game server's rcon (admin) port.-->
    <set name="port">28960</set>
    <!--Enter your game server's public IP.-->
    <set name="public_ip">123.123.123.123</set>
    <!--Enter your game server's rcon IP.-->
    <set name="rcon_ip">123.123.123.123</set>
    <!--Delay between each log reading. Set a higher value to consume less disk ressources or bandwidth if you remotely connect (ftp or http remote log access)-->
    <set name="delay">0.5</set>
    <!--Number of lines to process per second. Set a lower value to consume less CPU ressources-->
    <set name="lines_per_second">50</set>
    <!--Select on if you use Punkbuster, otherwise select off.-->
    <set name="punkbuster">off</set>
    <!--Select your game log file location.-->
    <set name="game_log">/var/log/server1.log</set>
  </settings>
  <settings name="messages">
    <!--The message that will be displayed when a player is kicked by a mod/admin.-->
    <set name="kicked_by">$clientname^2 was kicked by $adminname^2 $reason</set>
    <!--The message that will be displayed when a player is kicked by B3.-->
    <set name="kicked">$clientname^2 was kicked $reason</set>
    <!--The message that will be displayed when a player is banned by a mod/admin.-->
    <set name="banned_by">$clientname^2 was banned by $adminname^2 $reason</set>
    <!--The message that will be displayed when a player is kicked by a B3.-->
    <set name="banned">$clientname^2 was banned $reason</set>
    <!--The message that will be displayed when a player is temp banned by a mod/admin.-->
    <set name="temp_banned_by">$clientname^2 was temp banned by $adminname^2 for $banduration^2 $reason</set>
    <!--The message that will be displayed when a player is temp banned by B3.-->
    <set name="temp_banned">$clientname^2 was temp banned for $banduration^2 $reason</set>
    <!--The message that will be displayed when a player is unbanned by a mod/admin.-->
    <set name="unbanned_by">$clientname^2 was un-banned by $adminname^2 $reason</set>
    <!--The message that will be displayed when a player is unbanned by B3-->
    <set name="unbanned">$clientname^2 was un-banned $reason</set>
  </settings>
  <settings name="plugins">
    <!--Enter here the path to the config folder for your external plugins.-->
    <set name="external_dir">@conf/extplugins</set>
  </settings>
  <plugins>
    <!--Cencors bad words and bad names-->
    <plugin name="censor" config="@conf/plugin_censor.xml"/>
    <!--This plugin provides main B3 functionalities.-->
    <plugin name="admin" config="@conf/plugin_admin_stock.ini"/>
    <!--Aimbot Detector-->
    <plugin name="aimbotdetector" config="/opt/b3/b3/extplugins/conf/aimbotdetector.xml"/>
	  <!--High Ping Kicker-->
	  <plugin name="pingkicker" config="/opt/b3/b3/extplugins/plugin_pingkicker.xml"/>
	  <!--Kill Streak-->
	  <plugin name="spree" config="@conf/plugin_spree.ini"/>
	  <!--Ads-->
	  <plugin name="adv" config="@conf/plugin_adv_cod2.xml" />
  </plugins>
</configuration>
