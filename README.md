# mw3-simple-broadcast
 Post an ingame message in a set interval, in a random or sequential order. Should work in IW5 MW3, T6 BO2 and T4 WAW.

## Installation:
* Download the .gsc file from the main repository.
* Place the .gsc file at %localappdata%/plutonium/storage/iw5/scripts.
* Note: Create folders if they do not exist.

## Settings
It's all explained pretty well in the .gsc file. All you have to touch is the `init()` block and the interval `wait` in the beginning of the `broadcast()` block. The ^ at the start of a message string designates a color, same in the server name setup. 

**Random mode**: a random message is pulled every time the interval ends. This is good if you don't want the messages to get boring and they have no connection

**Sequential mode**: server messages are posted in sequential order. This is good if a user needs to have read the previous message to understand this one.

**End of round message**: While the other messages are posted at a certain frequency, this server message is posted at the end of the round.

**Broadcaster Name**: This is the name that's in front of the server message. It modifies the server setting, so if you use any other mods that send messages it should be changed for them too, so use with caution.

## Screenshot
![Preview](https://github.com/cachho/mw3-simple-broadcast/blob/main/screenshot.png?raw=true)
