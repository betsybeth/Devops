#!/usr/bin/env bash

set -o verbose

sudo apt-get  update
# if git exits should not be reinstalled
if [[ -x "$command -v git" ]]; then
   echo "git exits no need to install"
   exit 0
else
  sudo apt-get install git -y
fi

curl -sL https://deb.nodesource.com/setup_8.0.0 | sudo -E bash -

sudo apt-get install nodejs -y

if [["$?" != 0 ]]; then
echo "error encountered installing node js"
exit 1
fi

#installing yarn 
sudo apt remove cmdtest
sudo apt remove yarn
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt-get update && sudo apt-get install yarn

#Make sure node and yarn are installed 
if [[ "$?" != 0 ]]; then
   echo "An error was encountered when installing yarn"
   exit - 1
else 
 git clone https://github.com/betsybeth/brightevent-frontend-app.git
 BRIGHTEVENTFILE="brightevent-frontend-app"
 #check if brightevent-frontend-app exists and it is a directory
 if [[ ! -d $BRIGHTEVENTFILE ]] && [[ -e  $BRIGHTEVENTFILE ]]; then
    echo " brightevent-frontend-app does not exit "
     exit - 1
  else
    chmod 777 brightevent-frontend-app
    cd brightevent-frontend-app 
    sudo yarn add
    sudo yarn add react
    sudo yarn start
  fi
fi

