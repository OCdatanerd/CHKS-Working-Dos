


drop if (grade==6|grade==8|grade==10|grade==12)
drop if (district=="Buena Park Elementary" ///
|district=="Fountain Valley Elementary"|district=="Fullerton Elementary" ///
|district=="Huntington Beach City Elementary"|district=="La Habra City Elementary"|district=="Ocean View"|district=="Westminster")
drop ctag1-ctag5
drop dasm1-dasm2
drop dasm5-gs1
drop gs4-sb19_sb14
drop sm3-v14_v10
sort district

** Create Variables
gen homeless= (a8==2|a8==3|a8==4|a8==6|a8==7) if !missing(a8)
gen truancy= (a21==5|a21==6|a21==7) if !missing(a21)
gen absence= (a20c==1|a20d==1|a20f==1)   
gen lgbt= (a129_a118==2|a129_a118==3|a130_a119==2) if !missing(a129_a118|a130_a119)
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
gen aod_inhale= (a51_a52==2|a51_a52==3|a51_a52==4|a51_a52==5|a51_a52==6) if !missing(a51_a52)


gen scare_hi= scarec==1
gen shigh_high= shighc==1
gen connect_high= connectc==1

gen dd_car= (a98==2|a98==3|a98==4|a98==5) if !missing(a98)

gen au_cig= (a67_a61==2|a67_a61==3|a67_a61==4|a67_a61==5) if !missing(a67_a61)
gen du_cig= (a67_a61==6) if !missing(a67_a61)
gen au_smoke= (a68_a62==2|a68_a62==3|a68_a62==4|a68_a62==5) if !missing(a68_a62)
gen du_smoke= (a68_a62==6) if !missing(a68_a62)
gen au_elec= (a69_a63==2|a69_a63==3|a69_a63==4|a69_a63==5) if !missing(a69_a63)
gen du_elec= (a69_a63==6) if !missing(a69_a63)


gen mh_cyber= (a122_a112==2|a122_a112==3|a122_a112==4) if !missing(a122_a112)


gen aod= (aod_alcohol==1|aod_mari==1|aod_inhale==1|aod_pres==1|aod_two==1) 

** For LGBT Crosstabs
keep if lgbt==1

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


by aod, sort : tab a124_a114
by aod, sort : tab a125

by a124_a114, sort : tab aod
by a125, sort : tab aod

by scarec, sort : tab a124_a114
by connectc, sort : tab a124_a114
by smeanc, sort : tab a124_a114

by scarec, sort : tab aod_alcohol
by connectc, sort : tab aod_alcohol
by smeanc, sort : tab aod_alcohol

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

by grade, sort : tab a124_a114
by grade, sort : tab a125

