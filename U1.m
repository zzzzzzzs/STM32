%��λΪ:um
%��Χ����ı���
p0 = 0;
r1 = 100;
r2 = 100;
NA = 0.56;
%�Ӻ���
p = (r1 + r2 + p0);
my_tanN = (NA / sqrt(1 - NA^2));
fanwei0 = p0 / (2 * my_tanN);%��Χ
fanwei1 = (sqrt(p^2 + r2^2) - r1) / 2 * my_tanN;
fanwei2 = (p - r1 + r2) / 2 * my_tanN;
%�ֶκ�����4����
%��һ����
d1 = 0:(p0*sqrt(NA^2 - 1))/2;
M1 = 0;
% plot(d1,M1);
%�ڶ�����
d2 = fanwei0:fanwei1;
q2 = (2 .* d2 * my_tanN + r1);
fai2 = 1 / cos((p^2 + q2.^2 - r2^2)/((2 * p).*q2));
M2 = (fai2 * (q2.^2) + (1./sin(q2 .* sin(fai2) ./ r2)) * r2^2 - p .* q2 .* sin(fai2)) ./ (pi .* (q2.^2));
% plot(d2, M2);
%��������
d3 = fanwei1:fanwei2;
q3 = (2.*d3 * my_tanN + r1);
fai3 = 1 / cos((p^2 + q3.^2 - r2^2)/((2 * p).*q3));
M3 = (fai3 * (q3.^2) + (pi-1./sin(q3 .* sin(fai3)) / r2) * r2^2 - p .* q3 .* sin(fai3)) ./ (pi .* (q3.^2));
% plot(d3, M3);
%���Ĳ���
d4 = fanwei2:500;
q4 = (2 * d4 * my_tanN + r1);
M4 = (r2./q4).^2;
d = [d1 d2 d3 d4];
M = [M1 M2 M3 M4];
% d = d4;
% M = M4;
plot(d, M);
grid on;