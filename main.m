%this file presents a prepared configuration for analysis of sample video
filename='video.mp4';
startT=0;
endT=19;
bidirer=6;
rot=[1.7 5.2 8.8 11.7 15.2 17.6];
texts={'head rot. right', 'head rot. left','eyes to right','eyes to left','eyes to right','eyes to left'} %, 'head rot. right','eyes to right','eyes to left' 


%%detect eigenfeatures in ROI
fs=VideoReader(filename).FrameRate;
[pointsallX, pointsallY]=detectfeaturesinROI(filename,startT,endT,bidirer);
points=[pointsallX(:,end) pointsallY(:,end)];
fig=gcf;
sizefig=fig.Position(3:4);

%%highlight required eigenfeatures
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

