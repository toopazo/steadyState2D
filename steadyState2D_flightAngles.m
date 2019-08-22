function [...
    thrust      , ...
    pitch_deg   , ...
    aoa_deg     , ...
    fpang_deg     ...
    ] = get_flight_angles(...
        vehicle , ...
        medium  , ...
        vel     , ...
        fpang     ...
    )
    
    % xs) T sin(aoa) - D - mg sin(fpang)    = 0
    % zs) T cos(aoa) - mg cos(fpang)        = 0
    % tan(aoa) = ( D + mg sin(fpang) ) / ( mg cos(fpang) )
    % T = (D + mg sin(fpang))

    % fpang = deg2rad(fpang_deg); 
    fpang_deg = rad2deg(fpang);

    mg = vehicle.mass * medium.gmagn;
    q = 0.5 * medium.rho * vel^2;   
    Fdrag = q * vehicle.S * vehicle.Cd;
    tan_aoa = ( +Fdrag +mg * sin(fpang) ) / ( mg * cos(fpang) );
    
    thrust = sqrt( mg^2 + Fdrag^2 + 2*Fdrag*mg*sin(fpang) );

    % Wayne defines aoa = -aoa (positive to produce forward flight)
    % fpang + -pitch = aoa
    aoa = atan(tan_aoa);   
    pitch = fpang - aoa;

    aoa_deg = rad2deg(aoa);    
    pitch_deg = rad2deg(pitch);                
end


