swAmount=3
switchID[0]=(376111)
switchID[1]=(376112)
switchID[2]=(376113)

if global.gameProgress>=4361
{
  for(i=0;i<swAmount;i+=1)
  {
    switchID[i].image_speed=1
    switchID[i].activated=2
  }
  instance_destroy()
}
