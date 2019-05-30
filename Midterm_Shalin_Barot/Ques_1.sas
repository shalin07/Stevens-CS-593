libname Cereal "C:/Users/shali/Downloads";

proc copy in = Cereal  out= work;
  select cereal_ds;
run;

proc sgplot data = cereal_ds;
	scatter x = sodium y = rating;
run;

proc reg data = cereal_ds outest = cereal_ds1;
    model rating = sodium; 
output out = cereal_out h = lev cookd=Cookd dffits = diffit;
run;
quit;
