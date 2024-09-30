function game_restart() {
    // Reset any global variables
    global.gamePaused = false;
    // Reset other variables here, e.g., score, lives, etc.
    // global.score = 0;
    // global.lives = 3;

    // Go back to the initial room
    room_goto(ROOM_START);
}