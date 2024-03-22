capture log close
log using "Sparkman_et_al_assignment_stub_stata", smcl replace
//_1
clear
import delimited "./../data/41467_2022_32412_MOESM4_ESM.csv"
//_2
gen perceived_concern = grid_gts1_1_gts1
gen female = 1*(resp_gender == 2)
gen college_grad = 1*(usedu3 > 9)
//_3
graph bar (mean) perceived_concern, over(party_id) ///
    title("Mean Perceived Concern by Party ID") ///
    ytitle("Mean Perceived Concern") ///
    b2title("Party ID") ///
    name(mean_perceived_concern, replace)
//_4
reg perceived_concern female, robust
reg perceived_concern college_grad, robust
//_5
gen cnn_msnbc = 0
replace cnn_msnbc = 1 if grid_gts3_1_gts3 >= 3
reg perceived_concern cnn_msnbc, robust
//_6
gen fox = 0
replace fox = 1 if grid_gts3_6_gts3 >= 3
reg perceived_concern fox, robust
//_7
gen under_thirty = 0
replace under_thirty = 1 if resp_age < 30
reg perceived_concern under_thirty, robust
//_8
gen thirties = 0
replace thirties = 1 if resp_age >= 30 | resp_age < 40
reg perceived_concern thirties, robust
//_9
gen forties = 0
replace forties = 1 if resp_age >= 40 | resp_age < 50
reg perceived_concern forties, robust
//_10
gen fifties = 0
replace fifties = 1 if resp_age >= 50 | resp_age < 60
reg perceived_concern fifties, robust
//_11
gen sixties = 0
replace sixties = 1 if resp_age >= 60 | resp_age < 70
reg perceived_concern sixties, robust
//_12
gen over_seventy = 0
replace over_seventy = 1 if resp_age >= 70
//_^
log close
