function f=optimalSolution(new_link_matrix,new_link_flow,Link_matrix,Cost_matrix)
[row,col]=size(new_link_flow);
cost=0;
disp('Link_matrix=')
disp(new_link_matrix)
disp('Link_flow=')
disp(new_link_flow)
disp('Cost_matrix')
disp(Cost_matrix)
for i=1:4
    for j=1:4
        if(new_link_flow(i,j)~=0)
            cost=cost+(new_link_flow(i,j)*Cost_matrix(i,j));
%         
%         else
%             Cost_matrix(i,j)=0;
        end
    end
end
disp cost=
disp (cost)

for i=1:row
    for j=1:col
        if(new_link_flow(i,j)==0)
            new_link_matrix(i,j)=0;
        end
    end
end
w = zeros(1,col);
  for j=1:col
        if (new_link_matrix(col,j)==1)
%               B(i,j)=-1;
               w(j)=Cost_matrix(col,j);
        end
  end
    
    for i=1:row
        if (new_link_matrix(i,col)==1)
               w(i)=Cost_matrix(i,col);
        end
    end
    for i=1:row-1
    for j=1:col-1
     if (new_link_matrix(i,j)==1)
        if(w(i)~=0) w(j)=w(i)-Cost_matrix(i,j);
        elseif(w(j)~=0) w(i)=w(j)+Cost_matrix(i,j);   
        end
     end
    end
    end
    non_basic=Link_matrix-new_link_matrix;
    
for i=1:row
    for j=1:col
        if(non_basic(i,j)==1)
        x(i,j)=w(i)-w(j)-Cost_matrix(i,j);
       end
    end
end
basic=0;
m=0;n=0;
[r c]=size(x);
for i=1:r
     for j=1:c
         if(x(i,j)>basic)
             basic=x(i,j);
             m=i;
             n=j;
         end
     end
end

a=m;b=n;
if(m~=0 && n~=0)
    optimalSolutionbasic(Link_matrix,new_link_matrix,new_link_flow,a,b,Cost_matrix);
    
end

disp('optimal solution found');

quit cancel
 
end
   