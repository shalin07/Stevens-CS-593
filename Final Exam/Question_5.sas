libname breastcancer "C:\Users\shali\Downloads";

proc copy in=breastcancer  out=work ;
   select breast_cancer_data;
run;


PROC STANDARD
     DATA=breast_cancer_data MEAN=0 STD=1
     OUT=cancer_z;
  VAR radius_mean texture_mean perimeter_mean area_mean  smoothness_mean
       compactness_mean concavity_mean concave_points_mean symmetry_mean fractal_dimension_mean; 
run;



proc corr data=cancer_z cov;
 VAR radius_mean texture_mean perimeter_mean area_mean  smoothness_mean
       compactness_mean concavity_mean concave_points_mean symmetry_mean fractal_dimension_mean; 
run;

*PCA;
title " PCA breast cancer"; 
proc princomp   data=cancer_z  out=PCA_cancer_z;
VAR radius_mean texture_mean perimeter_mean area_mean  smoothness_mean
       compactness_mean concavity_mean concave_points_mean 
        symmetry_mean fractal_dimension_mean;

run;
