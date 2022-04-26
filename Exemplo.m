A = [0 1; -9 -2]; n = length(A);
B = [0; 1]; p = size(B,2);
C = [1 0;0 1]; q = size(C,1);
D = 0;
Q = diag([100,1]);
R = 1;
K = lqr(A,B,Q,R);

Planta = ss(A,B,C,0,'InputName','u','OutputName',{'x1','x2'});
Controlador = tf(-K,'InputName',{'x1','x2'},'OutputName','u');
Gmf = connect(Planta,Controlador,'u',{'x1','x2'});

tFin=6;
deltaT=0.03;
t = 0:deltaT:tFin;
x0 = [-10;0];

% Simulacao em malha aberta
uMA = zeros(1,length(t));
xMA = lsim(Planta,uMA,t,x0); xMA = xMA';

% Simulacao em malha fechada
uMF = zeros(1,length(t));
xMF = lsim(Gmf,uMF,t,x0); xMF = xMF';
for i=1:length(t)
    uMF(i) = -K*xMF(:,i);
end

for it = 1:length(t)
    plotResultados(1,t,xMF,xMA,uMF,uMA,it)
    set(gcf, 'Color', 'w')
    export_fig(['simulacao',num2str(it)],'-png','-q101','-nocrop')
end

export_fig('simulacao0','-pdf','-q101','-nocrop')
export_fig(['simulacao',num2str(it+1)],'-pdf','-q101','-nocrop')