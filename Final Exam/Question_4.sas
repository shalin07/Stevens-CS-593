libname heartattack "C:\Users\shali\Downloads";
proc copy in=heartattack out=work;
  select heart_attack ;
run;


* Logistic regression;
title " Heart attack treatment "; 
proc logistic data=Heart_attack descending;
  class Anger_Treatment(ref='0') /param=ref ;
  model   Heart_Attack_2 = Anger_Treatment Anxiety_Treatment;
  run;
