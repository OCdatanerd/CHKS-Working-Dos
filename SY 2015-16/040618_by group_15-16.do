
codebook, compact


drop if (grade==6|grade==7|grade==8|grade==10|grade==12)
drop if (grade==6|grade==8|grade==10|grade==12)
drop if (district=="Fountain Valley Elementary"|district=="Buena Park Elementary"|district=="Fullerton Elementary"|district=="Huntington Beach City Elementary"|district=="Ocean View"|district=="Westminster")
drop ma44-cw26h
drop dasm5-sb19_sb14
drop e1-dasm4j
drop sm3-v14_v10
sort district
gen truancy= (a20==5|a20==6) if !missing(a20)
gen absence= (a21c==1|a21e==1) 
gen asian= (a8b==1|a8c==1| a8d==1|a8c==1|a8e==1|a8f==1|a8g==1|a8h==1|a8j==1|a8l==1)
gen lgbt= (a120_a110b==1|a120_a110c==1) 
gen ps_safe= (a91_a81==1|a91_a81==2) if !missing(a91_a81)
gen vh_rumors= (a95_a86==2|a95_a86==3|a95_a86==4) if !missing(a95_a86)
gen vh_jokes= (a96_a87==2|a96_a87==3|a96_a87==4) if !missing(a96_a87)
gen vh_looks= (a97_a88==2|a97_a88==3|a97_a88==4) if !missing(a97_a88)
gen vh_insult= (a106_a97==2|a106_a97==3|a106_a97==4) if !missing(a106_a97)
gen vv_pushed= (a92_a83==2|a92_a83==3|a92_a83==4 ) if !missing(a92_a83)
gen vv_beaten= (a93_a84==2|a93_a84==3|a93_a84==4) if !missing(a93_a84)
gen vv_fight= (a94_a85==2|a94_a85==3|a94_a85==4) if !missing(a94_a85)
gen vv_harm= (a105_a96==2|a105_a96==3|a105_a96==4) if !missing(a105_a96)
gen vv_weapon= (a103_a94==2|a103_a94==3|a103_a94==4) if !missing(a103_a94)
gen rh_race= (a107_a98==2|a107_a98==3|a107_a98==4) if !missing(a107_a98)
gen rh_religion= (a108_a99==2|a108_a99==3|a108_a99==4) if !missing(a108_a99)
gen rh_gender= (a109_a100==2|a109_a100==3|a109_a100==4) if !missing(a109_a100)
gen rh_gay= (a110_a101==2|a110_a101==3|a110_a101==4) if !missing(a110_a101)
gen aod_alcohol= (a64_a59==2|a64_a59==3|a64_a59==4|a64_a59==5|a64_a59==6) if !missing(a64_a59)
gen aod_binge= (a65_a60==2|a65_a60==3|a65_a60==4|a65_a60==5|a65_a60==6) if !missing(a65_a60)
gen aod_mari= (a66_a61==2|a66_a61==3|a66_a61==4|a66_a61==5|a66_a61==6) if !missing(a66_a61)
gen aod_pres= (a68==2|a68==3|a68==4|a68==5|a68==6) if !missing(a68)
gen aod_two= (a70==2|a70==3|a70==4|a70==5|a70==6) if !missing(a70)

gen dd_car= (a90==2|a90==3|a90==4|a90==5) if !missing(a90)

gen au_cig= (a61_a56==2|a61_a56==3|a61_a56==4|a61_a56==5) if !missing(a61_a56)
gen du_cig= (a61_a56==6) if !missing(a61_a56)
gen au_smoke= (a62_a57==2|a62_a57==3|a62_a57==4|a62_a57==5) if !missing(a62_a57)
gen du_smoke= (a62_a57==6) if !missing(a62_a57)
gen au_elec= (a63_a58==2|a63_a58==3|a63_a58==4|a63_a58==5) if !missing(a63_a58)
gen du_elec= (a63_a58==6) if !missing(a63_a58)


gen mh_cyber= (a113_a104==2|a113_a104==3|a113_a104==4) if !missing(a113_a104)


nsplit ncds, digits(7 7)
rename ncds2 schoolcode
merge m:m schoolcode using "C:\Users\drochman\Dropbox (OCDE)\CALPADS\Data Files\Stata Files\032417_schoolname merge.dta"




** Tables
tab grade
by grade, sort : tab a4, m
by grade, sort : tab a6
by grade, sort : tab a7

by grade, sort : tab truancy
by grade, sort : tab truancy if a6==2
by grade, sort : tab truancy if a7==1
by grade, sort : tab truancy if a7==2
by grade, sort : tab truancy if a7==3
by grade, sort : tab truancy if a7==4
by grade, sort : tab truancy if a7==5
by grade, sort : tab truancy if a7==6

by grade, sort : tab absence
by grade, sort : tab absence if a6==2
by grade, sort : tab absence if a7==1
by grade, sort : tab absence if a7==2
by grade, sort : tab absence if a7==3
by grade, sort : tab absence if a7==4
by grade, sort : tab absence if a7==5
by grade, sort : tab absence if a7==6

by grade, sort : tab scare_hi
by grade, sort : tab scare_hi if a6==2
by grade, sort : tab scare_hi if a7==1
by grade, sort : tab scare_hi if a7==2
by grade, sort : tab scare_hi if a7==3
by grade, sort : tab scare_hi if a7==4
by grade, sort : tab scare_hi if a7==5
by grade, sort : tab scare_hi if a7==6

by grade, sort : tab shigh_hi
by grade, sort : tab shigh_hi if a6==2
by grade, sort : tab shigh_hi if a7==1
by grade, sort : tab shigh_hi if a7==2
by grade, sort : tab shigh_hi if a7==3
by grade, sort : tab shigh_hi if a7==4
by grade, sort : tab shigh_hi if a7==5
by grade, sort : tab shigh_hi if a7==6

by grade, sort : tab connect_hi
by grade, sort : tab connect_hi if a6==2
by grade, sort : tab connect_hi if a7==1
by grade, sort : tab connect_hi if a7==2
by grade, sort : tab connect_hi if a7==3
by grade, sort : tab connect_hi if a7==4
by grade, sort : tab connect_hi if a7==5
by grade, sort : tab connect_hi if a7==6

by grade, sort : tab ps_safe
by grade, sort : tab ps_safe if a6==2
by grade, sort : tab ps_safe if a7==1
by grade, sort : tab ps_safe if a7==2
by grade, sort : tab ps_safe if a7==3
by grade, sort : tab ps_safe if a7==4
by grade, sort : tab ps_safe if a7==5
by grade, sort : tab ps_safe if a7==6

by grade, sort : tab vh_rumors
by grade, sort : tab vh_rumors if a6==2
by grade, sort : tab vh_rumors if a7==1
by grade, sort : tab vh_rumors if a7==2
by grade, sort : tab vh_rumors if a7==3
by grade, sort : tab vh_rumors if a7==4
by grade, sort : tab vh_rumors if a7==5
by grade, sort : tab vh_rumors if a7==6

by grade, sort : tab vh_jokes
by grade, sort : tab vh_jokes if a6==2
by grade, sort : tab vh_jokes if a7==1
by grade, sort : tab vh_jokes if a7==2
by grade, sort : tab vh_jokes if a7==3
by grade, sort : tab vh_jokes if a7==4
by grade, sort : tab vh_jokes if a7==5
by grade, sort : tab vh_jokes if a7==6

by grade, sort : tab vh_looks
by grade, sort : tab vh_looks if a6==2
by grade, sort : tab vh_looks if a7==1
by grade, sort : tab vh_looks if a7==2
by grade, sort : tab vh_looks if a7==3
by grade, sort : tab vh_looks if a7==4
by grade, sort : tab vh_looks if a7==5
by grade, sort : tab vh_looks if a7==6

by grade, sort : tab vh_insult
by grade, sort : tab vh_insult if a6==2
by grade, sort : tab vh_insult if a7==1
by grade, sort : tab vh_insult if a7==2
by grade, sort : tab vh_insult if a7==3
by grade, sort : tab vh_insult if a7==4
by grade, sort : tab vh_insult if a7==5
by grade, sort : tab vh_insult if a7==6

by grade, sort : tab vv_pushed
by grade, sort : tab vv_pushed if a6==2
by grade, sort : tab vv_pushed if a7==1
by grade, sort : tab vv_pushed if a7==2
by grade, sort : tab vv_pushed if a7==3
by grade, sort : tab vv_pushed if a7==4
by grade, sort : tab vv_pushed if a7==5
by grade, sort : tab vv_pushed if a7==6

by grade, sort : tab vv_beaten
by grade, sort : tab vv_beaten if a6==2
by grade, sort : tab vv_beaten if a7==1
by grade, sort : tab vv_beaten if a7==2
by grade, sort : tab vv_beaten if a7==3
by grade, sort : tab vv_beaten if a7==4
by grade, sort : tab vv_beaten if a7==5
by grade, sort : tab vv_beaten if a7==6

by grade, sort : tab vv_fight
by grade, sort : tab vv_fight if a6==2
by grade, sort : tab vv_fight if a7==1
by grade, sort : tab vv_fight if a7==2
by grade, sort : tab vv_fight if a7==3
by grade, sort : tab vv_fight if a7==4
by grade, sort : tab vv_fight if a7==5
by grade, sort : tab vv_fight if a7==6

by grade, sort : tab vv_harm
by grade, sort : tab vv_harm if a6==2
by grade, sort : tab vv_harm if a7==1
by grade, sort : tab vv_harm if a7==2
by grade, sort : tab vv_harm if a7==3
by grade, sort : tab vv_harm if a7==4
by grade, sort : tab vv_harm if a7==5
by grade, sort : tab vv_harm if a7==6

by grade, sort : tab vv_weapon
by grade, sort : tab vv_weapon if a6==2
by grade, sort : tab vv_weapon if a7==1
by grade, sort : tab vv_weapon if a7==2
by grade, sort : tab vv_weapon if a7==3
by grade, sort : tab vv_weapon if a7==4
by grade, sort : tab vv_weapon if a7==5
by grade, sort : tab vv_weapon if a7==6

by grade, sort : tab rh_race
by grade, sort : tab rh_race if a6==2
by grade, sort : tab rh_race if a7==1
by grade, sort : tab rh_race if a7==2
by grade, sort : tab rh_race if a7==3
by grade, sort : tab rh_race if a7==4
by grade, sort : tab rh_race if a7==5
by grade, sort : tab rh_race if a7==6

by grade, sort : tab rh_religion
by grade, sort : tab rh_religion if a6==2
by grade, sort : tab rh_religion if a7==1
by grade, sort : tab rh_religion if a7==2
by grade, sort : tab rh_religion if a7==3
by grade, sort : tab rh_religion if a7==4
by grade, sort : tab rh_religion if a7==5
by grade, sort : tab rh_religion if a7==6

by grade, sort : tab rh_gender
by grade, sort : tab rh_gender if a6==2
by grade, sort : tab rh_gender if a7==1
by grade, sort : tab rh_gender if a7==2
by grade, sort : tab rh_gender if a7==3
by grade, sort : tab rh_gender if a7==4
by grade, sort : tab rh_gender if a7==5
by grade, sort : tab rh_gender if a7==6

by grade, sort : tab rh_gay
by grade, sort : tab rh_gay if a6==2
by grade, sort : tab rh_gay if a7==1
by grade, sort : tab rh_gay if a7==2
by grade, sort : tab rh_gay if a7==3
by grade, sort : tab rh_gay if a7==4
by grade, sort : tab rh_gay if a7==5
by grade, sort : tab rh_gay if a7==6

by grade, sort : tab aod_alcohol
by grade, sort : tab aod_alcohol if a6==2
by grade, sort : tab aod_alcohol if a7==1
by grade, sort : tab aod_alcohol if a7==2
by grade, sort : tab aod_alcohol if a7==3
by grade, sort : tab aod_alcohol if a7==4
by grade, sort : tab aod_alcohol if a7==5
by grade, sort : tab aod_alcohol if a7==6

by grade, sort : tab aod_binge
by grade, sort : tab aod_binge if a6==2
by grade, sort : tab aod_binge if a7==1
by grade, sort : tab aod_binge if a7==2
by grade, sort : tab aod_binge if a7==3
by grade, sort : tab aod_binge if a7==4
by grade, sort : tab aod_binge if a7==5
by grade, sort : tab aod_binge if a7==6

by grade, sort : tab aod_mari
by grade, sort : tab aod_mari if a6==2
by grade, sort : tab aod_mari if a7==1
by grade, sort : tab aod_mari if a7==2
by grade, sort : tab aod_mari if a7==3
by grade, sort : tab aod_mari if a7==4
by grade, sort : tab aod_mari if a7==5
by grade, sort : tab aod_mari if a7==6

by grade, sort : tab aod_pres
by grade, sort : tab aod_pres if a6==2
by grade, sort : tab aod_pres if a7==1
by grade, sort : tab aod_pres if a7==2
by grade, sort : tab aod_pres if a7==3
by grade, sort : tab aod_pres if a7==4
by grade, sort : tab aod_pres if a7==5
by grade, sort : tab aod_pres if a7==6

by grade, sort : tab aod_two
by grade, sort : tab aod_two if a6==2
by grade, sort : tab aod_two if a7==1
by grade, sort : tab aod_two if a7==2
by grade, sort : tab aod_two if a7==3
by grade, sort : tab aod_two if a7==4
by grade, sort : tab aod_two if a7==5
by grade, sort : tab aod_two if a7==6

by grade, sort : tab dd_car
by grade, sort : tab dd_car if a6==2
by grade, sort : tab dd_car if a7==1
by grade, sort : tab dd_car if a7==2
by grade, sort : tab dd_car if a7==3
by grade, sort : tab dd_car if a7==4
by grade, sort : tab dd_car if a7==5
by grade, sort : tab dd_car if a7==6

by grade, sort : tab au_cig
by grade, sort : tab au_cig if a6==2
by grade, sort : tab au_cig if a7==1
by grade, sort : tab au_cig if a7==2
by grade, sort : tab au_cig if a7==3
by grade, sort : tab au_cig if a7==4
by grade, sort : tab au_cig if a7==5
by grade, sort : tab au_cig if a7==6

by grade, sort : tab du_cig
by grade, sort : tab du_cig if a6==2
by grade, sort : tab du_cig if a7==1
by grade, sort : tab du_cig if a7==2
by grade, sort : tab du_cig if a7==3
by grade, sort : tab du_cig if a7==4
by grade, sort : tab du_cig if a7==5
by grade, sort : tab du_cig if a7==6

by grade, sort : tab au_smoke
by grade, sort : tab au_smoke if a6==2
by grade, sort : tab au_smoke if a7==1
by grade, sort : tab au_smoke if a7==2
by grade, sort : tab au_smoke if a7==3
by grade, sort : tab au_smoke if a7==4
by grade, sort : tab au_smoke if a7==5
by grade, sort : tab au_smoke if a7==6

by grade, sort : tab du_smoke
by grade, sort : tab du_smoke if a6==2
by grade, sort : tab du_smoke if a7==1
by grade, sort : tab du_smoke if a7==2
by grade, sort : tab du_smoke if a7==3
by grade, sort : tab du_smoke if a7==4
by grade, sort : tab du_smoke if a7==5
by grade, sort : tab du_smoke if a7==6

by grade, sort : tab au_elec
by grade, sort : tab au_elec if a6==2
by grade, sort : tab au_elec if a7==1
by grade, sort : tab au_elec if a7==2
by grade, sort : tab au_elec if a7==3
by grade, sort : tab au_elec if a7==4
by grade, sort : tab au_elec if a7==5
by grade, sort : tab au_elec if a7==6

by grade, sort : tab du_elec
by grade, sort : tab du_elec if a6==2
by grade, sort : tab du_elec if a7==1
by grade, sort : tab du_elec if a7==2
by grade, sort : tab du_elec if a7==3
by grade, sort : tab du_elec if a7==4
by grade, sort : tab du_elec if a7==5
by grade, sort : tab du_elec if a7==6

by grade, sort : tab mh_cyber
by grade, sort : tab mh_cyber if a6==2
by grade, sort : tab mh_cyber if a7==1
by grade, sort : tab mh_cyber if a7==2
by grade, sort : tab mh_cyber if a7==3
by grade, sort : tab mh_cyber if a7==4
by grade, sort : tab mh_cyber if a7==5
by grade, sort : tab mh_cyber if a7==6

by grade, sort : tab a115_a106
by grade, sort : tab a115_a106 if a6==2
by grade, sort : tab a115_a106 if a7==1
by grade, sort : tab a115_a106 if a7==2
by grade, sort : tab a115_a106 if a7==3
by grade, sort : tab a115_a106 if a7==4
by grade, sort : tab a115_a106 if a7==5
by grade, sort : tab a115_a106 if a7==6

by grade, sort : tab a116
by grade, sort : tab a116 if a6==2
by grade, sort : tab a116 if a7==1
by grade, sort : tab a116 if a7==2
by grade, sort : tab a116 if a7==3
by grade, sort : tab a116 if a7==4
by grade, sort : tab a116 if a7==5
by grade, sort : tab a116 if a7==6
