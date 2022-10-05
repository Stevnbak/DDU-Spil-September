import de.bezier.data.sql.*;
SQLite db;

//Levels
int[] levelGet(int level) {
  int[] array = new int[4];
  int levelID = 0;
  db = new SQLite(this, "database.sqlite");
  //Find level id
  if (db.connect()) {
    db.query("SELECT Level" + level + "ID FROM Saves WHERE ID = " + saveID + ";");
    while (db.next()) {
      levelID = db.getInt("Level" + level + "ID");
      db.query("SELECT Killed, Escaped, Time, Smell FROM LevelInfo WHERE ID = " + levelID + ";");
      while (db.next()) {
        array[0] = db.getInt("Killed");
        array[1] = db.getInt("Escaped");
        array[2] = db.getInt("Time");
        array[3] = db.getInt("Smell");
      }
    }
  }
  db.close();
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
        db.execute("UPDATE Saves SET Level" + level + "ID = " + levelID + " WHERE ID = " + saveID + ";");
      }
    }
    db.query("SELECT Level" + level + "ID FROM Saves WHERE ID = " + saveID + ";");
    while (db.next()) {
      int levelID = db.getInt("Level" + level + "ID");
      db.execute("UPDATE LevelInfo SET Level = " + level + ", Killed = " + killed + ", Escaped = " + escaped + ", Time = " + time + ", Smell = " + smell + " WHERE ID = " + levelID + ";");
    }
  }
  db.close();
  //Add level id to save if none
}
//Save info
String nameGet(int saveID) {
  //Get save name
  String name = "";
  db = new SQLite(this, "database.sqlite");
  if (db.connect()) {
    db.query("SELECT Name FROM Saves WHERE ID = " + saveID + ";");
    while (db.next()) {
      name = db.getString("Name");
    }
  }
  db.close();
  return name;
}
int difficultyGet(int saveID) {
  //Get save difficulty
  int difficulty = 0;
  db = new SQLite(this, "database.sqlite");
  if (db.connect()) {
    db.query("SELECT Difficulty FROM Saves WHERE ID = " + saveID + ";");
    while (db.next()) {
      difficulty = db.getInt("Difficulty");
    }
  }
  db.close();
  return difficulty;
}
String characterGet() {
  //Get save character
  String character = "";
  db = new SQLite(this, "database.sqlite");
  if (db.connect()) {
    db.query("SELECT PlayerCharacter FROM Saves WHERE ID = " + saveID + ";");
    while (db.next()) {
      character = db.getString("PlayerCharacter");
    }
  }
  db.close();
  println(character);
  return character;
}
boolean introGet() {
  //Get save introPlayed
  boolean introGrab = false;
  db = new SQLite(this, "database.sqlite");
  if (db.connect()) {
    db.query("SELECT IntroPlayed FROM Saves WHERE ID = " + saveID + ";");
    while (db.next()) {
      introGrab = db.getInt("IntroPlayed") == 1 ? true : false;
    }
  }
  db.close();
  println("Intro gotten as " + introGrab);
  return introGrab;
}
void introSet(boolean intro) {
  //Set save introPlayed'
  println("Intro set to " + intro);
  db = new SQLite(this, "database.sqlite");
  if (db.connect()) {
    db.execute("UPDATE Saves SET IntroPlayed = " + (intro ? 1 : 0) + " WHERE ID = " + saveID + ";");
  }
  db.close();
}
int deathGet(int saveID) {
  //Get save deaths
  int death = 0;
  db = new SQLite(this, "database.sqlite");
  if (db.connect()) {
    db.query("SELECT Deaths FROM Saves WHERE ID = " + saveID + ";");
    while (db.next()) {
      death = db.getInt("Deaths");
    }
  }
  db.close();
  return death;
}
void deathSet(int deaths) {
  //Set save deaths
  db = new SQLite(this, "database.sqlite");
  if (db.connect()) {
    db.execute("UPDATE Saves SET Deaths = " + deaths + " WHERE ID = " + saveID + ";");
  }
  db.close();
}
//Create save
void createSave(String name, int difficulty) {
  db = new SQLite(this, "database.sqlite");
  if (db.connect()) {
    db.execute("INSERT INTO Saves (Name, Difficulty, IntroPlayed) VALUES ('" + name + "', '" + difficulty + "', 'false');");  
    db.query("SELECT ID FROM Saves ORDER BY ID DESC;");
    while (db.next()) {
        saveID = db.getInt("ID");
        break;
    }
  }
  db.close();
}
ArrayList<Integer> getSaves() {
  ArrayList<Integer> array = new ArrayList<Integer>();
  db = new SQLite(this, "database.sqlite");
  if (db.connect()) {
    db.query("SELECT ID FROM Saves;");
    while (db.next()) {
      array.add(db.getInt("ID"));
    }
  }
  db.close();
  return array;
}
void removeSave(int saveID) {
  db = new SQLite(this, "database.sqlite");
  if (db.connect()) {
    db.execute("DELETE FROM Saves WHERE ID = " + saveID + ";");
  }
  db.close();
}
