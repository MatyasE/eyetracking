%this file presents a prepared configuration for analysis of sample video
%of child with nystagmus
filename='horizontal nystagmus.avi';

% for the analysis of the rotation to the left set leftrotation to 1,
% otherwise rotation to the right will be analyzed
%change bidirer accordingly
leftrotation=0;
if leftrotation==1
    startT=31;
    endT=38;
    texts={'turn left'};
    rot=[1.6];
    bidirer=30;
else
    startT=1;
    endT=11;
    rot=[2.2 8];
    bidirer=30;
    texts={'turn right' 'nystagmus stops'};
end

%%detect eigenfeatures in ROI
fs=VideoReader(filename).FrameRate;
fig=gcf;
sizefig=fig.Position(3:4);
[pointsallX, pointsallY]=detectfeaturesinROI(filename,startT,endT,bidirer, sizefig);
points=[pointsallX(:,end) pointsallY(:,end)];



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