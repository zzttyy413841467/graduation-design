function y = fcn(sign0,delt_sigma,v)
%#codegen
delt_sigma1=12/180*pi;
delt_sigma2=20/180*pi;
if (v>=6000)
    if (delt_sigma>delt_sigma1)
        sign=1;
    elseif (delt_sigma<=delt_sigma1)&&(delt_sigma>=-delt_sigma1)
        sign=sign0;
    else 
        sign=-1;
    end
else
    if (delt_sigma>delt_sigma2)
        sign=1;
    elseif (delt_sigma<=delt_sigma2)&&(delt_sigma>=-delt_sigma2)
        sign=sign0;
    else 
        sign=-1;
    end
end
y =sign;
end