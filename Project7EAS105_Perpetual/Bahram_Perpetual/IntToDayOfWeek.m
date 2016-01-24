function [string] = IntToDayOfWeek(n)
if n == 0
    string = 'Saturday';
elseif n == 1
    string = 'Sunday';
elseif n == 2
    string = 'Monday';
elseif n ==3
    string = 'Tuesday';
elseif n == 4
    string = 'Wednesday';
elseif n == 5
    string = 'Thursday';
elseif n == 6
    string = 'Friday';
else
    string = 'error: pants on fire';
end
end