 function [f]=optimalsolutiontheta(nodei_special,nodej_special,dm_path,flow_link,Link_matrix,extra_link,Cost_matrix)
 %1==plus
 %0==minus
% nodei_special=1;
% nodej_special=2;
theta_min=9999;
[r c]=size(dm_path);
for i=1:r
if(dm_path(i,1)==nodei_special)
%     disp('minus theta')
    dm_path(i,3)=0;
    theta_min=minimumtheta(theta_min,dm_path(i,1),dm_path(i,2),flow_link);
elseif(dm_path(i,1)==nodej_special)
%     disp('plus theta')
    dm_path(i,3)=1;
%     theta_min=minimumtheta(theta_min,dm_path(i,1),dm_path(i,2),flow_link);
elseif(dm_path(i,2)==nodei_special)
%     disp('plus theta')
    dm_path(i,3)=1;
%     theta_min=minimumtheta(theta_min,dm_path(i,1),dm_path(i,2),flow_link);
elseif(dm_path(i,2)==nodej_special)
%     disp('minus theta')
    dm_path(i,3)=0;
    theta_min=minimumtheta(theta_min,dm_path(i,1),dm_path(i,2),flow_link);
else
    m=i-1;
    newi_special=dm_path(m,1);
    newj_special=dm_path(m,2);
    a=dm_path(i,1);b=dm_path(i,2);
    if(dm_path(m,1)==newi_special)   
%     disp('minus theta')
    dm_path(i,3)=0;
    theta_min=minimumtheta(theta_min,a,b,flow_link);
elseif(dm_path(m,1)==newj_special)
%     disp('plus theta')
    dm_path(i,3)=1;
    theta_min=minimumtheta(theta_min,a,b,flow_link);
elseif(dm_path(m,2)==newi_special)
%     disp('plus theta')
     dm_path(i,3)=1;
    theta_min=minimumtheta(theta_min,a,b,flow_link);
elseif(dm_path(m,2)==newj_special)
%     disp('minus theta')
     dm_path(i,3)=0;
    theta_min=minimumtheta(theta_min,a,b,flow_link);
    end
end

end
 flow_link(nodei_special,nodej_special)=theta_min;
 flow_link=updateflow(dm_path,theta_min,flow_link);
 Link_matrix(nodei_special,nodej_special)=0;
%  Cost_matrix(nodei_special,nodej_special)=0;
 extra_link(nodei_special,nodej_special)=1;
 
optimalSolution(extra_link,flow_link,Link_matrix,Cost_matrix);

 
 end
function t=minimumtheta(t,a,b,flow_link)
if(flow_link(a,b)<t)
    t=flow_link(a,b);
    return;
end
end


function f=updateflow(dm_path,theta_min,flow_link)
[r c]=size(dm_path);
for i=1:r
     a=dm_path(i,1);
     b=dm_path(i,2);
  if(dm_path(i,3)==1)
        
         flow_link(a,b)=flow_link(a,b)+theta_min;
      
      
  else
         flow_link(a,b)=flow_link(a,b)-theta_min;
  end
end
      
      f=flow_link;
end




