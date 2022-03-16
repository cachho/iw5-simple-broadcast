init() {
    level thread broadcast();
    setbroadcastername();
    level.broadcast_messages = ["^1Alpha","^2Beta","^3Gamma","^4Delta","^5Epsilon"];
    level.broadcast_mode = "sequential"; // "random" or "sequential"
    
    /* 
    * Color cheat-sheet
    * ^0 = Black
    * ^1 = Red
    * ^2 = Green
    * ^3 = Yellow
    * ^4 = Blue
    * ^5 = Cyan
    * ^6 = Pink
    * ^7 = White
    * ^8 = Black
    */

}

// you can delete this block and line 3 if you want to set set sv_sayName in server.cfg (default line 80).
setbroadcastername() {
    broadcaster_name = "^7Server^7";
    cmdexec("sv_sayName " + broadcaster_name);
}

broadcast() {
    message_index = -1;

    while (true) {
        wait 50; //interval in seconds
        if (level.broadcast_mode == "random") {
            message_index = randomint(level.broadcast_messages.size);
        } else if (level.broadcast_mode == "sequential") {
            if (message_index >= level.broadcast_messages.size - 1) {
                message_index = 0;
            } else {
                message_index += 1;
            }
        }

        cmdexec("say "+ level.broadcast_messages[message_index]);
    }
}