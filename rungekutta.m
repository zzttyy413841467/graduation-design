function [y1,ti]=rungekutta(dy,y0,h,t0,t1)
c=(t1-t0)/h;
i=1;
y=y0;
y1=zeros(c,4);
y1(1,:)=y;
tt=0;
for t=t0:h:t1
    tt=t;
    if i<=c
        k1=dy(t,y);
        k2=dy(t+h/2,y+h*k1/2);
        k3=dy(t+h/2,y+h*k2/2);
        k4=dy(t+h,y+h*k3);
        y=y+(h/6)*(k1+2*k2+2*k3+k4);
        if y(4)<0
            break
        end
        i=i+1;
        y1(i,:)=y;
    end
end
ti=(t0:h:tt)';
y1(((i+1):c),:)=[];
end
