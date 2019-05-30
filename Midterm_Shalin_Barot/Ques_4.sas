libname sasdata "C:/Users/shali/Downloads";

proc copy in = sasdata  out= work;
  select depression;
run;

proc Standard
    Data = depression mean = 0 std = 1
    OUT = depression_1;
    var cat_01 cat_02 cat_03 cat_04 cat_05
        cat_06 cat_07 cat_08 cat_09 cat_10
        cat_11 cat_12 cat_13 cat_14 cat_15
        cat_16 cat_17 cat_18 cat_19 cat_20;
run;

proc princomp data = std_depression out = depression_pca;
    var cat_01 cat_02 cat_03 cat_04 cat_05
        cat_06 cat_07 cat_08 cat_09 cat_10
        cat_11 cat_12 cat_13 cat_14 cat_15
        cat_16 cat_17 cat_18 cat_19 cat_20;
run;
