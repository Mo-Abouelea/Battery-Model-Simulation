%% Define the Battery Capacity 
Q = 2.3 * 3600;


%% Read Excel Dataset 
Battery_Data  = xlsread('Battery_Parameters.xlsx',1);
SOC           = Battery_Data(:,1);
OCV           = Battery_Data(:,2);
R_Charging    = Battery_Data(:,3);
R_Discharging = Battery_Data(:,4);


%% Plot SOC Vs. OCV, R+, and R- 
figure;
plot(SOC, OCV); xlabel('SOC'); ylabel('OCV [V]'); title('SOC Vs. OCV')


%% Plot SOC Vs. Internal Resistance
figure
subplot(2,1,1)
plot(SOC, R_Charging); grid; xlabel('SOC'); ylabel('Charging Resistance [Ohms]');
title('SOC Vs. Charging and Discharging Resistances')
legend('Charging Resistance')

subplot(2,1,2)
plot(SOC, R_Discharging )
grid; xlabel('SOC'); ylabel('Discharging Resistance [Ohms]');
legend('Discharging Resistance')

%% Model Simulation with 2.3 A starting with a Fully Discharged Cell
% Define the Input Current
i = 2.3;
sim('BatteryModel_Sim');
