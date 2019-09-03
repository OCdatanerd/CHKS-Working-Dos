

gen gpa= 9-a18 if !missing(a18)
gen acadpress= gpa*acadmotiv
regress acadpress connect engprofc_n~g
regress acadpress connect engprof_n~g
