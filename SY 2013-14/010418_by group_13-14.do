
codebook, compact


drop if (grade==6|grade==7|grade==8|grade==10|grade==12)
drop if (district=="Buena Park Elementary"|district=="Fountain Valley Elementary"|district=="Fullerton Elementary"|district=="Huntington Beach City Elementary"|district=="La Habra City Elementary"|district=="Ocean View"|district=="Westminster")
drop c1-ctag10
drop gs1-r42
drop sel1-sel33
drop sm1-v14_v10
drop bhc1-bhc55
drop a9_old
drop dasm1-dasm5
sort district

** Create Variables
gen homeless= (a8==2|a8==3|a8==4|a8==6|a8==7) if !missing(a8)
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
tab grade
by grade, sort : tab a4, m
by grade, sort : tab a6
by grade, sort : tab a7



by grade, sort : tab truancy if a6==2
by grade, sort : tab truancy if a7==1
by grade, sort : tab truancy if a7==3
by grade, sort : tab truancy if a7==4
by grade, sort : tab truancy if a7==5
by grade, sort : tab truancy if a7==6

by grade, sort : tab absence if a6==2
by grade, sort : tab absence if a7==1
by grade, sort : tab absence if a7==2
by grade, sort : tab absence if a7==3
by grade, sort : tab absence if a7==4
by grade, sort : tab absence if a7==5
by grade, sort : tab absence if a7==6

by grade, sort : tab scare_hi if a6==2
by grade, sort : tab scare_hi if a7==1
by grade, sort : tab scare_hi if a7==2
by grade, sort : tab scare_hi if a7==3
by grade, sort : tab scare_hi if a7==4
by grade, sort : tab scare_hi if a7==5
by grade, sort : tab scare_hi if a7==6

by grade, sort : tab shigh_hi if a6==2
by grade, sort : tab shigh_hi if a7==1
by grade, sort : tab shigh_hi if a7==2
by grade, sort : tab shigh_hi if a7==3
by grade, sort : tab shigh_hi if a7==4
by grade, sort : tab shigh_hi if a7==5
by grade, sort : tab shigh_hi if a7==6

by grade, sort : tab connect_hi if a6==2
by grade, sort : tab connect_hi if a7==1
by grade, sort : tab connect_hi if a7==2
by grade, sort : tab connect_hi if a7==3
by grade, sort : tab connect_hi if a7==4
by grade, sort : tab connect_hi if a7==5
by grade, sort : tab connect_hi if a7==6

by grade, sort : tab ps_safe if a6==2
by grade, sort : tab ps_safe if a7==1
by grade, sort : tab ps_safe if a7==2
by grade, sort : tab ps_safe if a7==3
by grade, sort : tab ps_safe if a7==4
by grade, sort : tab ps_safe if a7==5
by grade, sort : tab ps_safe if a7==6

by grade, sort : tab vh_rumors if a6==2
by grade, sort : tab vh_rumors if a7==1
by grade, sort : tab vh_rumors if a7==2
by grade, sort : tab vh_rumors if a7==3
by grade, sort : tab vh_rumors if a7==4
by grade, sort : tab vh_rumors if a7==5
by grade, sort : tab vh_rumors if a7==6

by grade, sort : tab vh_jokes if a6==2
by grade, sort : tab vh_jokes if a7==1
by grade, sort : tab vh_jokes if a7==2
by grade, sort : tab vh_jokes if a7==3
by grade, sort : tab vh_jokes if a7==4
by grade, sort : tab vh_jokes if a7==5
by grade, sort : tab vh_jokes if a7==6

by grade, sort : tab vh_looks if a6==2
by grade, sort : tab vh_looks if a7==1
by grade, sort : tab vh_looks if a7==2
by grade, sort : tab vh_looks if a7==3
by grade, sort : tab vh_looks if a7==4
by grade, sort : tab vh_looks if a7==5
by grade, sort : tab vh_looks if a7==6

by grade, sort : tab vh_insult if a6==2
by grade, sort : tab vh_insult if a7==1
by grade, sort : tab vh_insult if a7==2
by grade, sort : tab vh_insult if a7==3
by grade, sort : tab vh_insult if a7==4
by grade, sort : tab vh_insult if a7==5
by grade, sort : tab vh_insult if a7==6

by grade, sort : tab vv_pushed if a6==2
by grade, sort : tab vv_pushed if a7==1
by grade, sort : tab vv_pushed if a7==2
by grade, sort : tab vv_pushed if a7==3
by grade, sort : tab vv_pushed if a7==4
by grade, sort : tab vv_pushed if a7==5
by grade, sort : tab vv_pushed if a7==6

by grade, sort : tab vv_beaten if a6==2
by grade, sort : tab vv_beaten if a7==1
by grade, sort : tab vv_beaten if a7==2
by grade, sort : tab vv_beaten if a7==3
by grade, sort : tab vv_beaten if a7==4
by grade, sort : tab vv_beaten if a7==5
by grade, sort : tab vv_beaten if a7==6

by grade, sort : tab vv_fight if a6==2
by grade, sort : tab vv_fight if a7==1
by grade, sort : tab vv_fight if a7==2
by grade, sort : tab vv_fight if a7==3
by grade, sort : tab vv_fight if a7==4
by grade, sort : tab vv_fight if a7==5
by grade, sort : tab vv_fight if a7==6

by grade, sort : tab vv_harm if a6==2
by grade, sort : tab vv_harm if a7==1
by grade, sort : tab vv_harm if a7==2
by grade, sort : tab vv_harm if a7==3
by grade, sort : tab vv_harm if a7==4
by grade, sort : tab vv_harm if a7==5
by grade, sort : tab vv_harm if a7==6

by grade, sort : tab vv_weapon if a6==2
by grade, sort : tab vv_weapon if a7==1
by grade, sort : tab vv_weapon if a7==2
by grade, sort : tab vv_weapon if a7==3
by grade, sort : tab vv_weapon if a7==4
by grade, sort : tab vv_weapon if a7==5
by grade, sort : tab vv_weapon if a7==6

by grade, sort : tab rh_race if a6==2
by grade, sort : tab rh_race if a7==1
by grade, sort : tab rh_race if a7==2
by grade, sort : tab rh_race if a7==3
by grade, sort : tab rh_race if a7==4
by grade, sort : tab rh_race if a7==5
by grade, sort : tab rh_race if a7==6

by grade, sort : tab rh_religion if a6==2
by grade, sort : tab rh_religion if a7==1
by grade, sort : tab rh_religion if a7==2
by grade, sort : tab rh_religion if a7==3
by grade, sort : tab rh_religion if a7==4
by grade, sort : tab rh_religion if a7==5
by grade, sort : tab rh_religion if a7==6

by grade, sort : tab rh_gender if a6==2
by grade, sort : tab rh_gender if a7==1
by grade, sort : tab rh_gender if a7==2
by grade, sort : tab rh_gender if a7==3
by grade, sort : tab rh_gender if a7==4
by grade, sort : tab rh_gender if a7==5
by grade, sort : tab rh_gender if a7==6

by grade, sort : tab rh_gay if a6==2
by grade, sort : tab rh_gay if a7==1
by grade, sort : tab rh_gay if a7==2
by grade, sort : tab rh_gay if a7==3
by grade, sort : tab rh_gay if a7==4
by grade, sort : tab rh_gay if a7==5
by grade, sort : tab rh_gay if a7==6

by grade, sort : tab aod_alcohol if a6==2
by grade, sort : tab aod_alcohol if a7==1
by grade, sort : tab aod_alcohol if a7==2
by grade, sort : tab aod_alcohol if a7==3
by grade, sort : tab aod_alcohol if a7==4
by grade, sort : tab aod_alcohol if a7==5
by grade, sort : tab aod_alcohol if a7==6

by grade, sort : tab aod_binge if a6==2
by grade, sort : tab aod_binge if a7==1
by grade, sort : tab aod_binge if a7==2
by grade, sort : tab aod_binge if a7==3
by grade, sort : tab aod_binge if a7==4
by grade, sort : tab aod_binge if a7==5
by grade, sort : tab aod_binge if a7==6

by grade, sort : tab aod_mari if a6==2
by grade, sort : tab aod_mari if a7==1
by grade, sort : tab aod_mari if a7==2
by grade, sort : tab aod_mari if a7==3
by grade, sort : tab aod_mari if a7==4
by grade, sort : tab aod_mari if a7==5
by grade, sort : tab aod_mari if a7==6

by grade, sort : tab aod_pres if a6==2
by grade, sort : tab aod_pres if a7==1
by grade, sort : tab aod_pres if a7==2
by grade, sort : tab aod_pres if a7==3
by grade, sort : tab aod_pres if a7==4
by grade, sort : tab aod_pres if a7==5
by grade, sort : tab aod_pres if a7==6

by grade, sort : tab aod_two if a6==2
by grade, sort : tab aod_two if a7==1
by grade, sort : tab aod_two if a7==2
by grade, sort : tab aod_two if a7==3
by grade, sort : tab aod_two if a7==4
by grade, sort : tab aod_two if a7==5
by grade, sort : tab aod_two if a7==6

by grade, sort : tab dd_car if a6==2
by grade, sort : tab dd_car if a7==1
by grade, sort : tab dd_car if a7==2
by grade, sort : tab dd_car if a7==3
by grade, sort : tab dd_car if a7==4
by grade, sort : tab dd_car if a7==5
by grade, sort : tab dd_car if a7==6

by grade, sort : tab au_cig if a6==2
by grade, sort : tab au_cig if a7==1
by grade, sort : tab au_cig if a7==2
by grade, sort : tab au_cig if a7==3
by grade, sort : tab au_cig if a7==4
by grade, sort : tab au_cig if a7==5
by grade, sort : tab au_cig if a7==6

by grade, sort : tab du_cig if a6==2
by grade, sort : tab du_cig if a7==1
by grade, sort : tab du_cig if a7==2
by grade, sort : tab du_cig if a7==3
by grade, sort : tab du_cig if a7==4
by grade, sort : tab du_cig if a7==5
by grade, sort : tab du_cig if a7==6

by grade, sort : tab du_smoke if a6==2
by grade, sort : tab du_smoke if a7==1
by grade, sort : tab du_smoke if a7==2
by grade, sort : tab du_smoke if a7==3
by grade, sort : tab du_smoke if a7==4
by grade, sort : tab du_smoke if a7==5
by grade, sort : tab du_smoke if a7==6

by grade, sort : tab a107_a96 if a6==2
by grade, sort : tab a107_a96 if a7==1
by grade, sort : tab a107_a96 if a7==2
by grade, sort : tab a107_a96 if a7==3
by grade, sort : tab a107_a96 if a7==4
by grade, sort : tab a107_a96 if a7==5
by grade, sort : tab a107_a96 if a7==6

by grade, sort : tab a108 if a6==2
by grade, sort : tab a108 if a7==1
by grade, sort : tab a108 if a7==2
by grade, sort : tab a108 if a7==3
by grade, sort : tab a108 if a7==4
by grade, sort : tab a108 if a7==5
by grade, sort : tab a108 if a7==6
