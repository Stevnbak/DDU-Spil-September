
public int bottom = 0, top = 1, left = 2, right = 3, nothing = -1;
//Check collision between 2 dynamic objects
public void checkCollision(dynamicObject object1, dynamicObject object2) {
    int side = collision(object2.location, object2.size, object1.location, object1.size);
    if(side == bottom) {
        object2.collision(object1.location.y + (object1.size.y / 2) + (object2.size.y / 2), side);
        object1.collision(object2.location.y + (object2.size.y / 2) + (object1.size.y / 2), side);
    } else if (side == top) {
        object2.collision(object1.location.y - (object1.size.y / 2) - (object2.size.y / 2), side);
        object1.collision(object2.location.y + (object2.size.y / 2) + (object1.size.y / 2), side);
    } else if (side == left) {
        object2.collision(object1.location.x - (object1.size.x / 2) - (object2.size.x / 2), side);
        object1.collision(object2.location.y + (object2.size.y / 2) + (object1.size.y / 2), side);
    }else if (side == right) {
        object2.collision(object1.location.x + (object1.size.x / 2) + (object2.size.x / 2), side);
        object1.collision(object2.location.y + (object2.size.y / 2) + (object1.size.y / 2), side);
    }
}
//Check collision between 1 static and 1 dynamic object
public void checkCollision(staticObject object1, dynamicObject object2) {
    int side = collision(object2.location, object2.size, object1.location, object1.size);
    if(side == bottom) {
        object2.collision(object1.location.y + (object1.size.y / 2) + (object2.size.y / 2), side);
        object2.friction(object1.frictionC, 0);
    } else if (side == top) {
        object2.collision(object1.location.y - (object1.size.y / 2) - (object2.size.y / 2), side);
        object2.friction(object1.frictionC, 0);
    } else if (side == left) {
        object2.collision(object1.location.x - (object1.size.x / 2) - (object2.size.x / 2), side);
        object2.friction(object1.frictionC, 1);
    }else if (side == right) {
        object2.collision(object1.location.x +  (object1.size.x / 2) + (object2.size.x / 2), side);
        object2.friction(object1.frictionC, 1);
    }
}
//new PVector(object1.location.x - (object1.size.x / 2), object1.location.y - (object1.size.y/2));
//new PVector(location2.x - (size2.x / 2), location2.y - (size2.y/2));
int collision(PVector location1, PVector size1, PVector location2, PVector size2) {
    //Y-Collision
    if (location1.x + (size1.x / 2) - 7.5 >= location2.x - (size2.x / 2) && location1.x - (size1.x / 2) + 7.5 <= location2.x + (size2.x / 2)) {
      //Bottom
      if (location1.y - (size1.y / 2) <= location2.y + (size2.y/2) && location1.y + (size1.y / 2) >= location2.y + (size2.y / 2)) {
        return bottom;
      }
      //Top
      if (location1.y + (size1.y / 2) >= location2.y - (size2.y/2)&& location1.y - (size1.y / 2) <= location2.y - (size2.y/2)) {
        return top;
      }
    }
    //X-Collision
    if (location1.y + (size1.y / 2) - 2 >= location2.y - (size2.y/2) && location1.y - (size1.y / 2) + 2 <= location2.y + (size2.y/2)) {
      //Left
      if (location1.x + (size1.x / 2) >= location2.x - (size2.x / 2) && location1.x - (size1.x / 2) <= location2.x - (size2.x / 2)) {
        return left;
      }
      //Right
      if (location1.x - (size1.x / 2) <= location2.x - (size2.x / 2) + size2.x && location1.x + (size1.x / 2) >= location2.x + (size2.x / 2)) {
        return right;
      }
    }
    //Nothing?
    return nothing;
}
