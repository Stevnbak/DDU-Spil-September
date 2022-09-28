import de.bezier.data.sql.*;

//Levels
int[] levelGet(int level, int saveID) {
    int[] array = new int[4];
    //Find level id

    //Get level info
    
    return array;
}
void levelSet(int level, int saveID, int killed, int escaped, int time, int smell) {
    //Update level info

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
boolean introGet(int saveID) {
    //Get save introPlayed
    return false;
}
void introSet(int saveID, boolean intro) {
    //Set save introPlayed
}
int deathGet(int saveID) {
    //Get save deaths
    return 0;
}
void deathSet(int saveID, int deaths) {
    //Set save deaths
}
//Create save
void createSave(String name, int difficulty) {
    
}
