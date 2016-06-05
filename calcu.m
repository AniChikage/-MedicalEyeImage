
% file_path = '';
% img_path_list = dir(strcat(file_path,'*.jpg'));
% img_num = length(img_path_list);
% aaa=1;
% 
%     img_name = img_path_list(i).name;
%     imgrgb = imread(img_name);
    [m,n] = size(imgrgb);
    llbound=200;
    lbound=700;
    rbound=1500;
    imgrgb_t=imgrgb(llbound:m/3,lbound:rbound,:);
    imgrgb_tt=imgrgb(llbound:m/3,lbound:rbound,:);
    
    [m1,n1] = size(imgrgb_t);
    figure;
    imshow(imgrgb_tt);
    thresh = 35;
    rb = 22;
    rs = 2;
    ll = rb;
    s1 = m/3;
    for oi=rb+1:m1-rb-1
        for oj=rb+1:n1-rb-1                    
            if (imgrgb_t(oi-ll,oj)-imgrgb_t(oi,oj)>thresh)||...
                    (imgrgb_t(oi,oj-ll)-imgrgb_t(oi,oj)>thresh)||...
                    (imgrgb_t(oi-fix(ll/sqrt(2)),oj-fix(ll/sqrt(2)))-imgrgb_t(oi,oj)>thresh)||...
                    (imgrgb_t(oi-fix(ll/sqrt(2)),oj+fix(ll/sqrt(2)))-imgrgb_t(oi,oj)>thresh)
                imgrgb_tt(oi,oj)=0;
            else 
                imgrgb_tt(oi,oj)=255;
            end
        end
    end
    figure;
    imshow(imgrgb_tt);
    figure;
    imga=im2bw(rgb2gray(imgrgb_tt));
    imshow(imga);
    
    [m2,n2]=size(imga);
    line=m2-50;
    left_bound_pos=zeros(1,20);
    begin_=1;
    for oj=rb+1:n2-rb-1                    
            if (imga(line,oj-1)==1&&imga(line,oj)==0&&imga(line,oj+1)==0)
                   left_bound_pos(begin_) = oj;begin_=begin_+1;
            end
            if (imga(line,oj-1)==0&&imga(line,oj)==0&&imga(line,oj+1)==1)
                   left_bound_pos(begin_) = oj;begin_=begin_+1;
            end   
    end
    maxl=left_bound_pos(1);
    maxr=left_bound_pos(2);
    maxlen=maxr-maxl;
    for inn=3:2:9
        if((left_bound_pos(inn+1)-left_bound_pos(inn))>maxlen)
            maxl=left_bound_pos(inn);
            maxr=left_bound_pos(inn+1);
            maxlen=maxr-maxl;
        end
    end
    
    mid_posx=line;
    mid_posy=(maxl+maxr)/2;
    min_radiu=maxlen;
    for si=mid_posx-fix(maxlen/2):mid_posx
        for sj=fix(mid_posy)-fix(maxlen/2):fix(mid_posy)
            if(imga(si-1,sj)==1&&imga(si,sj)==0&&imga(si+1,sj)==0)
                if(sqrt((si-mid_posx)^2+(sj-mid_posy)^2)<min_radiu)
                    min_radiu=sqrt((si-mid_posx)^2+(sj-mid_posy)^2);
                end
            end
        end
    end
    width=2*min_radiu;
    text(maxr,line,[' \leftarrow' num2str(width)]);