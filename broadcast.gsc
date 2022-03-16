init() {
    level thread broadcast();
    thread endofroundbroadcast();
    setbroadcastername();
    level.broadcast_messages = ["^2This is a vanilla server. Our goal: take you back to 2011.",
    "^5Get recognized with special roles for your ingame achivements on our !discord",
    "We want to hear your feedback. Please let us know what you think on our !discord",
    "^8Not every server needs to be 18 players",
    "^2Throwback to 2011",
    "Got any ideas for modes and rules? We can host it!",
    "^5Join our !discord so we can organize lobbies if player numbers are low",
    "This server was launched in March 2022",
    "This server is less than a month old. Join the !discord now to get the @og role",
    "^1dsc.gg/rawmeat"];
    level.broadcast_messages_things_players_never_say = [
    "What are your things MW3 players (never) say?",
    "Things MW3 players never say: 1 more round",
    "Things MW3 players never say: 1 before the predator!!!",
    "Things MW3 players never say: Why do I always get hit with the predator?"];
    level.broadcast_mode = "random"; // "random" or "sequential"
    level.broadcast_message_endofround1 = "^2Thanks for playing!";
    level.broadcast_message_endofround2 = "^2If you enjoyed the round (or to complain), join our discord: ^1dsc.gg/rawmeat";
    
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

// you can delete this block and line 4 if you want to set `set sv_sayName` in server.cfg (default line 80).
setbroadcastername() {
    broadcaster_name = "^7Server^7";
    cmdexec("sv_sayName " + broadcaster_name);
}

broadcast() {
    message_index = -1;

    while (true) {
        wait 120; //interval in seconds
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

// This is a special message that is broadcasted when the round is over.
endofroundbroadcast() {
	level waittill("game_ended");
	wait 0.1;
    cmdexec("say "+level.broadcast_message_endofround1);
    wait 1.0;
    cmdexec("say "+level.broadcast_message_endofround2);
}
