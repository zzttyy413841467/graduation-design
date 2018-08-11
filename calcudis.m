function dis=calcudis(x)

k=evalin('base','k');
N=k+1;

state=x(1:6*N);
control=x(6*N+1:6*N+2*k);
t0=x(6*N+2*k+1);
tf=x(6*N+2*k+2);
state1=reshape(state,N,6);
stru.state=state1(1:k,:);
stru.control=reshape(control,k,2);
stru.time=[t0 tf];
% for ii=1:N
%     for jj=1:6
%         stru.state(ii,jj)=x(N*(jj-1)+ii);
%     end
% end
% stru.control=zeros(k,2);
% for ii=1:k
%     for jj=1:2
%         stru.control(ii,jj)=x(6*N+k*(jj-1)+ii);
%     end
% end
% stru.time=[x(6*N+2*k+1) x(6*N+2*k+2)];
rydot=(tf-t0)./2.*dydt(stru);
[D,Dd]=calcuD;

lydot=D*state1;

dis=lydot-rydot;

end