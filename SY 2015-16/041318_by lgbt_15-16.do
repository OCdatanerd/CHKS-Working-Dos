codebook, compact


drop if (grade==6|grade==7|grade==8|grade==10|grade==12)
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

** Tables
by lgbt, sort : tab grade
keep if lgbt==1
by grade, sort : tab a4,m
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

tab au_elec
by lgbt, sort : tab au_elec

tab du_elec
by lgbt, sort : tab du_elec

tab mh_cyber
by lgbt, sort : tab mh_cyber

tab a115_a106
by lgbt, sort : tab a115_a106

tab a116
by lgbt, sort : tab a116 

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
logistic au_elec lgbt
logistic du_elec lgbt

