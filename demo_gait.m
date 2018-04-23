x1 = 5:0.2:8;
y1 = 20:0.3:24.5;
x2 = 3:0.5:10.5;
y2 = 10*ones(1,16);
x3 = 1:1:16;
y3 = [2,1.8,1.6,1.4,1.2,1.0,0.8,0.6,0.4,0.2,0.3,0.3,0.4,0.4,0.5,0.5];
x = [x1;x2;x3];
y = [y1;y2;y3];
[~,m]=size(x1);
figure;
hold on
for i = 1:m
     plot(x( :,i),y( :,i),'-bs','LineWidth',2,...
          'MarkerEdgeColor','k',...
          'MarkerFaceColor','g',...
           'MarkerSize',10)
end
