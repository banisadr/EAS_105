function c= TestFunctionDiffList()

c={};

t0=(0:0.2:2)';
y0= @(t)((t+1).^2-0.5.*exp(t));
yp0=@(t)(2*t+2-0.5.*exp(t));

c{12}={t0, y0(t0), yp0(t0)};

t1=(0:0.5:1)';
y1 = @(t)(0.2*t.*exp(3*t)-0.04*exp(3*t)+0.04*exp(-2*t));
yp1=@(t)(0.08.*exp(3*t)+0.6*t.*exp(3*t)-0.08.*exp(-2*t));

c{1}={t1, y1(t1), yp1(t1)};

t2 = (2:0.5:3)';
y2 =  @(t)(t+1./(1-t));
yp2=@(t)(1+1./((1-t).^2));

c{2}={t2, y2(t2), yp2(t2)};

t3 = (1:0.25:2)';
y3 =  @(t)(t.*log(t)+2*t);
y3p=@(t)(log(t)+3);

c{3}={t3, y3(t3),y3p(t3)};

t4 = (0:0.25:1)';
y4 =   @(t)(0.5.*sin(2*t)-(1/3).*cos(3*t)+(4/3));
y4p=@(t)(cos(2*t)+sin(3*t));


c{4}={t4, y4(t4),y4p(t4)};

t5 = (1:0.1:2)';
y5 = @(t)(t ./ (1 + log(t) ));
yp5=@(t)(1./(log(t)+1)-1./((log(t)+1).^2));

c{5}={t5, y5(t5),yp5(t5)};

t6 = (1:0.2:3)';
y6 = @(t)(t.*tan(log(t)));
y6p=@(t)(tan(log(t))+1+tan(log(t)).^2);

c{6}={t6, y6(t6),y6p(t6)};

t7 = (0:0.2:2)';
y7 = @(t)(-3 + 2./(1+exp(-2*t)));
y7p=@(t)(4*exp(-2*t)./((1+exp(-2*t)).^2));

c{7}={t7, y7(t7),y7p(t7)};

t8 =  (0:0.1:1)';
y8 = @(t)(t.^2+(1/3)*exp(-5*t));
yp8=@(t)(2*t-(5/3).*exp(-5*t));

c{8}={t8, y8(t8),yp8(t8)};

t9 = (1:0.1:2)';
y9 = @(t)(t.^2.*(  exp(t)-exp(1)  ));
y9p=@(t)(2*t.*(exp(t)-exp(1))+t.^2.*exp(t));

c{9}={t9, y9(t9),y9p(t9)};

tA = (1:0.05:2)';
yA = @(t)(-1./t);
yAp=@(t)(1./t.^2);

c{10}={tA, yA(tA),yAp(tA)};

tB = (0:0.05:5)';
yB = @(t)(exp(-t)+t);
yBp = @(t)(-exp(-t)+1);

c{11}={tB, yB(tB),yBp(tB)};

%examples are from Burden and Faires 6th Edition chapter 5, but the
%integrals of those problems.

end