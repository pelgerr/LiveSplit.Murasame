state ("fceux") {
  byte level_id : "fceux.exe", 0x00436B04, 0x788;
  byte timer : "fceux.exe", 0x00436B00, 0x668;
}

state ("punes64") {
  byte level_id : "punes64.exe", 0xE4A6C8;
  byte timer : "punes64.exe", 0xE4A5A8;
}

start {
// Start the timer when the current level ID is 1 and the in-game timer
// begins counting down from 300
  if (current.level_id == 1 && current.timer == 2) {
    return true;
  }
}

split {
// Split when the current level ID changes
  if (current.level_id != old.level_id) {
    return true;
  }
}

reset {
// Reset when current level ID becomes 0 (system reset)
  if (old.level_id >= 1 && (current.level_id == 0 || current.level_id == 255)) {
    return true;
  }
}
