%
%
disp("This is an example matlab driver");
disp("On output the code prints the pot+grad in example1 and, pot+pottarg in example2");
disp(" ");
disp(" ");
%%   source to source, charges only, pot+grad example
%

clear srcinfo ns U eps pg zk;
disp("Example 1: source to source, charge, pot+grad");
disp(" ");
disp(" ");

ns = 2000;
srcinfo.sources = rand(3,ns);
srcinfo.charges = rand(1,ns)+1i*rand(1,ns);

eps = 1e-5;
pg = 2;
zk = complex(1.1);
U = hfmm3d(eps,zk,srcinfo,pg);
disp("pot=");
disp(U.pot(1:9));
disp("grad=");
disp(U.grad(:,1:3));

clear srcinfo ns U eps pg pgt zk;
%
%%    source to source+target, charges+dipoles, pot example
%
disp(" ");
disp(" ");
disp("Example 2: source to source+target, charge+dipole, multiple densities, pot");
disp(" ");
disp(" ");

ns = 2000;
nt = 1999;

nd = 5;
srcinfo.nd = nd;

pg = 1;
pgt = 1;

srcinfo.sources = rand(3,ns);
srcinfo.charges = rand(nd,ns)+1i*rand(nd,ns);
srcinfo.dipoles = rand(nd,3,ns)+1i*rand(nd,3,ns);

targ = rand(3,nt);
eps = 1e-5;
zk = complex(1.1);

U = hfmm3d(eps,zk,srcinfo,pg,targ,pgt);

disp("pot=");
disp(U.pot(:,1:3));
disp("pottarg=");
disp(U.pottarg(:,1:3));

clear srcinfo ns U eps pg pgt nt targ nd zk;