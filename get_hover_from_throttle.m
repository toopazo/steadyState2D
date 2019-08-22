function vehicle_st = get_hover_from_throttle(...
    vehicle_st, medium_st, hthrottle)
    
    throttle_arr    = vehicle_st.propeller.throttle_arr;   
    rpm_arr         = vehicle_st.propeller.rpm_arr;
    thrust_arr      = vehicle_st.propeller.thrust_arr;    
    Imotor_arr     = vehicle_st.propeller.Imotor_arr;
       
    Nr = vehicle_st.nrotors;   
       
    % Hover conditions assuming hthrottle
    vehicle_st.hover.throttle = hthrottle;
    vehicle_st.hover.rpm = interp1(throttle_arr, rpm_arr, hthrottle);
    vehicle_st.hover.thrust = interp1(throttle_arr, thrust_arr, hthrottle) * Nr;
    vehicle_st.hover.Imotor = interp1(throttle_arr, Imotor_arr, hthrottle);
    vehicle_st.hover.power = vehicle_st.hover.Imotor * vehicle_st.Vmotor;
    vehicle_st.hover.mass = vehicle_st.hover.thrust / medium_st.gmagn;
    
    vehicle_st.mass = vehicle_st.hover.mass;
end


