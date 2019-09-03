


drop if (grade==6|grade==8|grade==10|grade==12)
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
gen aod_inhale= (a49_a50==2|a49_a50==3|a49_a50==4|a49_a50==5|a49_a50==6) if !missing(a49_a50)


gen mh_cyber= (a113_a104==2|a113_a104==3|a113_a104==4) if !missing(a113_a104)


gen aod= (aod_alcohol==1|aod_mari==1|aod_inhale==1|aod_pres==1|aod_two==1) 




** Crosstabs
by aod_alcohol, sort : tab aod_binge
by aod_alcohol, sort : tab aod_mari
by aod_alcohol, sort : tab aod_pres
by aod_alcohol, sort : tab au_cig
by aod_alcohol, sort : tab au_smoke
by aod_alcohol, sort : tab au_elec

by aod_binge, sort : tab aod_mari
by aod_binge, sort : tab aod_pres
by aod_binge, sort : tab au_cig
by aod_binge, sort : tab au_smoke
by aod_binge, sort : tab au_elec

by aod_mari, sort : tab aod_alcohol
by aod_mari, sort : tab aod_binge
by aod_mari, sort : tab aod_pres
by aod_mari, sort : tab au_cig
by aod_mari, sort : tab au_smoke
by aod_mari, sort : tab au_elec

by aod_pres, sort : tab aod_alcohol
by aod_pres, sort : tab aod_binge
by aod_pres, sort : tab aod_mari
by aod_pres, sort : tab au_cig
by aod_pres, sort : tab au_smoke
by aod_pres, sort : tab au_elec

by au_cig, sort : tab aod_alcohol
by au_cig, sort : tab aod_binge
by au_cig, sort : tab aod_mari
by au_cig, sort : tab aod_pres
by au_cig, sort : tab au_smoke
by au_cig, sort : tab au_elec

by au_smoke, sort : tab aod_alcohol
by au_smoke, sort : tab aod_binge
by au_smoke, sort : tab aod_mari
by au_smoke, sort : tab aod_pres
by au_smoke, sort : tab au_cig
by au_smoke, sort : tab au_elec

by au_elec, sort : tab aod_alcohol
by au_elec, sort : tab aod_binge
by au_elec, sort : tab aod_mari
by au_elec, sort : tab aod_pres
by au_elec, sort : tab au_cig
by au_elec, sort : tab au_smoke


by aod, sort : tab a115_a106
by aod, sort : tab a116

by a115_a106, sort : tab aod
by a116, sort : tab aod

by scarec, sort : tab a115_a106
by connectc, sort : tab a115_a106
by smeanc, sort : tab a115_a106

mean (scare) if grade==7
mean (scare) if grade==9
mean (scare) if grade==11

mean (smean) if grade==7
mean (smean) if grade==9
mean (smean) if grade==11

mean (connect) if grade==7
mean (connect) if grade==9
mean (connect) if grade==11

mean (acadmotiv) if grade==7
mean (acadmotiv) if grade==9
mean (acadmotiv) if grade==11

by grade, sort : tab a115_a106
by grade, sort : tab a116
