%coacvitation
function [] = coactivation_figure(emgcomp)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%emg = emgcomp;
%example:
emg = randn(1000,2);

%%%%%%%%%%%%%%%%%%%%%%%%
EMGabs=abs(emg);
emgdata = EMGabs;
plot(emgdata)

% normalization

for j=1:2
    emgmin(j)=min(emgdata(:,j));
    emgmax(j)=max(emgdata(:,j));
    emgnorm(:,j) = (emgdata(:,j)-emgmin(j))/(emgmax(j)-emgmin(j));
end
figure
plot(emgnorm)
% emgnorm = emgdata;

%compute coactivation
%1000 mv divide into 40 mv.
K2 = 1000/50, K1 = K2;
int_x = [0:0.05:1];
int_y = [0:0.05:1];

%Probability density distributions
tic
count_cells = zeros(K1, K2);
for k1 = 1:K1
    inds1 = (emgnorm(:,1)>= int_x(k1))&(emgnorm(:,1)<int_x(k1+1));
    for k2 = 1:K2
        inds2 = (emgnorm(:,2)>= int_y(k2))&(emgnorm(:,2)<int_y(k2+1));
        count_cells(k1,k2) = sum(inds1 .* inds2);
    end
end
figure
hold on

imagesc(count_cells)

%need add legend 
toc
    

