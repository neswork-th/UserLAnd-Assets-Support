#! /bin/bash

SCRIPT_PATH=$(realpath ${BASH_SOURCE})
sudo rm -f $SCRIPT_PATH

if [ ! -f /usr/games/minetest ]; then
	sudo apt-get update
	sudo DEBIAN_FRONTEND=noninteractive apt-get -y --no-install-recommends install minetest

fi

# comment the above if/fi statement above if you want to install the LATEST version of Minetest
# as opposed to the repository version, which is going to be a little behind (but stable) in the
# game's version, and uncomment the following paragraph. Please note, the latest version requires
# compiling from source and is not a pre-compiled package. Please also note, to prevent conflicts
# compiling from source will first delete the installed package if there is one (leaving the config
# files intact)

# sudo DEBIAN_FRONTEND=noninteractive apt-get -y remove minetest
# sudo DEBIAN_FRONTEND=noninteractive apt-get -y build-essential cmake libbz2-dev libirrlicht-dev libpng12-dev libjpeg8 libxxf86vm-dev libgl1-mesa-dev libsqlite3-dev
# if [ ! -f /usr/bin/cmake ]; then
#	  sudo DEBIAN_FRONTEND=noninteractive apt-get -y --no-install-recommends install cmake
# fi
#
# if [ ! -f master.tar.gz ]; then
#	  wget https://github.com/minetest/minetest/tarball/master -O master.tar.gz
#	  tar xf master.tar.gz
#	  rm -f master.tar.gz
#	  cd celeron55-minetest-*
# fi
# cmake . -DRUN_IN_PLACE=1 && make -j2 
# cd bin && ./minetest

if [[ $? != 0 ]]; then
   read -rsp $'An error occurred installing packages, please try again and if it persists provide this log to the developer.\nPress any key to close...\n' -n1 key
   exit
fi


minetest
