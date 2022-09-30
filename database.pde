import de.bezier.data.sql.*;
SQLite db;

//Levels
int[] levelGet(int level) {
    int[] array = new int[4];
    //Find level id

    //Get level info
    
    return array;
}
void levelSet(int level, int killed, int escaped, int time, int smell) {
  //Update level info
  db = new SQLite(this, "database.sqlite");
  if (db.connect()) {
    db.query("SELECT Level" + level + "ID FROM Saves WHERE Level" + level + "ID IS NULL AND ID=" + saveID + ";");
    while (db.next()) {
      db.execute("INSERT INTO LevelInfo (Level, Killed, Escaped, Time, Smell) VALUES ('" + level + "', '0', '0', '0', '0');");
      db.query("SELECT ID FROM LevelInfo WHERE Time=0;");
      while (db.next()) {
        int levelID = db.getInt("ID");
        db.execute("UPDATE Saves SET Level" + level + "ID = " + levelID + "WHERE ID = " + saveID + ";");
      }
    }
    db.query("SELECT Level" + level + "ID FROM Save WHERE ID = " + saveID + ";");
    while (db.next()) {
      int levelID = db.getInt("Level" + level + "ID");
      db.execute("UPDATE LevelInfo SET Killed = " + killed + ", Escaped = " + escaped + ", Time = " + time + ", Smell = " + smell + " WHERE ID = " + levelID + ";");
    }
  }
  db.close();
  //Add level id to save if none
}
//Save info
String nameGet(int saveID) {
    //Get save name
    return "";
}
int difficultyGet(int saveID) {
    //Get save difficulty
    return 0;
}
boolean introGet() {
    //Get save introPlayed
    return false;
}
void introSet(boolean intro) {
    //Set save introPlayed
}
int deathGet(int saveID) {
    //Get save deaths
    return 0;
}
void deathSet(int deaths) {
    //Set save deaths
}
//Create save
void createSave(String name, int difficulty) {
  db = new SQLite(this, "database.sqlite");
  if (db.connect()) {
    db.execute("INSERT INTO Saves (Name, Difficulty, IntroPlayed) VALUES ('" + name + "', '" + difficulty + "', 'false');");  
    db.query("SELECT ID FROM Saves ORDER BY ID DESC");
    while (db.next()) {
        saveID = db.getInt("ID");
        break;
    }
  }
  db.close();
}
