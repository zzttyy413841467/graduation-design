function P=Legendre2(n,x)
if (n==0)
    P=1;
elseif (n==1)
	P=x;
else
	P=((2*n-1)*x*Legendre2(n-1,x)-(n-1)*Legendre2(n-2,x))/(n);
end
end

