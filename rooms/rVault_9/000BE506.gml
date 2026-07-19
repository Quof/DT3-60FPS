swAmount=3
switchID[0]=(250098)
switchID[1]=(250099)
switchID[2]=(250100)

if global.newMapX>1000
{
  for(i=0;i<swAmount;i+=1)
    switchID[i].activated=2
  instance_destroy()
}
