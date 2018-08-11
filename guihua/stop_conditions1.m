function [value,isterminal,direction]=stop_conditions1(t,y)

r=y(1);
h=r-6371393;
value=h-15000;
isterminal=1;
direction=-1;
end
