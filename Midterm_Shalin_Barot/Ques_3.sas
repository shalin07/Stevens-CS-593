libname Lung "C:/Users/shali/Downloads";

proc copy in = Lung  out= work;
  select lung;
run;

proc standard 
 data= lung mean=0 std=1
 out= norm_lung;
 var weight_ father height_father;
 run;

Proc reg data = lung outest= lung_1;
model FEV1_father=Height_father Weight_father  / stb vif dwprob dw r;
output out=lung_out
h= lev cookd =cookd dffits=difft;
quit;
