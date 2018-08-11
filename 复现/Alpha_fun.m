function [alpha]=Alpha_fun(v)
if v<775
    alpha0=18;
elseif 775<=v&v<4000
    alpha0=18+(v-775)/146;
else
    alpha0=40;
end
alpha=alpha0;
end