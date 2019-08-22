function plot_flight_angles(pitch, aoa, fpang, prepath)
    fig = figure;
    subplot(2, 1, 1);
    hold on;
    plot([0 1], [0 fpang])
    plot([0 1], [0 pitch])
    plot([0 1], [0 0])
    legend('fpang', 'pitch (rotor disk plane)', 'horizon')
    grid on;

    subplot(2, 1, 2);
    hold on;
    plot([0 1], [0 0])
    plot([0 1], [0 -aoa])
    legend('rotor disk plane', '-aoa (wind vel)')
    grid on;

    saveas(fig, [prepath '_flight_angles.png']);
    close all
end


