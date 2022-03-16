init() {
    level thread broadcast();
    thread endofroundbroadcast();
    setbroadcastername();
    level.broadcast_messages = ["^1You're playing on a RawMeat MW3 Server",
    "^2This is a vanilla server. Our goal: take you back to 2011.",
    "^2Vanilla MW3 means no rebalancing, no new gamemodes, no HUD overlays.",
    "^2MW3 as you know it",
    "^2MW3 like you never left",
    "^5Get recognized with special roles for your ingame achivements on our !discord",
    "^5Got a M.O.A.B.? Send in some proof on our !discord and get the exclusive @nuker role!",
    "^5We want to hear your feedback. Please let us know what you think on our !discord",
    "^8We think: Not every server needs to be 18 players",
    "^2Throwback to 2011",
    "^5Got any ideas for modes and rules? We can host it!",
    "^5Participate in polls in our !discord to help shape the server",
    "^5Join our !discord so we can organize lobbies if player numbers are low",
    "^5This server was launched in March 2022",
    "^5This server is just a couple weeks old. Join the !discord now to get the @og role",
    "^5With map vote you can choose the next map",
    "^5Map vote with two maps because that's how the original was",
    "^5All maps are in the voting pool, the players decide...",
    "^5The choice for the next map is yours",
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
        wait 180; //interval in seconds
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
