% ��֡��ַ�����֡��ַ������Ϻͱ��ơ�
videoObj = VideoReader('001-bg-01-000.avi');%����Ƶ�ļ�
nframes = get(videoObj, 'NumberOfFrames');%��ȡ��Ƶ�ļ�֡����
%% ��֡��֣�����
for k = 2 : (nframes-1)
    Frame_1 = read(videoObj, k-1);
    currentFrame = read(videoObj, k);%��ȡ��i֡
    Frame_2 = currentFrame;%��ȡ��i֡
    Frame_3 = read(videoObj, k+1);%��ȡ��i+1֡
    
    subplot(1,3,1);%����ͼ����ʾ���ڲ���ȡ��һ�����ھ��
    imshow(currentFrame);
    title('ԭ��Ƶ')
%     % ������Դһ
%     % Convert to grayscale.
%     grayFrame = rgb2gray(currentFrame);%�ҶȻ�
%     if(k==1)
%         grayFrame_1 = grayFrame;
%         imshow( grayFrame_1)
%     end
%    
%     difgrayFrame= grayFrame - grayFrame_1;%��֡��
%    
%     grayFrame_1 = grayFrame;
%    
%     subplot(1,3,2);
%     imshow(difgrayFrame);
%     title('��֡���')
%-----------------------------------
% ��֡��֣�������Դ��
% videoObj = VideoReader('001-bg-01-000.avi');%����Ƶ�ļ�,�������videoObj��
% nframes = get(videoObj, 'NumberOfFrames');%��ȡ��Ƶ�ļ���֡��
% for k = 1 : nframes  %forѭ������ȡÿһ֡
%     currentFrame = read(videoObj, k);%��ȡ��i֡
%     subplot(1,2,1);%����ͼ����ʾ���ڲ���ȡ��һ������
%     imshow(currentFrame); %��ʾһ֡
%     c1 = rgb2gray(currentFrame);%�ҶȻ�
%     grayFrame=medfilt2(c1,[3 3]);%��ֵ�˲�
%     if(k==1)%���ǵ�һ֡����
%         grayFrame_1 = grayFrame;%�ѵ�һ֡��ͼ�������grayFrame_1�У��粻�ǵ�һ֡����ִ���¾�
%     end
%    
%     difgrayFrame= grayFrame - grayFrame_1;%��֡���������֡���һ֡�Ĳ�
%     subplot(1,2,2);%���ڶ�����ͼ
%     imshow(difgrayFrame);%��ʾ��ͼ
%     grayFrame_1 = grayFrame;%���µ�һ��ͼ������
%     pause(0.0001);%��ͣ0.0001��
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
    title('��֡���')
    
   %% ��֡��֣�����
   grayFrame_a = rgb2gray(Frame_1);%�ҶȻ�
   grayFrame_a=medfilt2(grayFrame_a);
   grayFrame_b = rgb2gray(Frame_2);%�ҶȻ�
   grayFrame_b=medfilt2(grayFrame_b);
   grayFrame_c = rgb2gray(Frame_3);%�ҶȻ�
   grayFrame_c=medfilt2(grayFrame_c);
   
   grayFrame_a=im2double(grayFrame_a);
   grayFrame_b=im2double(grayFrame_b);
   grayFrame_c=im2double(grayFrame_c);
   
   m =  grayFrame_b- grayFrame_a;
   n =  grayFrame_c- grayFrame_b;
   t=20; %%��ֵ����ֵ���Ե���
   t=t/256;%%ת��Ϊdouble������
   k=find(abs(m)>=t);%%find�����������ҵ�ͼa�е�ֵ����t�ĵ�����
   s=find(abs(n)>=t);%%find�����������ҵ�ͼb�е�ֵ����t�ĵ�����
   m(k)=255;%%��ֵ����һ
   n(s)=255;
   k=find(abs(m)<t);
   s=find(abs(n)<t);
   m(k)=0;%��ֵ������
   n(s)=0;
   m = im2bw(m,0.5);
   n = im2bw(n,0.5);
   t = m & n;
   subplot(1,3,3);
   imshow(t);
   title('��֡���')
end


   
   
    