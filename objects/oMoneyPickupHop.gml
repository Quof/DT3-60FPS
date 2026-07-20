#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
if x>=oPlayer1.x
  xVel=2.5/FPS_SCA
else
  xVel=-2.5/FPS_SCA
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.gamePaused=false
{
  yVel+=0.3/FPS_SCA/FPS_SCA
  if isCollisionBottom(1)
  {
    if checkScreenArea(x,y,48)=1 {playSound(global.snd_RupeeBounce,0,1,1)}
    yVel=-5/FPS_SCA
  }
  if isCollisionLeft(1)
    xVel*=-1
  if isCollisionRight(1)
    xVel*=-1
  moveTo(xVel,yVel)

  if isCollisionSolid()
    y-=2

  if y>room_height+24
    instance_destroy()
}
