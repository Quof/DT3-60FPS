image_yscale=7
swAmount=6
switchID[0]=(438460)
switchID[1]=(438461)
switchID[2]=(438463)
switchID[3]=(438464)
switchID[4]=(438465)
switchID[5]=(438466)

if global.gameProgress>=5120
{
  for(i=0;i<swAmount;i+=1)
  {
    switchID[i].activated=1
  }
}
