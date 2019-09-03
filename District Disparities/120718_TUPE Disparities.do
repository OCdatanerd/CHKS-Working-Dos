

drop if (grade==6|grade==8|grade==10|grade==12)
keep if (district=="Santa Ana Unified"|district=="Fountain Valley Elementary"| ///
district=="Laguna Beach Unified"|district=="Huntington Beach City Elementary"| ///
district=="Saddleback Valley Unified"|district=="Ocean View"| ///
district=="Westminster"| district=="Orange County Department of Education")
drop ctag1-ctag5
drop dasm1-dasm2
drop dasm5-gs1
drop gs4-sb19_sb14
drop sm3-v14_v10
sort district


** Create Variables
gen ever_cig= (a46_a47==2|a46_a47==3|a46_a47==4|a46_a47==5|a46_a47==6) if !missing(a46_a47)
gen repeat_cig= (a46_a47==5|a46_a47==6) if !missing(a46_a47)
gen ever_smoke= (a47_a48==2|a47_a48==3|a47_a48==4|a47_a48==5|a47_a48==6) if !missing(a47_a48)
gen repeat_smoke= (a47_a48==5|a47_a48==6) if !missing(a46_a47)
gen ever_vape= (a48_a49==2|a48_a49==3|a48_a49==4|a48_a49==5|a48_a49==6) if !missing(a48_a49)
gen repeat_vape= (a48_a49==5|a48_a49==6) if !missing(a48_a49)
gen any_cig= (a67_a61==2|a67_a61==3|a67_a61==4|a67_a61==5|a67_a61==6) if !missing(a67_a61)
gen daily_cig= (a67_a61==6) if !missing(a67_a61)
gen any_smoke= (a68_a62==2|a68_a62==3|a68_a62==4|a68_a62==5|a68_a62==6) if !missing(a68_a62)
gen daily_smoke= (a68_a62==6) if !missing(a68_a62)
gen any_vape= (a69_a63==2|a69_a63==3|a69_a63==4|a69_a63==5|a69_a63==6) if !missing(a69_a63)
gen daily_vape= (a69_a63==6) if !missing(a69_a63)
gen propever_cig= (a77_a69==2|a77_a69==3|a77_a69==4|a77_a69==5|a77_a69==6) if !missing(a77_a69)
gen proprepeat_cig= (a77_a69==5|a77_a69==6) if !missing(a77_a69)
gen propever_smoke= (a78_a70==2|a78_a70==3|a78_a70==4|a78_a70==5|a78_a70==6) if !missing(a78_a70)
gen proprepeat_smoke= (a78_a70==5|a78_a70==6) if !missing(a78_a70)
gen propever_vape= (a79_a71==2|a79_a71==3|a79_a71==4|a79_a71==5|a79_a71==6) if !missing(a79_a71)
gen proprepeat_vape= (a79_a71==5|a79_a71==6) if !missing(a79_a71)
gen phoccai_cig= (a83_a75==1) if !missing(a83_a75)
gen phpack_cig= (a84_a76==1) if !missing(a84_a76)
gen phoccai_vape= (a85_a77==1) if !missing(a85_a77)
gen phpack_vape= (a86_a78==1) if !missing(a86_a78)
gen lgbt= (a129_a118==2|a129_a118==3|a130_a119==2) if !missing(a129_a118|a130_a119)
replace lgbt = 2 if (a129_a118==6|a130_a119==4)

** Tables Middle School
keep if district=="Fountain Valley Elementary"
keep if district=="Ocean View"
keep if district=="Huntington Beach City Elementary"
keep if district=="Westminster"

tab grade
by grade, sort : tab a3, m
by grade, sort : tab a5
by grade, sort : tab a6



tab ever_cig
tab ever_cig if a5==2
tab ever_cig if a6==1
tab ever_cig if a6==2
tab ever_cig if a6==3
tab ever_cig if a6==4
tab ever_cig if a6==5
tab ever_cig if a6==6

tab repeat_cig
tab repeat_cig if a5==2
tab repeat_cig if a6==1
tab repeat_cig if a6==2
tab repeat_cig if a6==3
tab repeat_cig if a6==4
tab repeat_cig if a6==5
tab repeat_cig if a6==6

tab ever_smoke
tab ever_smoke if a5==2
tab ever_smoke if a6==1
tab ever_smoke if a6==2
tab ever_smoke if a6==3
tab ever_smoke if a6==4
tab ever_smoke if a6==5
tab ever_smoke if a6==6

tab repeat_smoke
tab repeat_smoke if a5==2
tab repeat_smoke if a6==1
tab repeat_smoke if a6==2
tab repeat_smoke if a6==3
tab repeat_smoke if a6==4
tab repeat_smoke if a6==5
tab repeat_smoke if a6==6

tab ever_vape
tab ever_vape if a5==2
tab ever_vape if a6==1
tab ever_vape if a6==2
tab ever_vape if a6==3
tab ever_vape if a6==4
tab ever_vape if a6==5
tab ever_vape if a6==6

tab repeat_vape
tab repeat_vape if a5==2
tab repeat_vape if a6==1
tab repeat_vape if a6==2
tab repeat_vape if a6==3
tab repeat_vape if a6==4
tab repeat_vape if a6==5
tab repeat_vape if a6==6

tab any_cig
tab any_cig if a5==2
tab any_cig if a6==1
tab any_cig if a6==2
tab any_cig if a6==3
tab any_cig if a6==4
tab any_cig if a6==5
tab any_cig if a6==6

tab daily_cig
tab daily_cig if a5==2
tab daily_cig if a6==1
tab daily_cig if a6==2
tab daily_cig if a6==3
tab daily_cig if a6==4
tab daily_cig if a6==5
tab daily_cig if a6==6

tab any_smoke
tab any_smoke if a5==2
tab any_smoke if a6==1
tab any_smoke if a6==2
tab any_smoke if a6==3
tab any_smoke if a6==4
tab any_smoke if a6==5
tab any_smoke if a6==6


tab daily_smoke
tab daily_smoke if a5==2
forv i = 1/6 {
	tab daily_smoke if a6== `i'
	}

tab any_vape
tab any_vape if a5==2
forv i = 1/6 {
	tab any_vape if a6== `i'
	}

tab daily_vape
tab daily_vape if a5==2
forv i = 1/6 {
	tab daily_vape if a6== `i'
	}	
	
tab propever_cig
tab propever_cig if a5==2
forv i = 1/6 {
	tab propever_cig if a6== `i'
	}	
	
tab proprepeat_cig
tab proprepeat_cig if a5==2
forv i = 1/6 {
	tab proprepeat_cig if a6== `i'
	}		
	
tab propever_smoke
tab propever_smoke if a5==2
forv i = 1/6 {
	tab propever_smoke if a6== `i'
	}		
	
tab proprepeat_smoke
tab proprepeat_smoke if a5==2
forv i = 1/6 {
	tab proprepeat_smoke if a6== `i'
	}	
	
tab propever_vape
tab propever_vape if a5==2
forv i = 1/6 {
	tab propever_vape if a6== `i'
	}		

tab proprepeat_vape
tab proprepeat_vape if a5==2
forv i = 1/6 {
	tab proprepeat_vape if a6== `i'
	}	
	
tab phoccai_cig
tab phoccai_cig if a5==2
forv i = 1/6 {
	tab phoccai_cig if a6== `i'
	}		
	
tab phpack_cig
tab phpack_cig if a5==2
forv i = 1/6 {
	tab phpack_cig if a6== `i'
	}
	
tab phoccai_vape
tab phoccai_vape if a5==2
forv i = 1/6 {
	tab phoccai_vape if a6== `i'
	}
	
tab phpack_vape
tab phpack_vape if a5==2
forv i = 1/6 {
	tab phpack_vape if a6== `i'
	}	

** LGBT
tab lgbt
keep if lgbt==1
by grade, sort : tab a3, m

tab ever_cig
by lgbt, sort : tab ever_cig

tab repeat_cig
by lgbt, sort : tab repeat_cig

tab ever_smoke
by lgbt, sort : tab ever_smoke

tab repeat_smoke
by lgbt, sort : tab repeat_smoke

tab ever_vape
by lgbt, sort : tab ever_vape

tab repeat_vape
by lgbt, sort : tab repeat_vape

tab any_cig
by lgbt, sort : tab any_cig

tab daily_cig
by lgbt, sort : tab daily_cig

tab any_smoke
by lgbt, sort : tab any_smoke

tab daily_smoke
by lgbt, sort : tab daily_smoke

tab any_vape
by lgbt, sort : tab any_vape

tab daily_vape
by lgbt, sort : tab daily_vape
	
tab propever_cig
by lgbt, sort : tab propever_smoke
	
tab proprepeat_cig
by lgbt, sort : tab proprepeat_cig
	
tab propever_smoke
by lgbt, sort : tab propever_smoke
	
tab proprepeat_smoke
by lgbt, sort : tab proprepeat_smoke
	
tab propever_vape
by lgbt, sort : tab propever_vape

tab proprepeat_vape
by lgbt, sort : tab proprepeat_vape
	
tab phoccai_cig
by lgbt, sort : tab phoccai_cig
	
tab phpack_cig
by lgbt, sort : tab phpack_cig
	
tab phoccai_vape
by lgbt, sort : tab phoccai_vape
	
tab phpack_vape
by lgbt, sort : tab phpack_vape
	
** Tables High School
keep if district=="Santa Ana Unified"
keep if district=="Laguna Beach Unified"
keep if district=="Saddleback Valley Unified"
keep if district=="Orange County Department of Education"

tab grade
by grade, sort : tab a3, m
by grade, sort : tab a5
by grade, sort : tab a6
** Santa Ana Gender











0



by grade, sort : tab ever_cig
by grade, sort : tab ever_cig if a5==2
forv i = 1/6 {
	by grade, sort : tab ever_cig if a6== `i'
	}

by grade, sort : tab repeat_cig
by grade, sort : tab repeat_cig if a5==2
forv i = 1/6 {
	by grade, sort : tab repeat_cig if a6== `i'
	}

by grade, sort : tab ever_smoke
by grade, sort : tab ever_smoke if a5==2
forv i = 1/6 {
	by grade, sort : tab ever_smoke if a6== `i'
	}

by grade, sort : tab repeat_smoke
by grade, sort : tab repeat_smoke if a5==2
forv i = 1/6 {
	by grade, sort : tab repeat_smoke if a6== `i'
	}

by grade, sort : tab ever_vape
by grade, sort : tab ever_vape if a5==2
forv i = 1/6 {
	by grade, sort : tab ever_vape if a6== `i'
	}

by grade, sort : tab repeat_vape
by grade, sort : tab repeat_vape if a5==2
forv i = 1/6 {
	by grade, sort : tab repeat_vape if a6== `i'
	}

by grade, sort : tab any_cig
by grade, sort : tab any_cig if a5==2
forv i = 1/6 {
	by grade, sort : tab any_cig if a6== `i'
	}

by grade, sort : tab daily_cig
by grade, sort : tab daily_cig if a5==2
forv i = 1/6 {
	by grade, sort : tab daily_cig if a6== `i'
	}	
	
by grade, sort : tab any_smoke
by grade, sort : tab any_smoke if a5==2
forv i = 1/6 {
	by grade, sort : tab any_smoke if a6== `i'
	}	
	
by grade, sort : tab daily_smoke
by grade, sort : tab daily_smoke if a5==2
forv i = 1/6 {
	by grade, sort : tab daily_smoke if a6== `i'
	}
	
by grade, sort : tab any_vape
by grade, sort : tab any_vape if a5==2
forv i = 1/6 {
	by grade, sort : tab any_vape if a6== `i'
	}	
	
by grade, sort : tab daily_vape
by grade, sort : tab daily_vape if a5==2
forv i = 1/6 {
	by grade, sort : tab daily_vape if a6== `i'
	}	
	
by grade, sort : tab propever_cig
by grade, sort : tab propever_cig if a5==2
forv i = 1/6 {
	by grade, sort : tab propever_cig if a6== `i'
	}
	
by grade, sort : tab proprepeat_cig
by grade, sort : tab proprepeat_cig if a5==2
forv i = 1/6 {
	by grade, sort : tab proprepeat_cig if a6== `i'
	}	
	
by grade, sort : tab propever_smoke
by grade, sort : tab propever_smoke if a5==2
forv i = 1/6 {
	by grade, sort : tab propever_smoke if a6== `i'
	}	
	
by grade, sort : tab proprepeat_smoke
by grade, sort : tab proprepeat_smoke if a5==2
forv i = 1/6 {
	by grade, sort : tab proprepeat_smoke if a6== `i'
	}	
	
by grade, sort : tab propever_vape
by grade, sort : tab propever_vape if a5==2
forv i = 1/6 {
	by grade, sort : tab propever_vape if a6== `i'
	}	
	
by grade, sort : tab proprepeat_vape
by grade, sort : tab proprepeat_vape if a5==2
forv i = 1/6 {
	by grade, sort : tab proprepeat_vape if a6== `i'
	}		
	
by grade, sort : tab phoccai_cig
by grade, sort : tab phoccai_cig if a5==2
forv i = 1/6 {
	by grade, sort : tab phoccai_cig if a6== `i'
	}	
	
by grade, sort : tab phpack_cig
by grade, sort : tab phpack_cig if a5==2
forv i = 1/6 {
	by grade, sort : tab phpack_cig if a6== `i'
	}		
	
by grade, sort : tab phoccai_vape
by grade, sort : tab phoccai_vape if a5==2
forv i = 1/6 {
	by grade, sort : tab phoccai_vape if a6== `i'
	}	
	
by grade, sort : tab phpack_vape
by grade, sort : tab phpack_vape if a5==2
forv i = 1/6 {
	by grade, sort : tab phpack_vape if a6== `i'
	}

	
** LGBT
by grade, sort : tab lgbt
keep if lgbt==1
by grade, sort : tab a3, m
** SAUSD
by grade, sort : tab sana1, m

tab ever_cig
by lgbt, sort : tab ever_cig

tab repeat_cig
by lgbt, sort : tab repeat_cig

tab ever_smoke
by lgbt, sort : tab ever_smoke

tab repeat_smoke
by lgbt, sort : tab repeat_smoke

tab ever_vape
by lgbt, sort : tab ever_vape

tab repeat_vape
by lgbt, sort : tab repeat_vape

tab any_cig
by lgbt, sort : tab any_cig

tab daily_cig
by lgbt, sort : tab daily_cig

tab any_smoke
by lgbt, sort : tab any_smoke

tab daily_smoke
by lgbt, sort : tab daily_smoke

tab any_vape
by lgbt, sort : tab any_vape

tab daily_vape
by lgbt, sort : tab daily_vape
	
tab propever_cig
by lgbt, sort : tab propever_cig
	
tab proprepeat_cig
by lgbt, sort : tab proprepeat_cig
	
tab propever_smoke
by lgbt, sort : tab propever_smoke
	
tab proprepeat_smoke
by lgbt, sort : tab proprepeat_smoke
	
tab propever_vape
by lgbt, sort : tab propever_vape

tab proprepeat_vape
by lgbt, sort : tab proprepeat_vape
	
tab phoccai_cig
by lgbt, sort : tab phoccai_cig
	
tab phpack_cig
by lgbt, sort : tab phpack_cig
	
tab phoccai_vape
by lgbt, sort : tab phoccai_vape
	
tab phpack_vape
by lgbt, sort : tab phpack_vape
	