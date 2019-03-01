(* 
Date type : int*int*int 
Date part : year*month*day
year: positive
month: 1~12
day: <31 and less depending on month 
*)

(* not support reasonbale check *)
fun is_older (date1:int*int*int, date2:int*int*int) =
    #1 date1 * 100000 + #2 date1 * 100 + #3 date1 <  #1 date2 * 100000 + #2 date2 * 100 + #3 date2  

	     
fun number_in_month (dates: (int*int*int) list, month:int) =
    if null dates
    then 0
    else if #2 (hd dates) = month
    then 1 + number_in_month(tl dates, month)
    else 0 + number_in_month(tl dates, month)
	    
fun number_in_months (dates: (int*int*int) list, months: int list) = 
    if null months
    then 0
    else number_in_month(dates, hd months) + number_in_months(dates, tl months)

(* -> [(int,int,int),...] *)
fun dates_in_month (dates:(int*int*int) list, month:int) =
    if null dates
    then []
    else if #2 (hd dates) = month
    then hd dates :: dates_in_month(tl dates, month)
    else dates_in_month(tl dates, month)

fun dates_in_months (dates:(int*int*int) list, months: int list) =
    if null months
    then []
    else dates_in_month(dates, hd months) @ dates_in_months(dates, tl months)

fun get_nth (strings: string list, nth: int) =
    if nth > 1
    then get_nth(tl strings, nth-1)
    else hd strings;

fun date_to_string (date: int*int*int) =
    get_nth(["January", "February", "March", "April","May",
	      "June", "July", "August", "September", "October",
	      "November", "December"],#2 date) ^ " " ^ Int.toString(#3 date) ^", " ^ Int.toString(#1 date)

fun number_before_reaching_sum (sum: int, nums: int list) =
    if sum <= 0
    then ~1
    else 1 + number_before_reaching_sum(sum - hd nums, tl nums)
			
fun what_month (days: int) =
    number_before_reaching_sum(days,[31,28,31,30,31,30,31,31,30,31,30,31]) + 1

(* days in month*)
fun month_range (day1: int, day2: int) =
    if day1>day2
    then []
    else what_month(day1) :: month_range(day1+1, day2) 

fun oldest (dates: (int*int*int) list) =
    if null dates
    then NONE
    else
	let val tl_oldest = oldest(tl dates)
	in if isSome tl_oldest andalso is_older(valOf tl_oldest, hd dates)
	   then tl_oldest
	   else SOME (hd dates)
	end
	
