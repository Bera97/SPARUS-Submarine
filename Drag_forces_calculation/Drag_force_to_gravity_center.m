function [Fg] = Drag_force_to_gravity_center(r,F)
%Mg is the mass matrix expressed in the gravity center, r is the vector of
%coordinates of the point in the body frame and M is the matrix in the
%center of the part. Careful, this is only working with r with 3
%dimensions.

Od=zeros(3,3);
Id=eye(3);

H=[Id (S_(r))'; Od Id];
HT=H';

Fg=HT*F;

end