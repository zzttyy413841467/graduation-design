function [D2,Dd]=calcuD
k=evalin('base','k');
N=k+1;
point=GetLGR(k);
tau=[point;1];
% syms t;
% L=zeros(N);
% L_b=zeros(k);
% syms L L_b;
% % ¿Î…¢◊¥Ã¨±‰¡ø
% for ii=1:N
%     prod1=1;
%     prod2=1;
%     for jj=1:N
%         if(jj==ii)
%             continue;
%         else
%             prod1=prod1*vpa((t-tau(jj)));
%             prod2=prod2*vpa((tau(ii))-vpa(tau(jj)));
%         end
%     end
%     L(ii)=prod1/prod2;
% end
% L=vpa(L,4);
% D=vpa(diff(L),4);
% for ii=1:k
% D1(ii,:)=subs(D,tau(ii));
% end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
N1 = length(tau)-1;
%  xxPlusEnd = [x; 1];
xxPlusEnd = tau;
M = length(xxPlusEnd);
M1 = M+1;
M2 = M*M;

% Compute the barycentric weights
Y = repmat(xxPlusEnd,1,M);
Ydiff = Y - Y'+eye(M);

WW = repmat(1./prod(Ydiff,2),1,M);
D = WW./(WW'.*Ydiff);

D(1:M1:M2) = 1-sum(D);
D = -D';                %Diff matrix
D2 = D(1:end-1,:);       %Augment for LGR points
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% D2=double(D1);
Dd = [diag(diag(D2(:,1:k))), zeros(k,1)];

end