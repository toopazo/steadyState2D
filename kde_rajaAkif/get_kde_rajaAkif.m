function kde_rajaAkif = get_kde_rajaAkif_st()
    Vsupply = 30;
     
    kde_rajaAkif.throttle_arr   = [0.1 0.5 0.9];
    kde_rajaAkif.Imotor_arr     = [0 0 0];
    kde_rajaAkif.power_arr      = Vsupply * kde_rajaAkif.Imotor_arr;
    kde_rajaAkif.thrust_arr     = [3.690 8.520 10.113];
    kde_rajaAkif.rpm_arr        = [2000 3000 3200];

    fig = figure;
    subplot(3, 1, 1);
    hold on;
    plot(kde_rajaAkif.throttle_arr, kde_rajaAkif.rpm_arr, '*-');
    xlabel('throttle')
    ylabel('rpm')
    grid on;

    subplot(3, 1, 2);
    hold on;
    plot(kde_rajaAkif.throttle_arr, kde_rajaAkif.thrust_arr, '*-');
    xlabel('throttle')
    ylabel('thrust')
    grid on;

    subplot(3, 1, 3);
    hold on;
    plot(kde_rajaAkif.rpm_arr, kde_rajaAkif.thrust_arr, '*-');
    xlabel('rpm')
    ylabel('thrust')
    % title('linreg (3points) around 400RPM slope 0.008, intercept -15.765'); 
    %, r_value 0.990, p_value 0.090, std_err 0.001')
    grid on;

    saveas(fig, 'kde_rajaAkif.png');
    close all
end


