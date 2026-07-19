image_yscale=4
swAmount=2
switchID[0]=(381924)
switchID[1]=(381925)

if global.gameProgress>=4460
{
  for(i=0;i<swAmount;i+=1)
  {
    switchID[i].image_speed=1
    switchID[i].activated=2
  }
  instance_destroy()
}
