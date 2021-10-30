# Create the bootable SD card

## Allegedly simple option 1

Install and  use the SD card imager as documented here:

	https://www.raspberrypi.com/software/

On my Ubuntu 20.04 system, I did this to install and run it:

	snap install rpi-imager
	rpi-imager


## How I Install Raspberry PI OS using the Ubuntu 20.04 command line:

	wget https://downloads.raspberrypi.org/raspios_full_armhf/images/raspios_full_armhf-2021-05-28/2021-05-07-raspios-buster-armhf-full.zip
	
plug in the SD card

	lsblk -p

Observe where the SD card was mounted & the devidce path (lets call it /dev/sdc)
The important thing is to know that /dev/sdc is the entire SD card 

Wipe out any existing data:

	sudo dd if=/dev/zero of=/dev/sdc count=1000 bs=1M

I remove and re-insert the SD card at this point to make sure that the OS does not 
think it is in use.

	unzip -p 2021-05-07-raspios-buster-armhf.zip | sudo dd of=/dev/sdc bs=4M conv=fsync status=progress



# Configure the PI

Put the SD card into your PI & power it on, let it boot and answer the questions to configure 
the password, timezone, and reboot the PI.  

When it comes back on line, open a terminal window (or SSH into it) 
and apply any updates:

	sudo apt update
	sudo apt upgrade
	sudo reboot

After the PI reboots, run `raspi-config`:

	sudo raspi-config

	System Options/Boot
		Boot/Auto Login Select boot into desktop or to command line
			Console Autologin Text console
	Interfacing Options
		Turn on camera
		Turn on SSH
		SPI
		I2C
	Finish
		reboot = yes


You should be able to `ssh` into the PI at this point.  If you get an error like this:

	pi@raspberrypi.local: Permission denied (publickey,password).

and you are using command-line ssh then disable any local configuration you might have 
for ssh and log in like this:

	ssh -F /dev/null pi@raspberrypi.local

I install an editor that I like:

	sudo apt install vim

...and configure options that I like by creating a file named `.vimrc` in the PI home directory
and the root home directory that contains this:

	set ts=4
	setlocal cm=blowfish2
	set mouse=
	set ttymouse=
	set noshowmatch
	let g:loaded_matchparen=1
	:set t_BE=

If you cannot paste the above in to .vimrc while running vim, then do it using nano or
cat like this:

	cat - > ~/.vimrc
    set ts=4
    setlocal cm=blowfish2
    set mouse=
    set ttymouse=
    set noshowmatch
    let g:loaded_matchparen=1
    :set t_BE=

and then press `^D` (or CTRL-D if you prefer).

I add the following to the end of my .bashrc because the defaults don't make sense to me:

	export LC_CTYPE=C
	export LC_ALL=C
	export COLLATE=POSIX
	export EDITOR=vi


Prepare your `git` environment for future use:

	git config --global user.email "me@example.com"
	git config --global user.name "John Q. Public"


Since I often run my PI headless but like to be able to add an HDMI monitor to
a running system from time to time, I want to force the PI to
assume there is an HDMI monitor when it boots so that it does not default to
something else that will prevent me from seeing the screen unless the PI boots
with one already plugged in.

This can be done by adding the following to the `/boot/config.txt` file:

	hdmi_force_hotplug=1
	hdmi_group=1            # use CEA modes
	hdmi_mode=16            # 1080p60


If the PI will not be used with WiFI or bluetooth, I remove the drivers like this:

	sudo apt purge bluez -y
	sudo apt autoremove -y

...and I disable the kernel drivers for them by adding the following lines to 
the `/boot/config.txt` file:

	dtoverlay=disable-wifi
	dtoverlay=disable-bt


