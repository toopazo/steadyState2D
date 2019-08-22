function vehicle_st = get_hover_from_thrust(...
    vehicle_st, medium_st, hrpm, hthrust)
    
    % throttle_arr    = vehicle_st.propeller.throttle_arr;   
    % rpm_arr         = vehicle_st.propeller.rpm_arr;
    % thrust_arr      = vehicle_st.propeller.thrust_arr;    
    % Imotor_arr     = vehicle_st.propeller.Imotor_arr;
       
    % Nr = vehicle_st.nrotors;    
    % hthrottle = hover_throttle;
       
    % Hover conditions assuming hover_throttle
    vehicle_st.hover.throttle   = 0;
    vehicle_st.hover.rpm        = hrpm;
    vehicle_st.hover.thrust     = hthrust;
    vehicle_st.hover.Imotor     = 0;
    vehicle_st.hover.power      = vehicle_st.hover.Imotor * vehicle_st.Vmotor;
    vehicle_st.hover.mass       = vehicle_st.hover.thrust / medium_st.gmagn;
    
    vehicle_st.mass             = vehicle_st.hover.mass;
end


