function plotResultados(figura,t,xMF,xMA,uMF,uMA,it)

FIGURA = figure(figura);
FIGURA.Units = 'centimeters'; FIGURA.Position = [0 0 20 16];

subplot(2,2,1)
    MASSAMF = [3 3 -3 -3 3; 0 1 1 0 0]; 
	MASSAMA = [3 3 -3 -3 3; 0 1 1 0 0];
	MOLAMF(1,:) = linspace(-15,xMF(1,it)-3,10);
    MOLAMF(2,:) = 0.7+0.1.*[1 -1 1 -1 1 -1 1 -1 1 -1];
	MOLAMA(1,:) = linspace(-15,xMA(1,it)-3,10);
    MOLAMA(2,:) = 0.7+0.1.*[1 -1 1 -1 1 -1 1 -1 1 -1];
    aux = linspace(-15,xMF(1,it)-3,4);
    AMORTMF(1,:) = [aux(1) aux(2) aux(2) aux(3) aux(3) aux(2) aux(2) ...
        aux(3) aux(3) aux(4)];
    AMORTMF(2,:) = 0.3+0.1.*[0 0 1 1 -1 -1 1 1 0 0];
	aux = linspace(-15,xMA(1,it)-3,4);
	AMORTMA(1,:) = [aux(1) aux(2) aux(2) aux(3) aux(3) aux(2) aux(2) ...
        aux(3) aux(3) aux(4)];
    AMORTMA(2,:) = 0.3+0.1.*[0 0 1 1 -1 -1 1 1 0 0];
	plot([0 0],[-0.5 1.5],'color',0.7.*[1 1 1],'LineWidth',2); hold on;
    plot([-15 7],[0 0],'color',0.7.*[1 1 1],'LineWidth',2);
	plot(MASSAMF(1,:)+xMF(1,it),MASSAMF(2,:),'blue','LineWidth',2);
    plot(MOLAMF(1,:),MOLAMF(2,:),'blue','LineWidth',2);
	plot(AMORTMF(1,:),AMORTMF(2,:),'blue','LineWidth',2);
    plot(MASSAMA(1,:)+xMA(1,it),MASSAMA(2,:),'--red','LineWidth',1); 
    plot(MOLAMA(1,:),MOLAMA(2,:),'--red','LineWidth',1);
    plot(AMORTMA(1,:),AMORTMA(2,:),'--red','LineWidth',1); hold off;
    AX=gca; AX.XLim = [-15 7]; AX.YLim = [-0.5 1.5]; AX.YTickLabel = [];
    AX.XTick = [-10 0];
    xlabel('Posi\c{c}\~{a}o (metro)','Interpreter','latex');
    AX = gca;
    text(max(AX.XLim), max(AX.YLim),'(a)',...
        'HorizontalAlignment','right', ...
        'VerticalAlignment','top', ...
        'Interpreter','latex');
    text(min(AX.XLim), max(AX.YLim),...
        ['Tempo: ',strrep(num2str(round(t(it),2),'%.2f'),'.',','),' s'],...
        'HorizontalAlignment','left', ...
        'VerticalAlignment','top', ...
        'Interpreter','latex');

subplot(2,2,2)
    plot([0 t(end)],[0 0],'color',0.7.*[1 1 1],'LineWidth',2); hold on;
    MF = plot(t(1:it),xMF(1,1:it),'blue','LineWidth',2);
    MA = plot(t(1:it),xMA(1,1:it),'--red','LineWidth',2); hold off;
    AX=gca; AX.YLim = [min(min(xMF(1,:)),min(xMA(1,:)))-3,...
        max(max(xMF(1,:)),max(xMA(1,:)))+3];
    xlabel('Tempo (segundo)','Interpreter','Latex'); 
    ylabel('Posi\c{c}\~{a}o (metro)','Interpreter','Latex');
    LEGENDA = legend([MF,MA],'Malha fechada','Malha aberta');
    LEGENDA.Interpreter = 'Latex';
    LEGENDA.Position = [0.4335    0.4779    0.1722    0.0604];
    AX = gca;
    text(max(AX.XLim), max(AX.YLim),'(b)',...
        'HorizontalAlignment','right', ...
        'VerticalAlignment','top', ...
        'Interpreter','latex');

subplot(2,2,3)
    plot([0 t(end)],[0 0],'color',0.7.*[1 1 1],'LineWidth',2); hold on;
    MF = plot(t(1:it),uMF(1:it),'blue','LineWidth',2);
    MA = plot(t(1:it),uMA(1:it),'--red','LineWidth',2); hold off; 
    AX=gca; AX.YLim = [min(min(uMF),min(uMA))-3, ...
        max(max(uMF),max(uMA))+3];
    xlabel('Tempo (segundo)','Interpreter','Latex'); 
    ylabel('Controle (newton)','Interpreter','Latex');
    AX = gca;
    text(max(AX.XLim), max(AX.YLim),'(c)',...
        'HorizontalAlignment','right', ...
        'VerticalAlignment','top', ...
        'Interpreter','latex');
    
subplot(2,2,4)
    plot([0 t(end)],[0 0],'color',0.7.*[1 1 1],'LineWidth',2); hold on;
    MF = plot(t(1:it),xMF(2,1:it),'blue','LineWidth',2);
    MA = plot(t(1:it),xMA(2,1:it),'--red','LineWidth',2); hold off;
    AX=gca; AX.YLim = [min(min(xMF(2,:)),min(xMA(2,:)))-3, ...
        max(max(xMF(2,:)),max(xMA(2,:)))+3];
    xlabel('Tempo (segundo)','Interpreter','Latex'); 
    ylabel('Velocidade (metro/segundo)','Interpreter','Latex');
    AX = gca;
    text(max(AX.XLim), max(AX.YLim),'(d)',...
        'HorizontalAlignment','right', ...
        'VerticalAlignment','top', ...
        'Interpreter','latex');
end