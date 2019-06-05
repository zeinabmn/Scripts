close all
clear all
clc
% vel_x:3	vel_y:4 vel_z:5 velocity_x:15 velocity_y:16	velcoity_z:17
% Points:0:49	Points:1:50	Points:2:51
format long

direc='exp/ASCIIOriginlab/300240/';
a{1}=dlmread([direc,'300240_ax_z2.dat'],',',1,0);
a{2}=dlmread([direc,'300240_ax_z10.dat'],',',1,0);
a{3}=dlmread([direc,'300240_ax_z50.dat'],',',1,0);
a{4}=dlmread([direc,'300240_ax_z100.dat'],',',1,0);
a{5}=dlmread([direc,'300240_ax_z150.dat'],',',1,0);
a{6}=dlmread([direc,'300240_ax_z165.dat'],',',1,0);
a{7}=dlmread([direc,'300240_ax_z180.dat'],',',1,0);


at{1}=dlmread([direc,'300240_rad_z2.dat'],',',1,0);
at{2}=dlmread([direc,'300240_rad_z10.dat'],',',1,0);
at{3}=dlmread([direc,'300240_rad_z50.dat'],',',1,0);
at{4}=dlmread([direc,'300240_rad_z100.dat'],',',1,0);
at{5}=dlmread([direc,'300240_rad_z150.dat'],',',1,0);
at{6}=dlmread([direc,'300240_rad_z165.dat'],',',1,0);
at{7}=dlmread([direc,'300240_rad_z180.dat'],',',1,0);


b{1}=dlmread([direc,'300240_tan_z2.dat'],',',1,0);
b{2}=dlmread([direc,'300240_tan_z10.dat'],',',1,0);
b{3}=dlmread([direc,'300240_tan_z50.dat'],',',1,0);
b{4}=dlmread([direc,'300240_tan_z100.dat'],',',1,0);
b{5}=dlmread([direc,'300240_tan_z150.dat'],',',1,0);
b{6}=dlmread([direc,'300240_tan_z165.dat'],',',1,0);
b{7}=dlmread([direc,'300240_tan_z180.dat'],',',1,0);

%%%%%%IBOFlow
direc='sim/Brush2_keps/';
c{1}=dlmread([direc,'rad1.csv'], ',',1,0);
c{2}=dlmread([direc,'rad2.csv'], ',',1,0');
c{3}=dlmread([direc,'rad3.csv'], ',',1,0);
c{4}=dlmread([direc,'rad4.csv'], ',',1,0);
c{5}=dlmread([direc,'rad5.csv'], ',',1,0);
c{6}=dlmread([direc,'rad6.csv'], ',',1,0);
c{7}=dlmread([direc,'rad7.csv'], ',',1,0);

direc='sim/newInletMod/';
c1{1}=dlmread([direc,'rad1.csv'], ',',1,0);
c1{2}=dlmread([direc,'rad2.csv'], ',',1,0');
c1{3}=dlmread([direc,'rad3.csv'], ',',1,0);
c1{4}=dlmread([direc,'rad4.csv'], ',',1,0);
c1{5}=dlmread([direc,'rad5.csv'], ',',1,0);
c1{6}=dlmread([direc,'rad6.csv'], ',',1,0);
c1{7}=dlmread([direc,'rad7.csv'], ',',1,0);

% direc='sim/Brush2_DESSTairData_uax1p5/rad/';
% c2{1}=dlmread([direc,'rad1.csv'], ',',1,0);
% c2{2}=dlmread([direc,'rad2.csv'], ',',1,0');
% c2{3}=dlmread([direc,'rad3.csv'], ',',1,0);
% c2{4}=dlmread([direc,'rad4.csv'], ',',1,0);
% c2{5}=dlmread([direc,'rad5.csv'], ',',1,0);
% c2{6}=dlmread([direc,'rad6.csv'], ',',1,0);
% c2{7}=dlmread([direc,'rad7.csv'], ',',1,0);

direc='sim/Brush2_keps/';
d{1}=dlmread([direc,'tang1.csv'], ',',1,0);%based on y 50 
d{2}=dlmread([direc,'tang2.csv'], ',',1,0);
d{3}=dlmread([direc,'tang3.csv'], ',',1,0);
d{4}=dlmread([direc,'tang4.csv'], ',',1,0);
d{5}=dlmread([direc,'tang5.csv'], ',',1,0);
d{6}=dlmread([direc,'tang6.csv'], ',',1,0);
d{7}=dlmread([direc,'tang7.csv'], ',',1,0);

direc='sim/newInletMod/';
d1{1}=dlmread([direc,'tang1.csv'], ',',1,0);%based on y 50 
d1{2}=dlmread([direc,'tang2.csv'], ',',1,0);
d1{3}=dlmread([direc,'tang3.csv'], ',',1,0);
d1{4}=dlmread([direc,'tang4.csv'], ',',1,0);
d1{5}=dlmread([direc,'tang5.csv'], ',',1,0);
d1{6}=dlmread([direc,'tang6.csv'], ',',1,0);
d1{7}=dlmread([direc,'tang7.csv'], ',',1,0);

% direc='sim/Brush2_DESSTairData_uax1p5/tang/';
% d2{1}=dlmread([direc,'tang1.csv'], ',',1,0);%based on y 50 
% d2{2}=dlmread([direc,'tang2.csv'], ',',1,0);
% d2{3}=dlmread([direc,'tang3.csv'], ',',1,0);
% d2{4}=dlmread([direc,'tang4.csv'], ',',1,0);
% d2{5}=dlmread([direc,'tang5.csv'], ',',1,0);
% d2{6}=dlmread([direc,'tang6.csv'], ',',1,0);
% d2{7}=dlmread([direc,'tang7.csv'], ',',1,0);


%% radial_axial
clc
close all
titl={'2','10','50','100','150','165','180'};
leg_exp={'LDA'};
leg_sim_f={'ANSYS Fluent'};
leg_sim={'IPS Virtual Paint'};
leg_sim1={'IBOFlow,newInletMod, 20 deg'};
leg_sim2={'IBOFlow,uax 1.5x'};

for i=7:7%numel(a)
    figure

    aa=a{i};
    cc=c{i};
    cc1=c1{i};
%     cc2=c2{i};
    a1=aa(1:end,1);
    a2=aa(1:end,2);
    a1=a1((aa(1:end,3)~=0)&(aa(1:end,4)~=0));
    a2=a2((aa(1:end,3)~=0)&(aa(1:end,4)~=0));
    maxX = max(a1);
    maxY = max(max(aa(1:end,2)), max(aa(1:end,6)));
    minY = min(min(aa(1:end,2)), min(aa(1:end,6)));
    exp=plot(a1,a2,'-o','color','k','LineWidth',2.5,'MarkerSize',6);hold on;
    sim_f=plot(aa(1:5:end,5),aa(1:5:end,6),'-','color',IPAcolorbox(4),'LineWidth',2.5,'MarkerSize',6);hold on;
    sim=plot(cc(1:3:end,50)*1000,-cc(1:3:end,17),'color',IPAcolorbox(3),'LineWidth',2.5,'MarkerSize',6);hold on;
%     sim1=plot(cc1(:,50)*1000,-cc1(:,17),'.','color',colorbox(4),'LineWidth',2,'MarkerSize',6);hold on;
%     sim2=plot(cc2(:,50)*1000,-cc2(:,17),'--','color',colorbox(5),'LineWidth',2,'MarkerSize',6);hold on;

% xlim([-200 200])
xlim([-maxX*1.5 maxX*1.5])
 ylim([-20 65])
set(gcf, 'rend','painters','pos',[10 10 900 600]);
ti = sprintf('Radial direction, axial velocity, Z= -%s', titl{i});
hTitle = title(ti);
hXLabel =  xlabel('Y [mm]');
hYLabel =  ylabel('velocity [m/s]');
hLegend =  legend([exp,sim_f,sim],...
leg_exp{1},leg_sim_f{1},leg_sim{1},...
 'location', 'NorthEast');
legend('boxoff')

set( gca                       , ...
    'FontName'   , 'Times' );
set([ hXLabel, hYLabel], ...
    'FontName'   , 'Times');
set([hLegend, gca]             , ...
    'FontSize'   , 22          );
set([hXLabel, hYLabel]  , ...
    'FontSize'   , 22         );
set( hTitle                    , ...
    'FontName'   , 'Times'     ,... 
    'FontSize'   , 12          , ...
    'FontWeight' , 'bold'      );
ch = findobj(get(hLegend,'children'), 'type', 'line'); %// children of legend of type line
set(ch, 'Markersize', 10); %// set value as desired


set(gca, ...
  'Box'         , 'on'     , ...
  'TickDir'     , 'in'     , ...
  'TickLength'  , [.02 .02] , ...
  'XMinorTick'  , 'on'      , ...
  'YMinorTick'  , 'on'      , ...
  'YGrid'       , 'off'      , ...
  'XColor'      , [0 0 0], ...
  'YColor'      , [0 0 0], ...
  'LineWidth'   , 1         );

figs=sprintf('Z%s', [titl{i},'_rad_axial.fig']);
pngs=sprintf('Z%s', [titl{i},'_rad_axial.png']);
saveas(gcf,figs)
saveas(gcf,pngs)
end

break


%% radial_rad
clc
close all
titl={'2','10','50','100','150','165','180'};
leg_exp={'LDA'};
leg_sim_f={'ANSYS Fluent'};
leg_sim={'IPS Virtual Paint'};
leg_sim1={'IBOFlow,newInletMod, 20 deg'};
leg_sim2={'IBOFlow,uax 1.5x'};

for i=1:numel(a)
    figure
  
    aa=at{i};
    cc=c{i};
    cc1=c1{i};
%     cc2=c2{i};
    a1 = aa(:,1);
    a2 = aa(:,2);
    a1=a1((aa(1:end,3)~=0)&(aa(1:end,4)~=0));
    a2=a2((aa(1:end,3)~=0)&(aa(1:end,4)~=0));
    maxX = max(a1);
    maxY = max(max(aa(1:end,2)), max(aa(1:end,6)));
    minY = min(min(aa(1:end,2)), min(aa(1:end,6)));
    
    exp=plot(a1,a2,'-o','color',colorbox(1),'LineWidth',2.5,'MarkerSize',6);hold on;
    sim_f=plot(aa(1:5:end,5),aa(1:5:end,6),'-','color',IPAcolorbox(4),'LineWidth',2.5,'MarkerSize',6);hold on;
    sim=plot(cc(1:1:end,50)*1000,cc(1:1:end,16),'color',IPAcolorbox(3),'LineWidth',2.5,'MarkerSize',6);hold on;
    %sim1=plot(cc1(1:1:end,50)*1000,cc1(1:1:end,16),'.','color',colorbox(4),'LineWidth',2,'MarkerSize',6);hold on;
%     sim2=plot(cc2(1:3:end,50)*1000,cc2(1:3:end,16),'--','color',colorbox(5),'LineWidth',2,'MarkerSize',6);hold on;
%      aaerr=aa(1:5:end,6);
%     errorbar(cc(:,50)*1000,cc(:,16),(cc(:,16)-aaerr(1:end-6)))
xlim([-maxX*1.5 maxX*1.5])
ylim([-30 50])
set(gcf, 'rend','painters','pos',[10 10 900 600]);
ti = sprintf('Radial direction, radial velocity, Z= -%s', titl{i});
hTitle = title(ti);
hXLabel =  xlabel('Y [mm]');
hYLabel =  ylabel('velocity [m/s]');
hLegend =  legend([exp,sim_f,sim],...
leg_exp{1},leg_sim_f{1},leg_sim{1},...
 'location', 'NorthEast');
legend('boxoff')

set( gca                       , ...
    'FontName'   , 'Times' );
set([ hXLabel, hYLabel], ...
    'FontName'   , 'Times');
set([hLegend, gca]             , ...
    'FontSize'   , 22          );
set([hXLabel, hYLabel]  , ...
    'FontSize'   , 22         );
set( hTitle                    , ...
    'FontName'   , 'Times'     ,... 
    'FontSize'   , 12          , ...
    'FontWeight' , 'bold'      );
ch = findobj(get(hLegend,'children'), 'type', 'line'); %// children of legend of type line
set(ch, 'Markersize', 10); %// set value as desired


set(gca, ...
  'Box'         , 'on'     , ...
  'TickDir'     , 'in'     , ...
  'TickLength'  , [.02 .02] , ...
  'XMinorTick'  , 'on'      , ...
  'YMinorTick'  , 'on'      , ...
  'YGrid'       , 'off'      , ...
  'XColor'      , [0 0 0], ...
  'YColor'      , [0 0 0], ...
  'LineWidth'   , 1         );

figs=sprintf('Z%s', [titl{i},'_rad_rad.fig']);
pngs=sprintf('Z%s', [titl{i},'_rad_rad.png']);
saveas(gcf,figs)
saveas(gcf,pngs)
end

break

%% tang_rad
clc
close all
titl={'2','10','50','100','150','165','180'};
leg_exp={'exp'};
leg_sim_f={'Fluent'};
leg_sim={'IBOFlow'};
leg_sim1={'IBOFlow,newInletMod, 20 deg'};
leg_sim2={'IBOFlow,uax 1.5x'};

for i=1:numel(a)
    figure
  
    aa=b{i};
     cc=d{i};
    % cc1=d1{i};
    a1 = aa(:,1);
    a2 = aa(:,2);
    a1=a1((aa(1:end,3)~=0)&(aa(1:end,4)~=0));
    a2=a2((aa(1:end,3)~=0)&(aa(1:end,4)~=0));
    maxX = max(abs(a1))
    maxY = max(max(aa(1:end,2)), max(aa(1:end,6)))
    minY = min(min(aa(1:end,2)), min(aa(1:end,6)))
    exp=plot(a1,a2,'-o','color','k','LineWidth',2.5,'MarkerSize',6);hold on;
    sim_f=plot(aa(1:5:end,5),aa(1:5:end,6),'-','color',IPAcolorbox(3),'LineWidth',2.5,'MarkerSize',6);hold on;
    sim=plot(cc(1:end,49)*1000,cc(1:end,16),'color',IPAcolorbox(4),'LineWidth',2.5,'MarkerSize',6);hold on;
    %sim1=plot(cc1(1:1:end,49)*1000,cc1(1:1:end,16),'.','color',colorbox(4),'LineWidth',2,'MarkerSize',6);hold on;   %      aaerr=aa(1:5:end,6);
%     errorbar(cc(:,50)*1000,cc(:,16),(cc(:,16)-aaerr(1:end-6)))
    xlim([-maxX*1.5 maxX*1.5])
    ylim([-40 50])
set(gcf, 'rend','painters','pos',[10 10 900 600]);
ti = sprintf('Tangential direction, radial velocity, Z=-%s', titl{i});
hTitle = title(ti);
hXLabel =  xlabel('x [mm]');
hYLabel =  ylabel('velocity [m/s]');
hLegend =  legend([exp,sim_f,sim],...
leg_exp{1},leg_sim_f{1},leg_sim{1},...
 'location', 'NorthEast');
legend('boxoff')

set( gca                       , ...
    'FontName'   , 'Times' );
set([ hXLabel, hYLabel], ...
    'FontName'   , 'Times');
set([hLegend, gca]             , ...
    'FontSize'   , 22          );
set([hXLabel, hYLabel]  , ...
    'FontSize'   , 22         );
set( hTitle                    , ...
    'FontName'   , 'Times'     ,... 
    'FontSize'   , 12          , ...
    'FontWeight' , 'bold'      );
ch = findobj(get(hLegend,'children'), 'type', 'line'); %// children of legend of type line
set(ch, 'Markersize', 10); %// set value as desired


set(gca, ...
  'Box'         , 'on'     , ...
  'TickDir'     , 'in'     , ...
  'TickLength'  , [.02 .02] , ...
  'XMinorTick'  , 'on'      , ...
  'YMinorTick'  , 'on'      , ...
  'YGrid'       , 'off'      , ...
  'XColor'      , [0 0 0], ...
  'YColor'      , [0 0 0], ...
  'LineWidth'   , 1         );

figs=sprintf('Z%s', [titl{i},'_tang_rad.fig']);
pngs=sprintf('Z%s', [titl{i},'_tang_rad.png']);
saveas(gcf,figs)
saveas(gcf,pngs)
end

break

%% xy0
ax{1}=dlmread('exp/ASCIIOriginlab/300240/300240_ax_xy0.dat',',',1,0);
e{1}=dlmread('sim/Brush2_keps/xy0.csv', ',',1,0);
e1{1}=dlmread('sim/Brush2_vy0p5vx0p5/xy0.csv', ',',1,0);
% e2{1}=dlmread('sim/Brush2_DESSTairData_uax1p5/xy0/xy0.csv', ',',1,0);
clc
close all
tit={'Z=[-2,-180]'};
leg_exp={'exp'};
leg_sim_f={'Fluent'};
leg_sim={'IBOFlow'};
leg_sim1={'IBOFlow,newInletMod, 20 deg'};
leg_sim2={'IBOFlow,uax 1.5x'};
figs={'Z2to180_xy0.fig'};
pngs={'Z2to180_xy0.png'};
for i=1:1
    figure
  
    aa=ax{i};
    cc=e{i};
    cc1=e1{i};
%     cc2=e2{i};

    a1 = aa(:,1);
    a2 = aa(:,2);
    a1 = a1(abs(a1)>1e-15);
    a2 = a2(abs(a1)>1e-15);
    exp=plot(a1,a2,'-o','color',colorbox(1),'LineWidth',2,'MarkerSize',6);hold on;
    sim_f=plot(aa(1:5:end,5),aa(1:5:end,6),'+-','color',colorbox(2),'LineWidth',2,'MarkerSize',6);hold on;
    sim=plot(cc(end:-5:1,51)*1000,-cc(1:5:end,17),'color',colorbox(3),'LineWidth',2,'MarkerSize',6);hold on;
    sim1=plot(cc1(end:-5:1,51)*1000,-cc1(1:5:end,17),'.','color',colorbox(4),'LineWidth',2,'MarkerSize',6);hold on;
%     sim2=plot(cc2(end:-5:1,51)*1000,-cc2(1:5:end,17),'--','color',colorbox(5),'LineWidth',2,'MarkerSize',6);hold on;

 xlim([0 200])
 ylim([-20 20])
set(gcf, 'rend','painters','pos',[10 10 900 600]);
ti = sprintf('axial direction, axial velocity, %s', tit{i});
hTitle = title(ti);
hXLabel =  xlabel('Z [mm]');
hYLabel =  ylabel('velocity [m/s]');
hLegend =  legend([exp,sim_f,sim,sim1],...
leg_exp{i},leg_sim_f{i},leg_sim{i},leg_sim1{i},...
 'location', 'NorthEast');
legend('boxoff')

set( gca                       , ...
    'FontName'   , 'Times' );
set([ hXLabel, hYLabel], ...
    'FontName'   , 'Times');
set([hLegend, gca]             , ...
    'FontSize'   , 22          );
set([hXLabel, hYLabel]  , ...
    'FontSize'   , 22         );
set( hTitle                    , ...
    'FontName'   , 'Times'     ,... 
    'FontSize'   , 12          , ...
    'FontWeight' , 'bold'      );
ch = findobj(get(hLegend,'children'), 'type', 'line'); %// children of legend of type line
set(ch, 'Markersize', 10); %// set value as desired


set(gca, ...
  'Box'         , 'on'     , ...
  'TickDir'     , 'in'     , ...
  'TickLength'  , [.02 .02] , ...
  'XMinorTick'  , 'on'      , ...
  'YMinorTick'  , 'on'      , ...
  'YGrid'       , 'off'      , ...
  'XColor'      , [0 0 0], ...
  'YColor'      , [0 0 0], ...
  'LineWidth'   , 1         );
saveas(gcf,figs{i})
saveas(gcf,pngs{i})
end

break
