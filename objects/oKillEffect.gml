#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_alpha-=fadeAlpha/FPS_SCA
image_angle+=imageRot/FPS_SCA
if speed<=0
  instance_destroy()
