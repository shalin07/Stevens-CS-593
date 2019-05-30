/*Q3*/

libname lung "C:/Users/shali/Downloads";
proc copy in=sasdata out=work;
  select lung ;
run;


*Multiple regression;

proc reg data=lung outest= out_lung;
model Height_oldest_child= Age_oldest_child Weight_oldest_child Height_mother Weight_mother Height_father Weight_father/ stb vif dwProb dw r;
Output Out=reg_lung
h=lev cookd=Cookd dffits=diffit;
quit;
Proc univariate data=reg_OUT;
var lev Cookd diffit;
run;


/* Forward selection  */
title   " Forward selection ";
Proc reg data = lung  outest=out_lung;
model Height_oldest_child =  Age_oldest_child weight_Oldest_child
                             Height_Mother weight_Mother
                             Height_Father Weight_Father
                                  /  SELECTION = FORWARD stb vif dwProb dw  ; 
output out=reg_Lung
h= lev cookd =cookd dffits=difft;
quit; 


/* Backward selection  */
title   " Backward selection";
Proc reg data = lung  
outest=out_lung;
model Height_oldest_child =  Age_oldest_child weight_Oldest_child Height_Mother
                             weight_Mother Height_Father Weight_Father
                                 /  SELECTION = backward stb vif dwProb dw  ; 
output out=reg_Lung_bcw 
h= lev cookd =cookd dffits=difft; 
quit; 

/* Stepwise selection  */
title   " Stepwise selection";
Proc reg data = lung  outest=out_lung;
model Height_oldest_child =  Age_oldest_child weight_Oldest_child Height_Mother
                             weight_Mother Height_Father Weight_Father
                                 /  SELECTION = stepwise stb vif dwProb dw  ; 
output out=reg_Lung h= lev cookd =cookd dffits=difft; 
quit;


/* Subset MAXR */
title   " subset procedure";
Proc reg data = lung  outest=out_lung;
model Height_oldest_child =  Age_oldest_child Weight_oldest_child Height_mother
         Weight_mother Height_father Weight_father /  SELECTION = MAXR stb vif dwProb dw  ; 
output out=reg_Lung_MX 
h= lev cookd =cookd dffits=difft; 

quit;
