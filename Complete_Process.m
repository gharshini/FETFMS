q=330;
% plot(x1(q),y1(q),'*','MarkerSize',10)
% plot(x(q),y(q),'*','MarkerSize',10)
u2=[u1',u'];
v2=[v1',v'];
u2=u2';
v2=v2';
h1=figure;
imshow(img_gray(:,:,q))
hold on
plot(u1(q),v1(q),'o')
plot(u2(:,q),v2(:,q),'*-')
hold off