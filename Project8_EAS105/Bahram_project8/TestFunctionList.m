function c= TestFunctionList()

c={};

f0 = @(t,y)(y-t.^2+1);
init0 = 0.5;
t0=(0:0.2:2)';
y0= @(t)((t+1).^2-0.5.*exp(t));

c{12}={f0, t0, init0, y0};

f1 =  @(t,y)(t.*exp(3*t)-2*y);
init1=0;
t1=(0:0.5:1)';
y1 = @(t)(0.2*t.*exp(3*t)-0.04*exp(3*t)+0.04*exp(-2*t));

c{1}={f1, t1, init1, y1};

f2 = @(t,y)(1+(t-y).^2);
init2 = 1;
t2 = (2:0.5:3)';
y2 =  @(t)(t+1./(1-t));

c{2}={f2, t2, init2, y2};

f3 =  @(t,y)(1+y./t);
init3 = 2;
t3 = (1:0.25:2)';
y3 =  @(t)(t.*log(t)+2*t);

c{3}={f3, t3, init3, y3};

f4 =  @(t,y)(cos(2*t)+sin(3*t));
init4 =  1;
t4 = (0:0.25:1)';
y4 =   @(t)(0.5*sin(2*t)-(1/3)*cos(3*t)+(4/3));

c{4}={f4, t4, init4, y4};

f5 = @(t,y)(y./t - (y./t).^2);
init5 = 1;
t5 = (1:0.1:2)';
y5 = @(t)(t ./ (1 + log(t) ));

c{5}={f5, t5, init5, y5};
f6 = @(t,y)(1 + y./t + (y./t).^2);
init6 = 0;
t6 = (1:0.2:3)';
y6 = @(t)(t.*tan(log(t)));

c{6}={f6, t6, init6, y6};

f7 = @(t,y)(-(y+1).*(y+3));
init7 = -2;
t7 = (0:0.2:2)';
y7 = @(t)(-3 + 2./(1+exp(-2*t)));

c{7}={f7, t7, init7, y7};

f8 = @(t,y)(-5*y+5*t.^2+2*t);
init8 = (1/3);
t8 =  (0:0.1:1)';
y8 = @(t)(t.^2+(1/3)*exp(-5*t));

c{8}={f8, t8, init8, y8};

f9 = @(t,y)(2*y./t + t.^2.*exp(t));
init9 = 0;
t9 = (1:0.1:2)';
y9 = @(t)(t.^2.*(  exp(t)-exp(1)  ));

c{9}={f9, t9, init9, y9};

fA = @(t,y)(1./(t.^2) - y./t - y.^2);
initA = -1;
tA = (1:0.05:2)';
yA = @(t)(-1./t);

c{10}={fA, tA, initA, yA};

fB = @(t,y)(-y+t+1);
initB = 1;
tB = (0:0.05:5)';
yB = @(t)(exp(-t)+t);

c{11}={fB, tB, initB, yB};

%examples are from Burden and Faires 6th Edition chapter 5

end