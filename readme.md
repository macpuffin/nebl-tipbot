# Tipbot - Slack Neblio Tipbot.

#### Neblio crypto currency tipbot for [Slack](https://slack.com)

## Setup

We're using [digitalocean.com](https://digitalocean.com) so these instructions will be specific to that plaform.

### Create and configure droplet

#### Create droplet

* Go to digitalocean.com and create a new droplet
  * hostname: nebl-tipbot
  * Size
    * Pick either w/ 2GB/2CPUs $20 a month or w/ 1GB/1CPUs $10 a month.
  * Region
    * Amsterdam or whatever location is closest to you.
  * One-click Apps
    * Dokku 0.94 on 16.04
  * Add SSH keys
    * Digital Ocean provide a easy-following tutorial for this that can be accessed once you click on add SSH key’s option, you’ll see a html link above the ssh key input console for creating and using SSH keys.

#### Configure hostname

* Copy/Paste IP address into URL bar after the droplet has installed which might take 5/10 minutes, to be faced with the Dokku setup.
  * Put in `hostname` for whatever domain you are using.
    * `example.com`
  * Check `Use virtualhost naming for apps
    * `http://<app-name>.example.com`
  * Finish Setup

#### Add DNS

* You'll need a domain for this. For this documentation I'm using `example.com`
* Point your domain's nameservers to digitalocean
  * `ns1.digitalocean.com`
  * `ns2.digitalocean.com`
  * `ns3.digitalocean.com`
* In digitalocean's `DNS` section set an `A-Record` for your `hostname` from your previous step
  * Make the `hostname` be the name of your app
    * `nebl-tipbot`
  * Make the IP address be the one provided by digitalocean for your droplet.
* After the DNS propogates which may take 10/20 minutes.
  * In the `Zone file` of the DNS section of digital ocean you'll see:
    * `nebl-tipbot IN A 143.143.243.143`
 * Go to a console/terminal on your Desktop and enter the following to command to see if the domain is live and connected to your droplet, you should see a response with your droplet's IP.
 * `ping nebl-tipbot.example.com`
    * `PING nebl-tipbot.example.com (143.143.243.143): 56 data bytes`

#### SSH into your new virualized box

* `ssh -o "IdentitiesOnly yes" -i ~/location/id_rsa root@droplet-ip` or `ssh root@droplet-ip`
  * If you correctly added your SSH keys you'll get signed in




### Compile nebliod & let the blockchain sync which may take up to around 10-15 hours. (You can still progress but balances won't update until synced)




#### Clone the Neblio tipbot git repo

* `cd`
* `git clone https://github.com/NeblioTeam/nebl-tipbot`
* `cd nebl-tipbot`

* Install Ruby 2.4.0 and rvm
 * `sudo apt-get install libgdbm-dev libncurses5-dev automake libtool bison libffi-dev`
	* `gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3`
	* `curl -sSL https://get.rvm.io | bash -s stable`
	* `source /home/https://github.com/NeblioTeam/nebl-tipbot/.rvm/scripts/rvm`
* `rvm install ruby-2.4.0`
* `rvm use 2.4.0 --default`
* `ruby -v`

* Install bundler
* `gem install bundler`
* `bundle update`
* `sudo apt install ruby-bundler`

* To start using RVM you need to run `source rvm`
* Run `bundle`

* Parsing dependencies.
* `chmod +x disp.sh`
* `sudo apt-get install html-xml-utils`

* Enter droplet IP in the `bitcoin_client_extensions.rb` file where it says `Host IP`
* ` nano bitcoin_client_extensions.rb`
* `        { host: 'Host IP', port: 6326, ssl: false} )`
*    Ctrl + X + Enter to save.




* Install node.js and slack-sdk client.
* `sudo apt install -y nodejs-legacy && sudo apt install -y npm && git clone https://github.com/slackapi/node-slack-sdk`
* `cd node-slack-sdk `
* `sudo npm install -g forever`
* `sudo npm install -g @slack/client --save`
* `sudo npm install -g --save-dev capture-console`
* `cd`
* `cd tipbot`





#### Setup node.js client.
* https://api.slack.com/custom-integrations/legacy-tokens
* Request a legacy token for your slack channel and copy it to the clipboard.
* Paste this value in the `leaderboard.js` file and `message.js` file in the following positon where the value `API_KEY` is.
* `var token = process.env.SLACK_API_TOKEN || 'API_KEY' ; `
* `nano leaderboard.js` -> Ctrl + X + Enter to save.
* `nano message.js` -> Ctrl + X + Enter to save.





#### Set up the Slack integration: as an "outgoing webhook"

* https://yoursite.slack.com/services/new/outgoing-webhook
* Write down the api token they show you in this page
* Set the trigger word, use `tipbot`
* Set the Url to the server you'll be deploying on http://example.com:4567/tip





#### Launch the server!
* `source rvm`
* `bundle`
* `forever start message.js`
* `forever start leaderboard.js`
* If you want to keep the servering running use can use the unbuntu screen command
* Enter your sudo password you made or re-entered earlier -> `su`
* `screen`
* `su reddcoin`
* `RPC_USER=reddrpc RPC_PASSWORD=your_pass SLACK_API_TOKEN=your_api_key COIN=reddcoin bundle exec ruby tipper.rb -p 4567`
*  Ctrl/Cmd + A + D to detach from the screen.




### Usage
Note: Tip over 10 times before initating the leaderboard command.

say any of the tipbot commands for example `tipbot hi` , `tipbot tip @username 100` , `tipbot deposit` use the command `tipbot help` to find out more.

## Security

This wallet is unecrypted please go to extra efforts to secure the system from attacks, aka encrypting the reddcoin core wallet and SSL encryption improvement.

## Credits
Forked from [coin-agnostic tipbot](https://github.com/blocktech/slack_tipbot) by [cgcardona](https://github.com/cgcardona) along with aspects of the tutorial.

This project was originally forked from [dogetip-slack](https://github.com/tenforwardconsulting/dogetip-slack) by [tenforwardconsulting](https://github.com/tenforwardconsulting)

