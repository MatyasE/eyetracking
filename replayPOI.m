function replayPOI(filename,startT,endT,pointsallX,pointsallY,indl,indfl,indfr,indr)
videoFileReader = VideoReader('vid.mp4');
videoFileReader.CurrentTime = startT;
videoFrame = readFrame(videoFileReader);
frmpointer=1;
while hasFrame(videoFileReader)& (videoFileReader.CurrentTime<endT)
    frame= readFrame(videoFileReader);
    out=frame;
    out=insertMarker(out,[pointsallX(indl,frmpointer),pointsallY(indl,frmpointer)],'+','Color','c');
    out=insertMarker(out,[pointsallX(indfl,frmpointer),pointsallY(indfl,frmpointer)],'+','Color','r');
    out=insertMarker(out,[pointsallX(indfr,frmpointer),pointsallY(indfr,frmpointer)],'+','Color','r');
    out=insertMarker(out,[pointsallX(indr,frmpointer),pointsallY(indr,frmpointer)],'+','Color','c');
    imshow(out)
    frmpointer=frmpointer+1;
end
