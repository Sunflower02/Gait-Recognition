% 二帧差分法，三帧差分法，网上和本科。
videoObj = VideoReader('001-bg-01-000.avi');%读视频文件
nframes = get(videoObj, 'NumberOfFrames');%获取视频文件帧个数
%% 二帧差分，本科
for k = 2 : (nframes-1)
    Frame_1 = read(videoObj, k-1);
    currentFrame = read(videoObj, k);%读取第i帧
    Frame_2 = currentFrame;%读取第i帧
    Frame_3 = read(videoObj, k+1);%读取第i+1帧
    
    subplot(1,3,1);%创建图像显示窗口并获取第一个窗口句柄
    imshow(currentFrame);
    title('原视频')
%     % 网上来源一
%     % Convert to grayscale.
%     grayFrame = rgb2gray(currentFrame);%灰度化
%     if(k==1)
%         grayFrame_1 = grayFrame;
%         imshow( grayFrame_1)
%     end
%    
%     difgrayFrame= grayFrame - grayFrame_1;%邻帧差
%    
%     grayFrame_1 = grayFrame;
%    
%     subplot(1,3,2);
%     imshow(difgrayFrame);
%     title('邻帧差分')
%-----------------------------------
% 领帧差分，网上来源二
% videoObj = VideoReader('001-bg-01-000.avi');%读视频文件,存入变量videoObj中
% nframes = get(videoObj, 'NumberOfFrames');%获取视频文件的帧数
% for k = 1 : nframes  %for循环，读取每一帧
%     currentFrame = read(videoObj, k);%读取第i帧
%     subplot(1,2,1);%创建图像显示窗口并获取第一个窗口
%     imshow(currentFrame); %显示一帧
%     c1 = rgb2gray(currentFrame);%灰度化
%     grayFrame=medfilt2(c1,[3 3]);%中值滤波
%     if(k==1)%如是第一帧，则：
%         grayFrame_1 = grayFrame;%把第一帧灰图存入变量grayFrame_1中，如不是第一帧，则执行下句
%     end
%    
%     difgrayFrame= grayFrame - grayFrame_1;%邻帧差，计算后面的帧与第一帧的差
%     subplot(1,2,2);%画第二个子图
%     imshow(difgrayFrame);%显示差图
%     grayFrame_1 = grayFrame;%更新第一灰图的内容
%     pause(0.0001);%暂停0.0001秒
% end

    a = currentFrame;
    b = Frame_3;
    a=rgb2gray(a);
    b=rgb2gray(b);
    a=medfilt2(a);
    b=medfilt2(b);
    a=im2double(a);
    b=im2double(b);
    c=b-a;
    t=20;
    t=t/256;
    d=find(abs(c)>t);
    c(d)=255;
    e=find(abs(c)<=t);
    c(e)=0;

    subplot(1,3,2);
   % imshow(difgrayFrame);
    imshow(c);
    title('邻帧差分')
    
   %% 三帧差分，本科
   grayFrame_a = rgb2gray(Frame_1);%灰度化
   grayFrame_a=medfilt2(grayFrame_a);
   grayFrame_b = rgb2gray(Frame_2);%灰度化
   grayFrame_b=medfilt2(grayFrame_b);
   grayFrame_c = rgb2gray(Frame_3);%灰度化
   grayFrame_c=medfilt2(grayFrame_c);
   
   grayFrame_a=im2double(grayFrame_a);
   grayFrame_b=im2double(grayFrame_b);
   grayFrame_c=im2double(grayFrame_c);
   
   m =  grayFrame_b- grayFrame_a;
   n =  grayFrame_c- grayFrame_b;
   t=20; %%阈值，此值可以调节
   t=t/256;%%转化为double型数据
   k=find(abs(m)>=t);%%find函数作用是找到图a中的值大于t的点坐标
   s=find(abs(n)>=t);%%find函数作用是找到图b中的值大于t的点坐标
   m(k)=255;%%二值化的一
   n(s)=255;
   k=find(abs(m)<t);
   s=find(abs(n)<t);
   m(k)=0;%二值化的零
   n(s)=0;
   m = im2bw(m,0.5);
   n = im2bw(n,0.5);
   t = m & n;
   subplot(1,3,3);
   imshow(t);
   title('三帧差分')
end


   
   
    