swAmount=3
switchID[0]=(247442)
switchID[1]=(247443)
switchID[2]=(247444)

if global.gameProgress>=2280
{
  for(i=0;i<swAmount;i+=1)
    switchID[i].activated=2
  instance_destroy()
}
