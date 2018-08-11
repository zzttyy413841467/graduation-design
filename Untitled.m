syms x1 x2
f1=1.5+x1*x2+x1-x2;
f2=10-x1*x2;
f=matlabFunction([f1;f2],'vars',{[x1 x2]},'File','shiyanfun1','Optimize',false)

% f1=@(x)f(x(1),x(2))
