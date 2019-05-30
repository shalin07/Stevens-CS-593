libname Baseball "C:/Users/shali/Downloads";

proc copy in = Baseball  out= work;
  select baseball;
run;

proc sql;
 create table baseball_1 as 
  select *
  from baseball
  where at_bats ge 100;

proc sgplot data = baseball_1;
    scatter x = stolen_bases y = caught_stealing;
run;

proc reg data = baseball_1 outest = baseball_2;
    model caught_stealing = stolen_bases /;
output out = reg_stealing h = lev cookd=Cookd dffits = diffit;
quit;

proc corr data = baseball_1 cov;
    var stolen_bases caught_stealing;
run; 

*Answer a*
*Yes there is linear relationship */

*Answer b */
In scatter plot, the data does not seems to belinear. On further look we can see that large portion of data is 
concentrated in one area. This is evident by correlation coefficient. A transformation to linearity is not 
called.

*Answer d*/
R squared which is 5

*Answer e*/
RMSE

*Answer f*/
Yes It makes sense as we can be off by 2 players per the RMSE

*Answer g*/
Yes there is because Correlation Coefficient is 70%.





