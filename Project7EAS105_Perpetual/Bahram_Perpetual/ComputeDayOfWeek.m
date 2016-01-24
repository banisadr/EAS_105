function [dayOfWeek] = ComputeDayOfWeek(year, month, date)
% mask = [3 6 6 2 4 0 2 5 1 3 6 1];
leapyear = 0;

if mod(year,4) == 0
    leapyear = 1;
    if year == 1800 || year == 1900 || year == 2100
        leapyear = 0;
    end
end

addmonth = 0;
adddate = mod(date,7);
addyear = mod(year-1800,7);
addleap = mod(floor((year-1800)/4),7);
if year >= 1900
    addleap = addleap - 1;
end
if leapyear == 1 && month <3
    addleap = addleap - 1;
    if month == 2 && date == 29
        addleap = addleap + 1;
    end
end

if month == 1
    addmonth = 3;
elseif month == 2
    addmonth = 6;
elseif month == 3
    addmonth = 6;
elseif month == 4
    addmonth = 2;
elseif month == 5
    addmonth = 4;
elseif month == 6
    addmonth = 0;
elseif month == 7
    addmonth = 2;
elseif month == 8
    addmonth = 5;
elseif month == 9
    addmonth = 1;
elseif month == 10
    addmonth = 3;
elseif month == 11
    addmonth = 6;
elseif month == 12
    addmonth = 1;
end
dayOfWeek = mod(addmonth+adddate+addyear+addleap,7);
end