function plot_forward_flight(vehicle_st, medium_st, vel_arr, folder)

    thrust_arr = vehicle_st.propeller.thrust_arr;
    rpm_arr = vehicle_st.propeller.rpm_arr;

    fpang = 0;
    fig = figure;
    hold on;
    for i = 1:size(vel_arr, 2)
        vel = vel_arr(i);
        [...
            thrust      , ...
            pitch_deg   , ...
            aoa_deg     , ...
            fpang_deg     ...
        ] = steadyState2D_flightAngles(vehicle_st, medium_st, vel, fpang);
        
        thrust_per_motor = thrust / vehicle_st.nrotors;
        rpm_per_motor = interp1(thrust_arr, rpm_arr, thrust_per_motor);
        
        aoa_deg_arr(:, i) = aoa_deg;
        pitch_deg_arr(:, i) = pitch_deg;
        % plot(vel, pitch_deg, '*');
        % plot(vel, aoa_deg, 'o');
        
        
        txt = [...
            'thrust ' num2str(thrust) ...
            'N (' num2str(thrust_per_motor) ...
            ' N per motor) rpm ' num2str(rpm_per_motor)];
        dx = 0.5;
        dy = 0;
        if pitch_deg == 0
            dy = +0.5; 
        end
        text(vel+dx, pitch_deg+dy, txt, 'FontSize', 16);
        
    end
    
    aoa_deg_arr
    pitch_deg_arr
    
    plot(vel_arr, pitch_deg_arr, '*');
    
    %text(1, -16, 'At 400RPM four rotors produce a total of 131.84 N');
    hrpm = vehicle_st.hover.rpm;
    hthrust = vehicle_st.hover.thrust;
    mass = vehicle_st.mass;
    vS = vehicle_st.S;
    vCd = vehicle_st.Cd;
    arg = sprintf('hover: %d rotors at %.2f rpm produce %.2f N \n m %.2f kg, S %.2f m2, CD %.2f', vehicle_st.nrotors, hrpm , hthrust, mass, vS, vCd);
    title(arg, 'FontSize', 20)
    
    ylabel('Pitch deg')
    xlabel('Forward velocity m/s')
    grid on;
    % set(gca, 'YLim', [-3 3]);
    xll = min(vel_arr) - 1;
    xul = max(vel_arr) + 20;
    set(gca, 'XLim', [xll xul]);    
    yll = min(pitch_deg_arr) - 5;
    yul = max(pitch_deg_arr) + 5;
    set(gca, 'YLim', [yll yul]);        
    % axis([0 16 -16 1]) % [xmin xmax ymin ymax]    
    set(fig, 'Position', get(0, 'Screensize'));    
    pause(10)
    saveas(fig, [folder '/forward_flight.png'])
    close all
end

