clear;clc;
% new_link_matrix=[0 1 1 0;0 0 0 1;0 0 0 0;0 0 0 0];
% Cost_matrix= [0 2 -5 0;0 0 -1 4;0 6 0 3;7 0 0 0];
% Link_matrix=[0 1 1 0;0 0 1 1;0 1 0 1;1 0 0 0];
% new_link_flow=[0 3 1 0;0 0 0 5;0 0 0 0;0 0 0 0];
new_link_matrix=[0 0 1 1 0;0 0 0 0 1;0 0 0 0 0;0 0 0 0 0;0 0 0 0 0];
Cost_matrix= [0 0 4 7 5;0 0 6 6 8;0 0 0 0 0;0 0 0 0 0;0 0 0 0 0];
 Link_matrix= [0 0 1 1 1;0 0 1 1 1;0 0 0 0 0;0 0 0 0 0;0 0 0 0 0];
new_link_flow=[0 0 20 10 0;0 0 0 0 40;0 0 0 0 0;0 0 0 0 0;0 0 0 0 0];
cost=0;

optimalSolution(new_link_matrix,new_link_flow,Link_matrix,Cost_matrix);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% step1 %%%%%%%%%%%%%%%%%%%%%
