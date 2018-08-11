alpha1=20;
alpha2=10;
V1=6500;
V2=5000;
V=500:50:8000;
aoa1=(alpha1.*(V>V1)+((V-V1)*(alpha2-alpha1)/(V2-V1)+alpha1).*(V<=V1&V>=V2)+alpha2.*(V<V2));
plot(V,aoa1);
grid on
xlabel('\fontname{Times New Roman}\itV/\rm(m/s)');
ylabel('\alpha/\circ');
title('¹¥½Ç·½°¸');
ylim([0 25]);