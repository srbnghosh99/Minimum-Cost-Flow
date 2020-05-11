   clc;clear; 
%  Link_matrix=[0 1 1 0;0 0 1 1;0 1 0 1;1 0 0 0];
%  Cost_matrix= [0 2 -5 0;0 0 -1 4;0 6 0 3;7 0 0 0];
%  node_capacity=[4 2 -1 -5];
 Link_matrix= [0 0 1 1 1;0 0 1 1 1;0 0 0 0 0;0 0 0 0 0;0 0 0 0 0];
 Cost_matrix= [0 0 4 7 5;0 0 6 6 8;0 0 0 0 0;0 0 0 0 0;0 0 0 0 0];
 node_capacity=[30 40 -20 -10 -40];
 balance_value=sum(node_capacity);
 extra_link=[0 0 0 0 0 1;0 0 0 0 0 1;0 0 0 0 0 0;0 0 0 0 0 0;0 0 0 0 0 0;0 0 1 1 1 0];
 extra_link_flow=[0 0 0 0 0 30;0 0 0 0 0 40;0 0 0 0 0 0;0 0 0 0 0 0;0 0 0 0 0 0;0 0 20 10 40 0];
 cost=sum(abs(node_capacity));
 extra_cost= [0 0 0 0 0 1;0 0 0 0 0 1;0 0 0 0 0 0;0 0 0 0 0 0;0 0 0 0 0 0;0 0 1 1 1 0];
 extra_node_capacity= [30 40 -20 -10 -40 0];
 extra_node_capacity=abs(extra_node_capacity);
 B= sparse(extra_link);
 Initial_feasible(extra_link,extra_link_flow,Link_matrix);

