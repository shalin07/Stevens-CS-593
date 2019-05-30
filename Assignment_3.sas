libname sasdata "C:/Users/shali/Downloads";

proc copy in = sasdata  out= work;
  select nutrition;
run;

proc reg data = nutrition outest = est_calories;
    model calories = WT_GRAMS PC_WATER PROTEIN FAT SAT_FAT MONUNSAT POLUNSAT CHOLEST CARBO CALCIUM PHOSPHOR IRON POTASS SODIUM VIT_A_IU VIT_A_RE THIAMIN RIBOFLAV NIACIN ASCORBIC CAL_GRAM IRN_GRAM PRO_GRAM FAT_GRAM /;
    output out = FULLMODEL_NUTRITION h = lev cookd=Cookd dffits = diffit;
quit;


proc reg data = nutrition outest = Calories;
    model calories = WT_GRAMS PC_WATER PROTEIN FAT SAT_FAT MONUNSAT POLUNSAT CHOLEST CARBO CALCIUM PHOSPHOR IRON POTASS SODIUM VIT_A_IU VIT_A_RE THIAMIN RIBOFLAV NIACIN ASCORBIC CAL_GRAM IRN_GRAM PRO_GRAM FAT_GRAM
    / SELECTION = FORWARD;
    output out = Forward_Model_Nutrition h = lev cookd=Cookd dffits = diffit;
quit;

proc reg data = nutrition outest = Calories;
    model calories = WT_GRAMS PC_WATER PROTEIN FAT SAT_FAT MONUNSAT POLUNSAT CHOLEST CARBO CALCIUM PHOSPHOR IRON POTASS SODIUM VIT_A_IU VIT_A_RE THIAMIN RIBOFLAV NIACIN ASCORBIC CAL_GRAM IRN_GRAM PRO_GRAM FAT_GRAM
    / SELECTION = BACKWARD;
    output out = Backward h = lev cookd=Cookd dffits = diffit;
quit;

proc reg data = nutrition outest = Calories;
    model calories = WT_GRAMS PC_WATER PROTEIN FAT SAT_FAT MONUNSAT POLUNSAT CHOLEST CARBO CALCIUM PHOSPHOR IRON POTASS SODIUM VIT_A_IU VIT_A_RE THIAMIN RIBOFLAV NIACIN ASCORBIC CAL_GRAM IRN_GRAM PRO_GRAM FAT_GRAM
    / SELECTION = STEPWISE;
    output out = Stepwise h = lev cookd=Cookd dffits = diffit;
quit;

proc reg data = nutrition outest = Calories;
    model calories = WT_GRAMS PC_WATER PROTEIN FAT SAT_FAT MONUNSAT POLUNSAT CHOLEST CARBO CALCIUM PHOSPHOR IRON POTASS SODIUM VIT_A_IU VIT_A_RE THIAMIN RIBOFLAV NIACIN ASCORBIC CAL_GRAM IRN_GRAM PRO_GRAM FAT_GRAM
    / SELECTION = maxr;
    output out =  h = lev cookd=Cookd dffits = diffit;
quit;

*/ Answer b
/For Backward elimination: -  4 variables were removed. 18 variables were chosen. 
The Forward selection:  all 22 were chosen. 
The Dtep wise selection: 18 variables were chosen.  
