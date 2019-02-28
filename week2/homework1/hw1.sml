fun is_older (date1:int*int*int,date2:int*int*int) =
    if ((#1 date1)*10000 + (#2 date1)*100 + (#3 date1)*1) < ((#1 date2)*10000 + (#2 date2)*100 + (#3 date2)*1)
    then true
    else false

fun number_in_month (dates: int*int*int list, month: int) =
    if null dates
    then 0
    else
	if  #2 hd(dates) = month
	then 1 + number_in_month(tl(dates),month)
	else 0 + number_in_month(tl(dates),month)

fun number_in_months () =
    ()

fun dates_in_month () =
    ()

fun dates_in_months () =
    ()

fun get_nth () =
    ()

fun date_to_string () =
    ()

fun number_before_reaching_sum () =
    ()

fun what_month () =
    ()

fun month_range () =
    ()

fun olddest () =
    ()
