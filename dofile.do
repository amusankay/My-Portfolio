



keep if v222<=12
keep if v024==1
tab1 v013 v025 v106 v190 v149 ethnic


Reproductive Xteristics
ta

****lookfor contraceptive use
recode v313(0/2=0 "non user") (3=1 "Current User"), gen(contrac_use)
ta contrac_use
****Number of living children****
recode v218(0=0)(1=1)(2=2)(3=3)(4=4)(5/11=5 ">4"), gen(nlc)
recode v218(0/4=1 "<= 4 children")(5/11=5 ">4"), gen(nlc_real)
ta nlc
**educatio- tab1 v621 v701 v106
***husband's desire for more children
tab1 v621 
***** education 
ta v701 v106
**** Logistics Regression****
recode v605 (1/3=1 "Wants more children") (else=0 "Wants no more children"), gen(ferti_desir)
recode v613 (0/4=1 "<=4 children")(else=2 ">4 children"), gen(inc)
logistic contrac_use i.ferti_desir
logistic contrac_use 
logistic contrac_use    

///Bivareat relationship between demographics and contraceptive use///
logistic contrac_use i.v013
logistic contrac_use i.v025
logistic contrac_use i.v106
logistic contrac_use i.v621
logistic contrac_use i.wealth_index
logistic contrac_use i.ethnic

order v013 v025 v106 v621 contrac_use nlc ferti_desir inc anten_visits breastfeeding wealth_index ethnic nlc_real age_cat
keep v013 v025 v106 v621 contrac_use nlc ferti_desir inc anten_visits breastfeeding wealth_index ethnic nlc_real age_cat
///Bivariate /////logistic contrac_use i.ferti_desir i.inc i.anten_visits i.breastfeeding i.nlc_real
logistic contrac_use i.ferti_desir    
logistic contrac_use i.inc
logistic contrac_use i.anten_visits
logistic contrac_use i.breastfeeding
logistic contrac_use i.nlc_real


///Multivariate Analysis
logistic contrac_use i.age_cat i.v025 i.v106 i.wealth_index i.ethnic
///// Edit please/////
use "C:\Users\P-kay\OneDrive\Desktop\maleeks.dta" 
set maxvar 32676
use "C:\Users\P-kay\OneDrive\Desktop\maleeks.dta" 
ta v025
do "C:\Users\P-kay\OneDrive\Desktop\maleeks_dofile.do"
logistic contrac_use i.nlc i.ferti_desir i.inc
lookfor antenatal
ta m14_1
ta m14_1
ta m14_1, nola
recode m14_1(0=0 "No Antenatal Visits")(else=1 "Antenatal Visits"), gen(antenatal visits)
recode m14_1(0=0 "No Antenatal Visits")(else=1 "Antenatal Visits"), gen(anten_visits)
ta anten_visits
////Logistics Multivariate/////
logistic contrac_use i.ferti_desir i.inc i.anten_visits i.breastfeeding i.nlc_real
menstruation
lookfor menstruation
lookfor menses
lookfor amenorhoea
lookfor husband
ta v3a08j
lookfor contraceptive use
tab1 v361 v362 v364 v367
ta contraceptive use
ta contrac_use
logistic contrac_use i.v362
ta v375a
tab1 v375a v376 v376a
ta v379
ta v380
lookfor amenorhea
lookfor amenorhoea
lookfor breastfeeding
ta v404
logistic contrac_use i.v404
lookfor breastfeeding
ta m4_1
ta m4_2
ta m4_3
ta m4_3
ta m4_4
ta m5_1
ta m5_1, nola
recode m5_1(0/5=1 "< 6 months") (6/12=2 ">=6") (else=1), gen(breastfeeding)
ta breastfeeding
logistic contrac_use i.breastfeeding
