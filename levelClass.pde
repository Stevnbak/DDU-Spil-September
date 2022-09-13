class level {
  PVector wind = new PVector(0.075, 0);
  //ArrayList<staticObject> objects = new ArrayList<staticObject>();
  PVector spawnLocation = new PVector(width /2, height / 2);

  level(String levelName) {
    String[] lines = loadStrings("levels/" + levelName + ".txt");
    for (int i = 0; i < lines.length; i++) {
      String[] temp = split(lines[i], ":");
      String type = trim(temp[0]);
      String[] values = split(temp[1].replace("[", "").replace("]", ""), ",");
      if (type.equals("object")) {
        objects.add(new staticObject(new PVector(int(values[0]), -int(values[1])), new PVector(int(values[2]), int(values[3])), ""));
      } else if (type.equals("spawn")) {
        player.location = new PVector(int(values[0]), -int(values[1]));
      } else if (type.equals("animal")) {
      } else if (type.equals("size")) {
        //Side wall exits?
        if(int(values[0]) != 0)  {
          //Left wall
          objects.add(new staticObject(new PVector(-int(values[0]) / 2 - 50, -int(values[1]) / 2), new PVector(100, int(values[1]) + 200), "none.png"));
          //Right wall
          objects.add(new staticObject(new PVector(int(values[0]) / 2 + 50, -int(values[1]) / 2), new PVector(100, int(values[1]) + 200), "none.png"));
          //Add roof
          objects.add(new staticObject(new PVector(0, -int(values[1]) - 250), new PVector(int(values[0]), 500), "none.png"));
        } else {
          //Add "infinite" roof
          objects.add(new staticObject(new PVector(0, -int(values[1]) - 250), new PVector(width * 2000, 500), "none.png"));
        }
      }
    }
    //Add "infinite" floor
    objects.add(new staticObject(new PVector(0, height / 2), new PVector(width * 2000, height), ""));
  }
}
