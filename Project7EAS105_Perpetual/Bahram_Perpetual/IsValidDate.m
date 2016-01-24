function [boolean] = IsValidDate( year, month, date)
leapyear = 0;
boolean = 0;
if mod(year,4) == 0
    leapyear = 1;
    if year == 1800 || year == 1900 || year == 2100
        leapyear = 0;
    end
end
if month == 1
    if date < 32
        boolean = 1;
    end
elseif month == 2
    if date < 29
        boolean = 1;
    elseif date < 30 && leapyear == 1;
        boolean = 1;
    end
elseif month == 3
    if date < 32
        boolean = 1;
    end
elseif month == 4
    if date < 31
        boolean = 1;
    end
elseif month == 5
    if date < 32
        boolean = 1;
    end
elseif month == 6
    if date < 31
        boolean = 1;
    end
elseif month == 7
    if date < 32
        boolean = 1;
    end
elseif month == 8
    if date < 32
        boolean = 1;
    end
elseif month == 9
    if date < 31
        boolean = 1;
    end
elseif month == 10
    if date < 32
        boolean = 1;
    end
elseif month == 11
    if date < 31
        boolean = 1;
    end
elseif month == 12
    if date < 32
        boolean = 1;
    end
end
end