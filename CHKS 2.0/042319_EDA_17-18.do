
codebook, compact


drop if (grade==6|grade==8|grade==10|grade==12)
drop if district=="Santa Ana Unified"
keep if district=="Santa Ana Unified"
tab district
tab a5, mi
tab a6, m
by a5, sort : tab a6 
by district, sort : tab laian


drop ctag1-ctag5
drop dasm1-dasm2
drop dasm5-gs1
drop gs4-sb19_sb14
drop sm3-v14_v10

** Create Variables
sort district
gen homeless= (a8==2|a8==3|a8==4|a8==6|a8==7) if !missing(a8)
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

gen scare_hi= scarec==1
gen shigh_high= shighc==1
gen connect_high= connectc==1

gen dd_car= (a98==2|a98==3|a98==4|a98==5) if !missing(a98)

gen au_cig= (a67_a61==2|a67_a61==3|a67_a61==4|a67_a61==5|a67_a61==6) if !missing(a67_a61)
gen du_cig= (a67_a61==6) if !missing(a67_a61)
gen au_smoke= (a68_a62==2|a68_a62==3|a68_a62==4|a68_a62==5|a68_a62==6) if !missing(a68_a62)
gen du_smoke= (a68_a62==6) if !missing(a68_a62)
gen au_elec= (a69_a63==2|a69_a63==3|a69_a63==4|a69_a63==5|a69_a63==6) if !missing(a69_a63)
gen du_elec= (a69_a63==6) if !missing(a69_a63)


gen mh_cyber= (a122_a112==2|a122_a112==3|a122_a112==4) if !missing(a122_a112)

destring cdscode, gen(ncds)
nsplit ncds, digits(7 7)
rename ncds2 schoolcode
merge m:m schoolcode using "C:\Users\drochman\Dropbox (OCDE)\CALPADS\Data Files\Stata Files\032417_schoolname merge.dta"
order schoolname,after(district)


** Tables
tab a6 if a5==2, mi
tab a6 if a5==1, mi
separate a6, by(a5)
replace a61= 7 if a5==2
label define a6 7 "LatinX", add
by a61, sort : tab connect_high
by a62, sort : tab connect_high
by a61, sort : tab vv_fight
by a62, sort : tab vv_fight 
by a61, sort : tab rh_race
by a62, sort : tab rh_race

tab grade
by grade, sort : tab a3, m
by grade, sort : tab a5
by grade, sort : tab a6


by grade, sort : tab truancy
by grade, sort : tab truancy if a5==2
by grade, sort : tab truancy if a6==1
by grade, sort : tab truancy if a6==2
by grade, sort : tab truancy if a6==3
by grade, sort : tab truancy if a6==4
by grade, sort : tab truancy if a6==5
by grade, sort : tab truancy if a6==6

by grade, sort : tab absence
by grade, sort : tab absence if a5==2
by grade, sort : tab absence if a6==1
by grade, sort : tab absence if a6==2
by grade, sort : tab absence if a6==3
by grade, sort : tab absence if a6==4
by grade, sort : tab absence if a6==5
by grade, sort : tab absence if a6==6

by grade, sort : tab homeless
by grade, sort : tab homeless if a5==2
by grade, sort : tab homeless if a6==1
by grade, sort : tab homeless if a6==2
by grade, sort : tab homeless if a6==3
by grade, sort : tab homeless if a6==4
by grade, sort : tab homeless if a6==5
by grade, sort : tab homeless if a6==6

by grade, sort : tab scare_hi
by grade, sort : tab scare_hi if a5==2
by grade, sort : tab scare_hi if a6==1
by grade, sort : tab scare_hi if a6==2
by grade, sort : tab scare_hi if a6==3
by grade, sort : tab scare_hi if a6==4
by grade, sort : tab scare_hi if a6==5
by grade, sort : tab scare_hi if a6==6

by grade, sort : tab shigh_hi
by grade, sort : tab shigh_hi if a5==2
by grade, sort : tab shigh_hi if a6==1
by grade, sort : tab shigh_hi if a6==2
by grade, sort : tab shigh_hi if a6==3
by grade, sort : tab shigh_hi if a6==4
by grade, sort : tab shigh_hi if a6==5
by grade, sort : tab shigh_hi if a6==6

by grade, sort : tab connect_hi
by grade, sort : tab connect_hi if a5==2
by grade, sort : tab connect_hi if a6==1
by grade, sort : tab connect_hi if a6==2
by grade, sort : tab connect_hi if a6==3
by grade, sort : tab connect_hi if a6==4
by grade, sort : tab connect_hi if a6==5
by grade, sort : tab connect_hi if a6==6

by grade, sort : tab ps_safe
by grade, sort : tab ps_safe if a5==2
by grade, sort : tab ps_safe if a6==1
by grade, sort : tab ps_safe if a6==2
by grade, sort : tab ps_safe if a6==3
by grade, sort : tab ps_safe if a6==4
by grade, sort : tab ps_safe if a6==5
by grade, sort : tab ps_safe if a6==6

by grade, sort : tab vh_rumors
by grade, sort : tab vh_rumors if a5==2
by grade, sort : tab vh_rumors if a6==1
by grade, sort : tab vh_rumors if a6==2
by grade, sort : tab vh_rumors if a6==3
by grade, sort : tab vh_rumors if a6==4
by grade, sort : tab vh_rumors if a6==5
by grade, sort : tab vh_rumors if a6==6

by grade, sort : tab vh_jokes
by grade, sort : tab vh_jokes if a5==2
by grade, sort : tab vh_jokes if a6==1
by grade, sort : tab vh_jokes if a6==2
by grade, sort : tab vh_jokes if a6==3
by grade, sort : tab vh_jokes if a6==4
by grade, sort : tab vh_jokes if a6==5
by grade, sort : tab vh_jokes if a6==6

by grade, sort : tab vh_looks
by grade, sort : tab vh_looks if a5==2
by grade, sort : tab vh_looks if a6==1
by grade, sort : tab vh_looks if a6==2
by grade, sort : tab vh_looks if a6==3
by grade, sort : tab vh_looks if a6==4
by grade, sort : tab vh_looks if a6==5
by grade, sort : tab vh_looks if a6==6

by grade, sort : tab vh_insult
by grade, sort : tab vh_insult if a5==2
by grade, sort : tab vh_insult if a6==1
by grade, sort : tab vh_insult if a6==2
by grade, sort : tab vh_insult if a6==3
by grade, sort : tab vh_insult if a6==4
by grade, sort : tab vh_insult if a6==5
by grade, sort : tab vh_insult if a6==6

by grade, sort : tab vv_pushed
by grade, sort : tab vv_pushed if a5==2
by grade, sort : tab vv_pushed if a6==1
by grade, sort : tab vv_pushed if a6==2
by grade, sort : tab vv_pushed if a6==3
by grade, sort : tab vv_pushed if a6==4
by grade, sort : tab vv_pushed if a6==5
by grade, sort : tab vv_pushed if a6==6

by grade, sort : tab vv_beaten
by grade, sort : tab vv_beaten if a5==2
by grade, sort : tab vv_beaten if a6==1
by grade, sort : tab vv_beaten if a6==2
by grade, sort : tab vv_beaten if a6==3
by grade, sort : tab vv_beaten if a6==4
by grade, sort : tab vv_beaten if a6==5
by grade, sort : tab vv_beaten if a6==6

by grade, sort : tab vv_fight
by grade, sort : tab vv_fight if a5==2
by grade, sort : tab vv_fight if a6==1
by grade, sort : tab vv_fight if a6==2
by grade, sort : tab vv_fight if a6==3
by grade, sort : tab vv_fight if a6==4
by grade, sort : tab vv_fight if a6==5
by grade, sort : tab vv_fight if a6==6

by grade, sort : tab vv_harm
by grade, sort : tab vv_harm if a5==2
by grade, sort : tab vv_harm if a6==1
by grade, sort : tab vv_harm if a6==2
by grade, sort : tab vv_harm if a6==3
by grade, sort : tab vv_harm if a6==4
by grade, sort : tab vv_harm if a6==5
by grade, sort : tab vv_harm if a6==6

by grade, sort : tab vv_weapon
by grade, sort : tab vv_weapon if a5==2
by grade, sort : tab vv_weapon if a6==1
by grade, sort : tab vv_weapon if a6==2
by grade, sort : tab vv_weapon if a6==3
by grade, sort : tab vv_weapon if a6==4
by grade, sort : tab vv_weapon if a6==5
by grade, sort : tab vv_weapon if a6==6

by grade, sort : tab rh_race
by grade, sort : tab rh_race if a5==2
by grade, sort : tab rh_race if a6==1
by grade, sort : tab rh_race if a6==2
by grade, sort : tab rh_race if a6==3
by grade, sort : tab rh_race if a6==4
by grade, sort : tab rh_race if a6==5
by grade, sort : tab rh_race if a6==6

by grade, sort : tab rh_religion
by grade, sort : tab rh_religion if a5==2
by grade, sort : tab rh_religion if a6==1
by grade, sort : tab rh_religion if a6==2
by grade, sort : tab rh_religion if a6==3
by grade, sort : tab rh_religion if a6==4
by grade, sort : tab rh_religion if a6==5
by grade, sort : tab rh_religion if a6==6

by grade, sort : tab rh_gender
by grade, sort : tab rh_gender if a5==2
by grade, sort : tab rh_gender if a6==1
by grade, sort : tab rh_gender if a6==2
by grade, sort : tab rh_gender if a6==3
by grade, sort : tab rh_gender if a6==4
by grade, sort : tab rh_gender if a6==5
by grade, sort : tab rh_gender if a6==6

by grade, sort : tab rh_gay
by grade, sort : tab rh_gay if a5==2
by grade, sort : tab rh_gay if a6==1
by grade, sort : tab rh_gay if a6==2
by grade, sort : tab rh_gay if a6==3
by grade, sort : tab rh_gay if a6==4
by grade, sort : tab rh_gay if a6==5
by grade, sort : tab rh_gay if a6==6

by grade, sort : tab aod_alcohol
by grade, sort : tab aod_alcohol if a5==2
by grade, sort : tab aod_alcohol if a6==1
by grade, sort : tab aod_alcohol if a6==2
by grade, sort : tab aod_alcohol if a6==3
by grade, sort : tab aod_alcohol if a6==4
by grade, sort : tab aod_alcohol if a6==5
by grade, sort : tab aod_alcohol if a6==6

by grade, sort : tab aod_binge
by grade, sort : tab aod_binge if a5==2
by grade, sort : tab aod_binge if a6==1
by grade, sort : tab aod_binge if a6==2
by grade, sort : tab aod_binge if a6==3
by grade, sort : tab aod_binge if a6==4
by grade, sort : tab aod_binge if a6==5
by grade, sort : tab aod_binge if a6==6

by grade, sort : tab aod_mari
by grade, sort : tab aod_mari if a5==2
by grade, sort : tab aod_mari if a6==1
by grade, sort : tab aod_mari if a6==2
by grade, sort : tab aod_mari if a6==3
by grade, sort : tab aod_mari if a6==4
by grade, sort : tab aod_mari if a6==5
by grade, sort : tab aod_mari if a6==6

by grade, sort : tab aod_pres
by grade, sort : tab aod_pres if a5==2
by grade, sort : tab aod_pres if a6==1
by grade, sort : tab aod_pres if a6==2
by grade, sort : tab aod_pres if a6==3
by grade, sort : tab aod_pres if a6==4
by grade, sort : tab aod_pres if a6==5
by grade, sort : tab aod_pres if a6==6

by grade, sort : tab aod_two
by grade, sort : tab aod_two if a5==2
by grade, sort : tab aod_two if a6==1
by grade, sort : tab aod_two if a6==2
by grade, sort : tab aod_two if a6==3
by grade, sort : tab aod_two if a6==4
by grade, sort : tab aod_two if a6==5
by grade, sort : tab aod_two if a6==6

by grade, sort : tab dd_car
by grade, sort : tab dd_car if a5==2
by grade, sort : tab dd_car if a6==1
by grade, sort : tab dd_car if a6==2
by grade, sort : tab dd_car if a6==3
by grade, sort : tab dd_car if a6==4
by grade, sort : tab dd_car if a6==5
by grade, sort : tab dd_car if a6==6

by grade, sort : tab au_cig
by grade, sort : tab au_cig if a5==2
by grade, sort : tab au_cig if a6==1
by grade, sort : tab au_cig if a6==2
by grade, sort : tab au_cig if a6==3
by grade, sort : tab au_cig if a6==4
by grade, sort : tab au_cig if a6==5
by grade, sort : tab au_cig if a6==6

by grade, sort : tab du_cig
by grade, sort : tab du_cig if a5==2
by grade, sort : tab du_cig if a6==1
by grade, sort : tab du_cig if a6==2
by grade, sort : tab du_cig if a6==3
by grade, sort : tab du_cig if a6==4
by grade, sort : tab du_cig if a6==5
by grade, sort : tab du_cig if a6==6

by grade, sort : tab au_smoke
by grade, sort : tab au_smoke if a5==2
by grade, sort : tab au_smoke if a6==1
by grade, sort : tab au_smoke if a6==2
by grade, sort : tab au_smoke if a6==3
by grade, sort : tab au_smoke if a6==4
by grade, sort : tab au_smoke if a6==5
by grade, sort : tab au_smoke if a6==6

by grade, sort : tab du_smoke
by grade, sort : tab du_smoke if a5==2
by grade, sort : tab du_smoke if a6==1
by grade, sort : tab du_smoke if a6==2
by grade, sort : tab du_smoke if a6==3
by grade, sort : tab du_smoke if a6==4
by grade, sort : tab du_smoke if a6==5
by grade, sort : tab du_smoke if a6==6

by grade, sort : tab au_elec
by grade, sort : tab au_elec if a5==2
by grade, sort : tab au_elec if a6==1
by grade, sort : tab au_elec if a6==2
by grade, sort : tab au_elec if a6==3
by grade, sort : tab au_elec if a6==4
by grade, sort : tab au_elec if a6==5
by grade, sort : tab au_elec if a6==6

by grade, sort : tab du_elec
by grade, sort : tab du_elec if a5==2
by grade, sort : tab du_elec if a6==1
by grade, sort : tab du_elec if a6==2
by grade, sort : tab du_elec if a6==3
by grade, sort : tab du_elec if a6==4
by grade, sort : tab du_elec if a6==5
by grade, sort : tab du_elec if a6==6

by grade, sort : tab mh_cyber
by grade, sort : tab mh_cyber if a5==2
by grade, sort : tab mh_cyber if a6==1
by grade, sort : tab mh_cyber if a6==2
by grade, sort : tab mh_cyber if a6==3
by grade, sort : tab mh_cyber if a6==4
by grade, sort : tab mh_cyber if a6==5
by grade, sort : tab mh_cyber if a6==6

by grade, sort : tab a124_a114
by grade, sort : tab a124_a114 if a5==2
by grade, sort : tab a124_a114 if a6==1
by grade, sort : tab a124_a114 if a6==2
by grade, sort : tab a124_a114 if a6==3
by grade, sort : tab a124_a114 if a6==4
by grade, sort : tab a124_a114 if a6==5
by grade, sort : tab a124_a114 if a6==6

by grade, sort : tab a125
by grade, sort : tab a125 if a5==2
by grade, sort : tab a125 if a6==1
by grade, sort : tab a125 if a6==2
by grade, sort : tab a125 if a6==3
by grade, sort : tab a125 if a6==4
by grade, sort : tab a125 if a6==5
by grade, sort : tab a125 if a6==6
