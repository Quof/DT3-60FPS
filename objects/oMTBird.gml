#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
FPS_SCA = 2
image_speed=(0.15+random(0.1))/FPS_SCA
image_xscale=choose(-1,1)
moveSpd=0.25+random(0.75)
dirChange=irandom(300)
type=0
bSpotted=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
FPS_SCA = 2

if image_xscale=1
  x+=moveSpd/FPS_SCA
else
  x-=moveSpd/FPS_SCA

if type=0
{
  dirChange+=1
  if dirChange>=480*FPS_SCA
  {
    if image_xscale=1
      image_xscale=-1
    else
      image_xscale=1
    dirChange=irandom(300*FPS_SCA)
  }
}

if bSpotted=0
{
  if checkScreenArea(x,y,2)=1
  {
    global.recBirdsSeen+=1
    bSpotted=1
  }
}
