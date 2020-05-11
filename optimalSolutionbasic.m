function f=optimalSolutionbasic(Link_matrix,extra_link,extra_link_flow,node1,node2,Cost_matrix)
 dummy_matrix=extra_link;
 theta=0;
 [r1,d_matrix,t]=row_wise(node2,dummy_matrix,extra_link_flow,node1,node2,theta);
 [c1,d_matrix,t]=column_wise(node2,d_matrix,extra_link_flow,node1,node2,t);
 if(r1~=0 && c1~=0) 
     c=1;
     path(1,1)=node2;path(1,2)=0;
     recursive(r1,c1,d_matrix,node1,node2,extra_link_flow,t,path,c,Link_matrix,extra_link,Cost_matrix);
  end
 if(r1~=0) path(1,1)=node2; path(1,2)=r1; end
 if(c1~=0) path(1,1)=c1; path(1,2)=node2; end
 
     
 c=1;
 recursive(r1,c1,d_matrix,node1,node2,extra_link_flow,t,path,c,Link_matrix,extra_link,Cost_matrix);
 
 r1=0;c1=0;
end
function f= recursive(i,j,d_matrix,node1,node2,flow_matrix,t,path,cnt,Link_matrix,extra_link,Cost_matrix)
r1=0;
r2=0;
c1=0;
c2=0;
cnt=cnt+1;
 if(i~=0)
[r1,d_matrix,t]=row_wise(i,d_matrix,flow_matrix,node1,node2,t);
[c1,d_matrix,t]=column_wise(i,d_matrix,flow_matrix,node1,node2,t);
if(r1==node1)
 k=cnt-1;
    if(path(k,2)==0)
   path(k,2)=i; 
    end
  path(cnt,1)=i; path(cnt,2)=r1;  
  optimalSolutiontheta(node1,node2,path,flow_matrix,Link_matrix,extra_link,Cost_matrix);
  r1=0;i=0;
r2=0;j=0;
c1=0;
c2=0;
 
elseif (c1== node1)
     k=cnt-1;
    if(path(k,2)==0)
   path(k,2)=i; 
    end
  path(cnt,1)=c1; path(cnt,2)=i; 
  optimalSolutiontheta(node1,node2,path,flow_matrix,Link_matrix,extra_link,Cost_matrix);
  r1=0;i=0;
r2=0;j=0;
c1=0;
c2=0;
 
% elseif(r1~=0 && c1~=0)
%     [r1,c1]=exceptional(r1,c1,d_matrix); 
end
 if(r1~=0) path(cnt,1)=i; path(cnt,2)=r1; end
 if(c1~=0) path(cnt,1)=c1; path(cnt,2)=i; end
end  


if(j~=0)
     [r2,d_matrix,t]=row_wise(j,d_matrix,flow_matrix,node1,node2,t);
     [c2,d_matrix,t]=column_wise(j,d_matrix,flow_matrix,node1,node2,t);
if(r2==node1)
    k=cnt-1;
    if(path(k,2)==0)
   path(k,2)=j; 
    end
  path(cnt,1)=j; path(cnt,2)=r2;  optimalSolutiontheta(node1,node2,path,flow_matrix,Link_matrix,extra_link,Cost_matrix); 
r1=0;i=0;
r2=0;j=0;
c1=0;
c2=0;
elseif (c2 == node1)
    k=cnt-1;
    if(path(k,2)==0)
   path(k,2)=j; 
    end
  path(cnt,1)=c2; path(cnt,2)=j; optimalSolutiontheta(node1,node2,path,flow_matrix,Link_matrix,extra_link,Cost_matrix);
r1=0;i=0;
r2=0;j=0;
c1=0;
c2=0;
% elseif(r2~=0 && c2~=0)
%     [r2,c2]=exceptional(r2,c2,d_matrix); 
end

 if(r2~=0) path(cnt,1)=j; path(cnt,2)=r2; end
 if(c2~=0) path(cnt,1)=c2; path(cnt,2)=j; end
end  
 

 if(r1~=0)
    f= recursive(r1,0,d_matrix,node1,node2,flow_matrix,t,path,cnt,Link_matrix,extra_link,Cost_matrix);

 elseif(c1~=0)
    f= recursive(c1,0,d_matrix,node1,node2,flow_matrix,t,path,cnt,Link_matrix,extra_link,Cost_matrix);
 elseif(c2~=0)
    f= recursive(c2,0,d_matrix,node1,node2,flow_matrix,t,path,cnt,Link_matrix,extra_link,Cost_matrix);
  elseif(r2~=0)
    f= recursive(r2,0,d_matrix,node1,node2,flow_matrix,t,path,cnt,Link_matrix,extra_link,Cost_matrix);
 end
 end
 



function [new_col,dm_matrix,theta]=row_wise(row,dummy_matrix,flow_matrix,n1,n2,theta)
count=1;
for i=1:4
    if(dummy_matrix(row,i)==1)
       dummy_matrix(row,i)=0;
       array(count)=i;
       count=count+1;
    end
end
      if(count==2)
        new_col=array(count-1);
        dm_matrix=dummy_matrix;
     elseif(count>2)
           for i=1:count-1
               if(array(i)==n1)
               new_col=array(i);
               dm_matrix=dummy_matrix;
               break;
               else
                 dm_matrix=dummy_matrix;
                 new_col=0;
               end
               
           end
      else
       dm_matrix=dummy_matrix;
       new_col=0;
     end
end


function [new_row,dm_matrix,theta]=column_wise(col,dummy_matrix,flow_matrix,n1,n2,theta)
count=1;
for i=1:4
    if(dummy_matrix(i,col)==1)
       dummy_matrix(i,col)=0;
       array(count)=i;
       
       count=count+1;
    end
end
     if(count==2)
        new_row=array(count-1);
        dm_matrix=dummy_matrix;
     elseif(count>2)
           for i=1:count-1
               if(array(i)==n1)
               new_row=array(i);
               dm_matrix=dummy_matrix;
               return;
               end
           end
               
                [r2,c2]=exceptional(array(1),array(2),dummy_matrix);    
                dm_matrix=dummy_matrix;
                if(r2~=0) new_row=r2;
                else
                    new_row=c2;
                end
 
      else
       dm_matrix=dummy_matrix;
       new_row=0;
     end
 end

function [c,d]=exceptional(a,b,dummy_matrix)
cnt1=1;
cnt2=1;
for i=1:6
     if(dummy_matrix(a,i)==1)
         cnt1=cnt1+1;
     end
end
for i=1:6
     if(dummy_matrix(i,a)==1)
         cnt1=cnt1+1;
     end
end
for i=1:6
     if(dummy_matrix(b,i)==1)
        cnt2=cnt2+1;
     end
end
for i=1:6
     if(dummy_matrix(i,b)==1)
         cnt2=cnt2+1;
     end
end
if(cnt1>1) 
    c=a;
    d=0;
    return;
else
    d=b;
    c=0;
return;
end
end



