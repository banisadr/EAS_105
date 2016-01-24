function [A,B] = reduceTA(A,B)

SA = TA2SA(A);
SB = TA2SA(B);

RA = SA2rollcall(SA);
RB = SA2rollcall(SB);

count = 1;
while RA(count) == RB(count) && count < size(RA,2)
    count = count + 1;
end

RA = RA(count:end);
RB = RB(count:end);

SA = rollcall2SA(RA);
SB = rollcall2SA(RB);

A = SA2TA(SA);
B = SA2TA(SB);
end