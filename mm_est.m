function [ Vmax,Km ] = mm_est( data )
%The program estimates Vmax and Km from data
%Input: data(:,1) -S concentrations
%       data(:,2) -Reaction rate
%Output: Vmax - estimate of maximum reaction rate
%        Km - estimate of concentration of 1/2 Vmax
data_tf = 1./data;
[row,col]=size(data);
ones =repmat(1, row, 1);
xaug=[ones data_tf(:,1)];
a_b_est= pinv(xaug'*xaug)*xaug'...
    *data_tf(:,2);
Vmax=1/a_b_est(1);
Km=Vmax*a_b_est(2);
fprintf('Vmax= %f \n Km= %f \n' ,Vmax,Km);
end

