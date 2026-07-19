swAmount=2
switchID[0]=(377502)
switchID[1]=(377503)

if global.gameProgress>=4390
{
  for(i=0;i<swAmount;i+=1)
  {
    switchID[i].image_speed=1
    switchID[i].activated=2
  }
  instance_destroy()
}
