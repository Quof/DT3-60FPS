/*
Any object that has the collision bounds set can use this script.
(To set the collision bounds, call the script "setCollisionBounds.")
If the object collides into a solid when moving the specified distance,
the object will stop precisely at the solid.
If the object collides into a "moveable solid," it will stop and push the
moveable solid.
This function also pushes moveable solids and allows the character to land on platforms.
Note: First the script moves the object in the x direction, then in
the y direction.
Once the function is finished, one can use the xVelInteger and yVelInteger variables for
more precise calculations inside of the engine.
0: x distance to move
1: y distance to move

Subpixel handling: fractional distances are accumulated per-instance in
mtXRemainder/mtYRemainder and only committed to whole pixels once the running
total crosses an integer boundary. This replaces the old oGame.time-based
dithering, which only averaged correctly when a speed's fractional part was
an exact unit fraction (1/2, 1/3, 1/4...) — any other fractional speed (0.6,
0.7, 0.3, etc.) was silently rounded to the nearest achievable unit fraction
instead of its true value. The accumulator below is exact for any speed and
any room_speed, so it never needs revisiting if the frame rate changes again.
*/
mtXPrev=x
mtYPrev=y

//lazily initialize this instance's persistent subpixel remainder the first time it calls moveTo
if variable_local_exists("mtXRemainder")=0
  mtXRemainder=0
if variable_local_exists("mtYRemainder")=0
  mtYRemainder=0

//accumulate this call's exact requested distance, then commit only the whole-pixel part
mtXRemainder+=argument0
xVelInteger=round(mtXRemainder)
mtXRemainder-=xVelInteger

mtYRemainder+=argument1
yVelInteger=round(mtYRemainder)
mtYRemainder-=yVelInteger

//object is moving to the right
if xVelInteger>0
  for(x=x;x<mtXPrev+xVelInteger;x+=1)
  {
    solidId=getIdCollisionRight(1)
    //if there is a collision with a solid
    if solidId>0
    {
      if object_get_parent(solidId.object_index)=oMoveableSolid and canPushMoveableSolids()
      {
        //we must move the moveable solid, unless there is another solid (moveable or non-moveable) in it's way
        with solidId
        {
          if place_meeting(x+1,y,oSolid)      //there will be a collision!
          {
            break
          }
          else
          {
            x+=1             //we're free to move the moveable solid
          }
        }
      }
      else
        break
    }    
  }
//object is moving to the left
if xVelInteger<0
  for(x=x;x>mtXPrev+xVelInteger;x-=1)
  {
    solidId=getIdCollisionLeft(1)
    //if there is a collision with a solid
    if solidId>0
    {
      if object_get_parent(solidId.object_index)=oMoveableSolid and canPushMoveableSolids()
      {
        //we must move the moveable solid, unless there is another solid (moveable or non-moveable) in it's way
        with solidId
        {
          if place_meeting(x-1,y,oSolid)      //there will be a collision!
          {
            break
          }
          else
          {
            x-=1             //we're free to move the moveable solid
          }
        }
      }
      else
        break
    } 
  }  
//object is moving down
if yVelInteger>0
  for(y=y;y<mtYPrev+yVelInteger;y+=1)
  {
    if isCollisionBottom(1)
      break
    if canLandOnPlatforms()
      if isCollisionPlatform()=0 and isCollisionPlatformBottom(1) and kDown=0
        break
  }
//object is moving up
if yVelInteger<0
  for(y=y;y>mtYPrev+yVelInteger;y-=1)
  {
    if isCollisionTop(1)
      break
  }
