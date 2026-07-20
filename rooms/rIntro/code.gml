set_application_title("DT3: Saved Game")



global.paraString[0]="DT3data.dts"

//Check if command line arguments were given
var pNum;
pNum=parameter_count()
if pNum>0
{
  var i;
  for(i=0;i<pNum;i+=1)
  {
    global.paraString[i]=parameter_string(i+1)
  }
}

//Initialize
global.modeSpeed=0
globalvar FPS_SCA;
FPS_SCA=4 //QWH
globalvar gDeltaTime, gDeltaDoTicks, gDeltaTick;
gDeltaTime = 1/FPS_SCA
gDeltaDoTicks = 0
gDeltaTick = 0.0
global.gameFrameRate=30*FPS_SCA

global.bNightmareMode=0
global.bCanUseEsc=1
global.ctrlUp="W"
global.ctrlDown="S"
global.ctrlLeft="A"
global.ctrlRight="D"
global.ctrlJump="J"
global.ctrlCharSwap="U"
global.ctrlAbilSwap="I"
global.ctrlActA="K"
global.ctrlActB="L"
global.ctrlActC="O"
if !instance_exists(oKeyCodes)
{
  instance_create(0,0,oKeyCodes)
}
room_goto(rTitle)
