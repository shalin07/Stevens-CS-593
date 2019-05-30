/*1.15 solution */
libname Baseball "C:/Users/shali/Downloads";

proc copy in = Baseball  out= work;
  select baseball;
run;


proc sql;
 create table baseball_1 as 
  select *
  from baseball
  where at_bats ge 100;



proc standard data= baseball_1  mean = 0
 std=1
 out = baseball_2;

var age games	at_bats	runs hits doubles triples homeruns RBIs	walks strikeouts bat_ave on_base_pct slugging_pct stolen_bases caught_stealing ;

run;
proc print data=baseball_2;
run;


/* 1.16 solution*/

proc princomp   data= Baseball  out=baseball_pca ;
    var age games at_bats runs hits doubles triples RBIs walks strikeouts bat_ave on_base_pct slugging_pct stolen_bases caught_stealing ;
run;
proc corr data=baseball_pca;
 var Prin1 Prin2 Prin3 Prin4 Prin5 Prin6 Prin7 Prin8 Prin9 Prin10 Prin11 Prin12 Prin13 Prin14 Prin15 ;
run; 

*1.17 solution */
From eigen values table we got, we are using almost 90% of the vaiability by 
selecting 5 features. And If we chose 6 components, we'll cover > 90%
