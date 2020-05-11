function f=Initial_feasible(extra_link,extra_link_flow,Link_matrix)
c=6;
[row,col]=size(extra_link_flow);
for i=1:row
    for j=1:col
        if(extra_link_flow(i,j)==0)
            extra_link(i,j)=0;
        end
    end
end
 disp('extra_link_flow=')
  disp(extra_link_flow)
 disp('extra_link=')
  disp(extra_link)
 disp('Cost=')
 a=sum(sum(extra_link_flow(row,:)));
 b=sum(extra_link_flow(:,col));
  disp(a+b)
if(sum(extra_link(row,:))==0 && sum(extra_link(:,col)==0))
     disp('Phase one is complete');
   return;
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%  Step 1 %%%%%%%%%%%%%%%%%%%%%%%%%%%%
% c=6;
for it=1:c 
w = zeros(1,c);
  for j=1:col
        if (extra_link(row,j)==1)
%               B(i,j)=-1;
               w(j)=-1;
        end
  end
    
    for i=1:row
        if (extra_link(i,col)==1)
               w(i)=1;
        end
    end
   for i=1:row-1
    for j=1:col-1
     if (extra_link(i,j)==1)
        if(w(i)~=0) w(j)=w(i);
        elseif(w(j)~=0) w(i)=w(j);   
        end
     end
    end
   end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%  Step 2 %%%%%%%%%%%%%%%%%%%%%%%%%%%%
for i=1:row-1
    for j=1:col-1
        if(Link_matrix(i,j)==1)
        x(i,j)=w(i)-w(j);
       end
    end
end
basic=0;
[row,col]=size(x);
for i=1:row
     for j=1:col
         if(x(i,j)>basic)
             basic=x(i,j);
             m=i;
             n=j;
             break;
         end
     end
end
a=m;
b=n;
% extra_link(a,b)=1;
% Link_matrix(a,b)=0;
path(Link_matrix,extra_link,extra_link_flow,a,b);
end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
     
