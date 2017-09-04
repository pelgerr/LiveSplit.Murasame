state ("fceux") {
  byte level_id : "fceux.exe", 0x00436B04, 0x788;
  byte timer : "fceux.exe", 0x00436B00, 0x668;
}

start {
  if (current.level_id == 1  && current.timer == 2) {
    return true;
  }
}

split {
  if (current.level_id != old.level_id) {
    return true;
  }
}

reset {
  if (old.level_id >= 1 && current.level_id == 0) {
    return true;
  }
}