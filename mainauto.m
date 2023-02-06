clear all

l=1
if l==0
    startT=35;
    endT=41;
    texts={'turn left'};
    rot=[0.5];
    bidirer=11;
else
    startT=5
    endT=15;
    rot=[1.6 7.1];
    bidirer=6;
    texts={'turn right' 'nystagmus stops'};
end

filename='vid.mp4';

fs=VideoReader(filename).FrameRate;
[pointsallX, pointsallY]=detectfeaturesinROI('vid.mp4',startT,endT,bidirer);
points=[pointsallX(:,end) pointsallY(:,end)];
fig=gcf;
sizefig=fig.Position(3:4);

indl=higlightfeaturesclosetoPOI(sizefig,points,"left eye pupil");
indfl=higlightfeaturesclosetoPOI(sizefig,points,"left medial commisure");
indfr=higlightfeaturesclosetoPOI(sizefig,points,"right medial commisure");
indr=higlightfeaturesclosetoPOI(sizefig,points,"right eye pupil");
close(fig)

pointsLeft=[mean(pointsallX(indl,:),1); mean(pointsallY(indl,:),1)];
pointsFixedLeft=[mean(pointsallX(indfl,:),1); mean(pointsallY(indfl,:),1)];
pointsFixedRight=[mean(pointsallX(indfr,:),1); mean(pointsallY(indfr,:),1)];
pointsRight=[mean(pointsallX(indr,:),1); mean(pointsallY(indr,:),1)];

%% replay POI
replayPOI(filename,startT,endT,pointsallX,pointsallY,indl,indfl,indfr,indr);

%%plot it
time=linspace(0,length(pointsLeft)/fs,length(pointsLeft));
plotmovements(time,fs,pointsLeft,pointsFixedLeft,pointsFixedRight,pointsRight,rot,texts);