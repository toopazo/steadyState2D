function kde_cf185_dp = get_kde_cf185_dp_st()
    Vsupply = 30;
     
    kde_cf185_dp.throttle_arr = [25 37.5 50 62.5 75 87.5 100];
    kde_cf185_dp.Imotor_arr = [0.9 1.8 3.1 5.1 7.9 11.7 15.5];
    kde_cf185_dp.power_arr = Vsupply * kde_cf185_dp.Imotor_arr;
    kde_cf185_dp.thrust_arr = [4.12 7.26 11.57 16.48 22.36 30.11 38.34];
    kde_cf185_dp.rpm_arr = [1920 2500  3240 3980 4520 5260 5880];

    fig = figure;
    subplot(3, 1, 1);
    hold on;
    plot(kde_cf185_dp.throttle_arr, kde_cf185_dp.rpm_arr, '*-');
    xlabel('throttle')
    ylabel('rpm')
    grid on;

    subplot(3, 1, 2);
    hold on;
    plot(kde_cf185_dp.throttle_arr, kde_cf185_dp.thrust_arr, '*-');
    xlabel('throttle')
    ylabel('thrust')
    grid on;

    subplot(3, 1, 3);
    hold on;
    plot(kde_cf185_dp.rpm_arr, kde_cf185_dp.thrust_arr, '*-');
    xlabel('rpm')
    ylabel('thrust')
    % title('linreg (3points) around 400RPM slope 0.008, intercept -15.765'); 
    %, r_value 0.990, p_value 0.090, std_err 0.001')
    grid on;

    saveas(fig, 'kde_cf185_dp.png');
    close all
end


