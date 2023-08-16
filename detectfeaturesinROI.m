function [pointsallX, pointsallY]=detectfeaturesinROI(vid,startTime,endTime,bidirer, sizefig)


videoFileReader = VideoReader(vid);
videoFileReader.CurrentTime = startTime;
videoFrame = readFrame(videoFileReader);
figure; imshow(videoFrame); 

promptText = text(sizefig(1)/10,sizefig(2)/10, strcat("draw rectangle around area of interest"),'FontSize',14,'FontWeight','bold','Color','r');


rect=drawrectangle();
delete(promptText);

objectRegion=round(rect.Position);%imrect
points=detectMinEigenFeatures(rgb2gray(videoFrame),'ROI',objectRegion);%,

%%
tracker=vision.PointTracker('MaxBidirectionalError',bidirer);
initialize(tracker,points.Location,videoFrame);
frmpointer=1;
pointsallX=[];
pointsallY=[];
while hasFrame(videoFileReader)& (videoFileReader.CurrentTime<endTime)
    frame= readFrame(videoFileReader);
    [points,validity]=step(tracker,frame);
    out=frame;
    out=insertMarker(out,points(validity,:),'+','Color','c');
    imshow(out)
    pointsallX(:,frmpointer)=points(:,1);
    pointsallY(:,frmpointer)=points(:,2);
    frmpointer=frmpointer+1;
end

pointsallX=pointsallX(validity,:);
pointsallY=pointsallY(validity,:);

end