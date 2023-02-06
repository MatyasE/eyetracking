function []=plotmovements(time,fs,pointsLeft,pointsFixedLeft,pointsFixedRight,pointsRight,rot, texts)

fsize=25;

ln=sqrt((pointsLeft(1,:)-pointsFixedLeft(1,:)).^2+(pointsLeft(2,:)-pointsFixedLeft(2,:)).^2);
%the lower more->adduction - right movement

rn=sqrt((pointsRight(1,:)-pointsFixedRight(1,:)).^2+(pointsRight(2,:)-pointsFixedRight(2,:)).^2);
%the lower more->abduction - left movement

lnnorm=sqrt((pointsFixedLeft(1,:)-pointsFixedRight(1,:)).^2+(pointsFixedLeft(2,:)-pointsFixedRight(2,:)).^2);

normmov=6;

subplot(211)
result=movmean(ln,normmov)./movmean(lnnorm,normmov);
mean(result);
plot([time],[result],'r','LineWidth',3); hold on
xlabel('time [seconds]')
ylabel('adduction [pts]')
for arg=1:length(rot)
    plot([rot(arg) rot(arg)],[-50 50], 'k','LineWidth',3)
    text(rot(arg),mean(result),texts(arg),'FontSize',fsize)
end
xlim([0 floor(max(time))])
ylim([min(result) max(result)])
yticks([min(result) max(result)])
yticklabels({'min','max'})
title("left eye")
grid on;
set(gca,'FontWeight','bold')
set(gca,'FontSize',fsize);

subplot(212)
result2=-movmean(rn,normmov)./movmean(lnnorm,normmov);
mean(result2);
plot(time,result2,'r','LineWidth',3); hold on
xlabel('time [seconds]')
ylabel('adduction [pts]')
for arg=1:length(rot)
    plot([rot(arg) rot(arg)],[-50 50], 'k','LineWidth',3); hold on;
    text(rot(arg),mean(result2),texts(arg),'FontSize',fsize)
end
xlim([0 floor(max(time))])
ylim([min(result2) max(result2)])
yticks([min(result2) max(result2)])
yticklabels({'min','max'})

title("right eye")
grid on;
set(gca,'FontWeight','bold')
set(gca,'FontSize',fsize);