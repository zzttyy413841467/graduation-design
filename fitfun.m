function y=fitfun(x)
k=evalin('base','k');
N=k+1;
state=x(1:6*N);
control=x(6*N+1:6*N+2*k);
t0=x(6*N+2*k+1);
tf=x(6*N+2*k+2);
state1=reshape(state,N,6);
% dis=calcudis(x);
y=cos(state1(end,3)).*cos(state1(1,2)-state1(end,2));




end