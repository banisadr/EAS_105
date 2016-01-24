function AnimateFrame(t_vector )
figure
for i = t_vector
    clf;
    Frame(i);
    xlim([-2,2])
    ylim([-2,2])
    pause(0.5);
end
end