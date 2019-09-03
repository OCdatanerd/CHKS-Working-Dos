
** Cleaning
drop if (grade==6|grade==7|grade==8|grade==10|grade==12)
drop if (district=="Fountain Valley Elementary"|district=="Buena Park Elementary"|district=="Fullerton Elementary"|district=="Huntington Beach City Elementary"|district=="Ocean View"|district=="Westminster")
drop c1-ctag10
drop gs1-r42
drop sel1-sel33
drop sm1-v14_v10
drop bhc1-bhc55
drop a9_old
drop dasm1-dasm5
sort district
gen truancy= (a12_a11==5|a12_a11==6) if !missing(a12_a11)
gen absence= (a13_a12c==1|a13_a12e==1) 
gen asian= (a8b==1|a8c==1| a8d==1|a8c==1|a8e==1|a8f==1|a8g==1|a8h==1|a8j==1|a8l==1)
gen lgbt= (a112_a100b==1|a112_a100c==1) 
gen ps_safe= (a83_a71==1|a83_a71==2) if !missing(a83_a71)
gen vh_rumors= (a87_a76==2|a87_a76==3|a87_a76==4) if !missing(a87_a76)
gen vh_jokes= (a88_a77==2|a88_a77==3|a88_a77==4) if !missing(a88_a77)
gen vh_looks= (a89_a78==2|a89_a78==3|a89_a78==4) if !missing(a89_a78)
gen vh_insult= (a98_a87==2|a98_a87==3|a98_a87==4) if !missing(a98_a87)
gen vv_pushed= (a84_a73==2|a84_a73==3|a84_a73==4 ) if !missing(a84_a73)
gen vv_beaten= (a85_a74==2|a85_a74==3|a85_a74==4) if !missing(a85_a74)
gen vv_fight= (a86_a75==2|a86_a75==3|a86_a75==4) if !missing(a86_a75)
gen vv_harm= (a97_a86==2|a97_a86==3|a97_a86==4) if !missing(a97_a86)
gen vv_weapon= (a95_a84==2|a95_a84==3|a95_a84==4) if !missing(a95_a84)
gen rh_race= (a99_a88==2|a99_a88==3|a99_a88==4) if !missing(a99_a88)
gen rh_religion= (a100_a89==2|a100_a89==3|a100_a89==4) if !missing(a100_a89)
gen rh_gender= (a101_a90==2|a101_a90==3|a101_a90==4) if !missing(a101_a90)
gen rh_gay= (a102_a91==2|a102_a91==3|a102_a91==4) if !missing(a102_a91)
gen aod_alcohol= (a57_a50==2|a57_a50==3|a57_a50==4|a57_a50==5|a57_a50==6) if !missing(a57_a50)
gen aod_binge= (a58_a51==2|a58_a51==3|a58_a51==4|a58_a51==5|a58_a51==6) if !missing(a58_a51)
gen aod_mari= (a59_a52==2|a59_a52==3|a59_a52==4|a59_a52==5|a59_a52==6) if !missing(a59_a52)
gen aod_pres= (a61==2|a61==3|a61==4|a61==5|a61==6) if !missing(a61)
gen aod_two= (a63==2|a63==3|a63==4|a63==5|a63==6) if !missing(a63)
gen dd_car= (a82==2|a82==3|a82==4|a82==5) if !missing(a82)
gen au_cig= (a54_a47==2|a54_a47==3|a54_a47==4|a54_a47==5) if !missing(a54_a47)
gen du_cig= (a54_a47==6) if !missing(a54_a47)
gen au_smoke= (a55_a48==2|a55_a48==3|a55_a48==4|a55_a48==5) if !missing(a55_a48)
gen du_smoke= (a55_a48==6) if !missing(a55_a48)


** Tables
by lgbt, sort : tab grade
keep if lgbt==1
by grade, sort : tab a4, m
by grade, sort : tab a6 if lgbt==1
by grade, sort : tab a7 if lgbt==1


tab truancy
by lgbt, sort : tab truancy

tab absence 
by lgbt, sort : tab absence 

tab scare_hi 
by lgbt, sort : tab scare_hi 

tab shigh_hi 
by lgbt, sort : tab shigh_hi 

tab connect_hi 
by lgbt, sort : tab connect_hi 

tab ps_safe 
by lgbt, sort : tab ps_safe 

tab vh_rumors 
by lgbt, sort : tab vh_rumors 

tab vh_jokes 
by lgbt, sort : tab vh_jokes 

tab vh_looks 
by lgbt, sort : tab vh_looks 

tab vh_insult 
by lgbt, sort : tab vh_insult


tab vv_pushed 
by lgbt, sort : tab vv_pushed 

tab vv_beaten 
by lgbt, sort : tab vv_beaten 

tab vv_fight
by lgbt, sort : tab vv_fight

tab vv_harm 
by lgbt, sort : tab vv_harm

tab vv_weapon 
by lgbt, sort : tab vv_weapon 

tab rh_race 
by lgbt, sort : tab rh_race 

tab rh_religion 
by lgbt, sort : tab rh_religion 

tab rh_gender 
by lgbt, sort : tab rh_gender 

tab rh_gay 
by lgbt, sort : tab rh_gay 

tab aod_alcohol 
by lgbt, sort : tab aod_alcohol

tab aod_binge 
by lgbt, sort : tab aod_binge 

tab aod_mari 
by lgbt, sort : tab aod_mari 

tab aod_pres 
by lgbt, sort : tab aod_pres 

tab aod_two 
by lgbt, sort : tab aod_two

tab dd_car 
by lgbt, sort : tab dd_car 

tab au_cig 
by lgbt, sort : tab au_cig 

tab du_cig 
by lgbt, sort : tab du_cig 

tab au_smoke
by lgbt, sort : tab au_smoke

tab du_smoke 
by lgbt, sort : tab du_smoke 

tab a107_a96 
by lgbt, sort : tab a107_a96 

tab a108 
by lgbt, sort : tab a108 

tab a107_a96 
by lgbt, sort : tab a107_a96 

tab a108 
by lgbt, sort : tab a108 

** Log Regressions
logistic rh_gender lgbt
logistic rh_gay lgbt
logistic aod_alcohol lgbt
logistic aod_binge lgbt
logistic aod_mari lgbt
logistic aod_pres lgbt
logistic aod_two lgbt
logistic dd_car lgbt
logistic au_cig lgbt
logistic du_cig lgbt
logistic au_smoke lgbt
logistic du_smoke lgbt
