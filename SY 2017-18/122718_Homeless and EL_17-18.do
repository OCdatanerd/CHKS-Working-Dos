
drop if (grade==6|grade==8|grade==10|grade==12)
drop if (district=="Buena Park Elementary"|district=="Fountain Valley Elementary"|district=="Fullerton Elementary"|district=="Huntington Beach City Elementary"|district=="La Habra City Elementary"|district=="Ocean View"|district=="Westminster")
drop ctag1-ctag5
drop dasm1-dasm2
drop dasm5-gs1
drop gs4-sb19_sb14
drop sm3-v14_v10
sort district

keep if district=="Capistrano Unified"
keep if district=="Anaheim Union High"
keep if district=="Fullerton Joint Union High"
keep if district=="Huntington Beach Union High"
keep if district=="Irvine Unified"
keep if district=="Newport-Mesa Unified"
keep if district=="Orange County Department of Education"
keep if district=="Santa Ana Unified"
keep if district=="La Habra City Elementary"
keep if district=="Westminster"
keep if district=="Fullerton Elementary"
keep if district=="Garden Grove Unified"

** Create Variables
gen homeless= (a8==3|a8==4|a8==6|a8==7| a8==8) if !missing(a8)
gen foster= a8==5 if !missing(a8)
rename engprofc_noneng noneng
gen truancy= (a21==5|a21==6|a21==7) if !missing(a21)
gen absence= (a20c==1|a20d==1|a20f==1)   
gen lgbt= (a129_a118==2|a129_a118==3|a130_a119==2) if !missing(a129_a118|a130_a119)
replace lgbt = 2 if (a129_a118==6|a130_a119==4)
gen ps_safe= (a99_a88==1|a99_a88==2) if !missing(a99_a88)
gen vh_rumors= (a103_a93==2|a103_a93==3|a103_a93==4) if !missing(a103_a93)
gen vh_jokes= (a114_a104==2|a114_a104==3|a114-a104==4) if !missing(a114_a104)
gen vh_looks= (a105_a95==2|a105_a95==3|a105_a95==4) if !missing(a105_a95)
gen vh_insult= (a114_a104==2|a114_a104==3|a114_a104==4) if !missing(a114_a104)
gen vv_pushed= (a100_a90==2|a100_a90==3|a100_a90==4 ) if !missing(a100_a90)
gen vv_beaten= (a101_a91==2|a101_a91==3|a101_a91==4) if !missing(a101_a91)
gen vv_fight= (a102_a92==2|a102_a92==3|a102_a92==4) if !missing(a102_a92)
gen vv_harm= (a113_a103==2|a113_a103==3|a113_a103==4) if !missing(a113_a103)
gen vv_weapon= (a111_a101==2|a111_a101==3|a111_a101==4) if !missing(a111_a101)
gen rh_race= (a115_a105==2|a115_a105==3|a115_a105==4) if !missing(a115_a105)
gen rh_religion= (a116_a106==2|a116_a106==3|a116_a106==4) if !missing(a116_a106)
gen rh_gender= (a117_a107==2|a117_a107==3|a117_a107==4) if !missing(a117_a107)
gen rh_gay= (a118_a108==2|a118_a108==3|a118_a108==4) if !missing(a118_a108)
gen rh_mental= (a119_a109==2|a119_a109==3|a119_a109==4) if !missing(a119_a109)
gen rh_immigrant= (a120_a110==2|a120_a110==3|a120_a110==4) if !missing(a120_a110)
gen aod_alcohol= (a70_a64==2|a70_a64==3|a70_a64==4|a70_a64==5|a70_a64==6) if !missing(a70_a64)
gen aod_binge= (a71_a65==2|a71_a65==3|a71_a65==4|a71_a65==5|a71_a65==6) if !missing(a71_a65)
gen aod_mari= (a72_a66==2|a72_a66==3|a72_a66==4|a72_a66==5|a72_a66==6) if !missing(a72_a66)
gen aod_pres= (a74==2|a74==3|a74==4|a74==5|a74==6) if !missing(a74)
gen aod_two= (a76==2|a76==3|a76==4|a76==5|a76==6) if !missing(a76)
gen aod_inhale= (a73_a67==2|a73_a67==3|a73_a67==4|a73_a67==5|a73_a67==6) if !missing(a73_a67)


gen scare_high= scarec==1
gen shigh_high= shighc==1
gen smeaning_high= smeanc==1
gen sover_high= sallc==1
gen sconnect_high= connectc==1
gen sacadmo_high= acadmotivc==1
gen sparent_high= parentinvolc==1


gen dd_car= (a98==2|a98==3|a98==4|a98==5) if !missing(a98)

gen au_cig= (a67_a61==2|a67_a61==3|a67_a61==4|a67_a61==5) if !missing(a67_a61)
gen du_cig= (a67_a61==6) if !missing(a67_a61)
gen au_smoke= (a68_a62==2|a68_a62==3|a68_a62==4|a68_a62==5) if !missing(a68_a62)
gen du_smoke= (a68_a62==6) if !missing(a68_a62)
gen au_elec= (a69_a63==2|a69_a63==3|a69_a63==4|a69_a63==5) if !missing(a69_a63)
gen du_elec= (a69_a63==6) if !missing(a69_a63)


gen mh_cyber= (a122_a112==2|a122_a112==3|a122_a112==4) if !missing(a122_a112)


gen aod= (aod_alcohol==1|aod_mari==1|aod_inhale==1|aod_pres==1|aod_two==1)

** Demos
tab a3,missing
tab a5
tab a6
tab lgbt,m

*** Homeless Tables

keep if homeless==1
drop if homeless==1


tab homeless

tab a3, m

tab a5 if homeless==1
tab a6 if homeless==1

tab lgbt


 
** Scale Questions
by homeless, sort : tab truancy
tab truancy

by homeless, sort : tab absence
tab absence
 
by homeless, sort : tab scare_high
tab scare_high
 
by homeless, sort : tab shigh_high
tab shigh_high

by homeless, sort : tab smeaning_high
tab smeaning_high

by homeless, sort : tab sover_high
tab sover_high

by homeless, sort : tab sconnect_high
tab sconnect_high

by homeless, sort : tab sacadmo_high
tab sacadmo_high

by homeless, sort : tab sparent_high
tab sparent_high

by homeless, sort : tab ps_safe
tab ps_safe


by homeless, sort : tab a124_a114
tab a124_a114

by homeless, sort : tab a125
tab a125

by homeless, sort : tab aod_alcohol
tab aod_alcohol

by homeless, sort : tab aod_binge
tab aod_binge
 
by homeless, sort : tab aod_mari
tab aod_mari

by homeless, sort : tab aod_pres
tab aod_pres

by homeless, sort : tab aod_two
tab aod_two



*** Non-English Proficient Tables

keep if noneng==2
drop if noneng==2


tab a3, m

tab noneng

tab a5 if noneng==2
tab a6 if noneng==2

tab lgbt

** Scale Questions
by noneng, sort : tab truancy
tab truancy

by noneng, sort : tab absence
tab absence
 
by noneng, sort : tab scare_high
tab scare_high
 
by noneng, sort : tab shigh_high
tab shigh_high

by noneng, sort : tab smeaning_high
tab smeaning_high

by noneng, sort : tab sover_high
tab sover_high

by noneng, sort : tab sconnect_high
tab sconnect_high

by noneng, sort : tab sacadmo_high
tab sacadmo_high

by noneng, sort : tab sparent_high
tab sparent_high

by noneng, sort : tab ps_safe
tab ps_safe


by noneng, sort : tab a124_a114
tab a124_a114

by noneng, sort : tab a125
tab a125
 

** AOD
by noneng, sort : tab aod_alcohol
tab aod_alcohol

by noneng, sort : tab aod_binge
tab aod_binge
 
by noneng, sort : tab aod_mari
tab aod_mari

by noneng, sort : tab aod_pres
tab aod_pres

by noneng, sort : tab aod_two
tab aod_two










** Other
tab vh_rumors
by homeless, sort : tab vh_rumors

tab vh_jokes
by homeless, sort : tab vh_jokes 

tab vh_looks
by homeless, sort : tab vh_looks 

tab vh_insult
by homeless, sort : tab vh_insult 

tab vv_pushed
by homeless, sort : tab vv_pushed

tab vv_beaten
by homeless, sort : tab vv_beaten

tab vv_fight
by lgbt, sort : tab vv_fight

tab vv_harm
by lgbt, sort : tab vv_harm

tab vv_weapon
by homeless, sort : tab vv_weapon

tab rh_race
by homeless, sort : tab rh_race

tab rh_religion
by homeless, sort : tab rh_religion

tab rh_gender
by homeless, sort : tab rh_gender

tab rh_gay
by homeless, sort : tab rh_gay 

tab aod_alcohol
by homeless, sort : tab aod_alcohol

tab aod_binge
by homeless, sort : tab aod_binge 

tab aod_mari
by homeless, sort : tab aod_mari

tab aod_pres
by homeless, sort : tab aod_pres

tab aod_two
by homeless, sort : tab aod_two

tab dd_car
by homeless, sort : tab dd_car 

tab au_cig
by homeless, sort : tab au_cig 

tab du_cig
by homeless, sort : tab du_cig

tab au_smoke
by homeless, sort : tab au_smoke

tab du_smoke
by homeless, sort : tab du_smoke

tab au_elec
by homeless, sort : tab au_elec

tab du_elec
by homeless, sort : tab du_elec

tab mh_cyber
by homeless, sort : tab mh_cyber

tab a124_a114
by homeless, sort : tab a124_a114

tab a125
by homeless, sort : tab a125 

** ACCESS
keep if soctype== "County Community"

tab scarec
tab shighc
tab smeanc
tab sallc
tab connectc
tab acadmotivc
tab parentinvolc
tab ps_safe
tab a124_a114
tab a125
