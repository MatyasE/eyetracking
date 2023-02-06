function [indl] = higlightfeaturesclosetoPOI(sizefig,points,prompt);

promptText = text(sizefig(1)/10,sizefig(2)/10, strcat("point to ",prompt),'FontSize',14,'FontWeight','bold','Color','r');

point=drawpoint("Color",'c')
point.Label=prompt;
delete(promptText);
lp=point.Position;
[~,dist1]=dsearchn(lp,points);
indl=find(dist1<20)

end