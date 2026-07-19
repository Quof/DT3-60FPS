bShowArrow=true
exitType=0
newMapX=168
newMapY=288
toRoom=rExtGateF_1
newDraw=1
image_blend=c_maroon

var instrProg;
instrProg=string_char_at(global.eGateProg,6)
if instrProg="8" {instance_destroy()}
