close all
clear all
clc

%    g_magn      = 9.81;                 % [m / s^2]
%    density     = 1.225;                % [kg / m^3]
%    viscosity   = 1.46 * 10^(-5);       % [m^2 / s]
%    sound_speed = 340;                  % [m / s]
medium_st.rho = 1.225;
medium_st.gmagn = 9.81;

vehicle_st.nrotors = 8;
vehicle_st.S = 0.7;
vehicle_st.Cd = 0.85;
vehicle_st.Vmotor = 30;

disp('***************************************************************')
disp('Multirotor steadyState condition for kde_rajaAkif rotor model')
folder = 'kde_rajaAkif';     

cd(folder);
kde_rajaAkif = get_kde_rajaAkif();
vehicle_st.propeller = kde_rajaAkif;
cd('../');

% Assuming that the vehicle is at hover, find: rpm, thrust, mass
% so that the assumed hthrottle is realizable (possible)
hthrottle   = 0.5;
vehicle_st  = get_hover_from_throttle(vehicle_st, medium_st, hthrottle);

vel_arr = [0 5.45 6.85 8.3 9.15 9.8];
plot_forward_flight(vehicle_st, medium_st, vel_arr, folder);    

return    
    
%disp('***************************************************************')
%disp('kde_cf185_dp')

%kde_cf185_dp = get_kde_cf185_dp_st();
%vehicle_st.propeller = kde_cf185_dp;

%% Hover conditions assuming 62.5% throttle
%hover_throttle = 62.5;
%vehicle_st = get_hover_from_throttle(vehicle_st, medium_st, hover_throttle);

%prepath = 'kde_cf185_dp';
%Va = 6;
%fpang = 0;
%[...
%    thrust      , ...
%    pitch_deg   , ...
%    aoa_deg     , ...
%    fpang_deg     ...
%] = get_flight_angles(vehicle_st, medium_st, Va, fpang, prepath);

%vel_arr = 0:10;
%plot_forward_flight(vehicle_st, medium_st, vel_arr, prepath);
%return

%%disp('***************************************************************')
%%disp('kde_cf245_dp')
%%% Hover conditions assuming 50.0% throttle
%%kde_cf245_dp.hover.throttle = 50.0;
%%kde_cf245_dp.hover.rpm = 2820;
%%kde_cf245_dp.hover.thrust = 26.67 * vehicle_st.nrotors;
%%kde_cf245_dp.hover.Imotor = 7.7;
%%kde_cf245_dp.hover.power = kde_cf245_dp.hover.Imotor * Vmotor;
%%kde_cf245_dp.mass = kde_cf245_dp.hover.thrust / medium_st.gmagn;

%%kde_cf245_dp.hover
%%mass = kde_cf245_dp.mass

%%vehicle_st.mass = mass;
%%Va = 6;
%%fpang = 0;
%%[...
%%    thrust      , ...
%%    pitch_deg   , ...
%%    aoa_deg     , ...
%%    fpang_deg     ...
%%] = get_flight_angles(vehicle_st, medium_st, Va, fpang, 'kde_cf245_dp')

%%disp('***************************************************************')
%%disp('kde_cf245_dp_real')
%%% For 24.5 blades and 55% throttle (real data)
%%kde_cf245_dp_real.hover.throttle = 55;
%%kde_cf245_dp_real.hover.rpm = 'unknown';
%%kde_cf245_dp_real.hover.thrust = 16.0 * medium_st.gmagn;
%%kde_cf245_dp_real.hover.Imotor = 8.0;
%%kde_cf245_dp_real.hover.power = kde_cf245_dp_real.hover.Imotor * Vmotor;
%%kde_cf245_dp_real.mass = 16.0;

%%kde_cf245_dp_real.hover
%%mass = kde_cf245_dp_real.mass

%%vehicle_st.mass = mass;
%%Va = 6;
%%fpang = 0;
%%[...
%%    thrust      , ...
%%    pitch_deg   , ...
%%    aoa_deg     , ...
%%    fpang_deg     ...
%%] = get_flight_angles(vehicle_st, medium_st, Va, fpang, 'kde_cf245_dp_real')


