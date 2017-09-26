%--------------------initializing--------------------
%choose the mode('1' for full; '2' for result)
disp('To run the program please enter -------- 1')
disp('To show a sample result please enter --- 2')
type=input('Please enter the mode type: ');
if type==1
%initialize image label
imageFileName = 't10k-images.idx3-ubyte';
labelFileName = 't10k-labels.idx1-ubyte';
%load MNISTdata
%cd(fullfile(matlabroot,'examples','stats'));
[X,L] = processMNISTdata(imageFileName,labelFileName);
%----------------------run T-SNE----------------------
%TSNE1 (PCA 50)
rng default % for reproducibility
Y_ori = tsne(X,'Algorithm','barneshut','NumPCAComponents',50);
%TSNE2 (perplexity 100)
rng default % for fair comparison
Y_perp100 = tsne(X,'Algorithm','barneshut','NumPCAComponents',50,'Perplexity',100);
%TSNE3 (perplexity 4)
rng default % for fair comparison
Y_perp4=tsne(X,'Algorithm','barneshut','NumPCAComponents',50,'Perplexity',4);
%TSNE4 (exaggeration 20)
rng default % for fair comparison
Y_exag20 = tsne(X,'Algorithm','barneshut','NumPCAComponents',50,'Exaggeration',20);
%TSNE5 (exaggeration 1.5)
rng default % for fair comparison
Y_exag1p5 = tsne(X,'Algorithm','barneshut','NumPCAComponents',50,'Exaggeration',1.5);
%TSNE6 (learning rate 5)
rng default % for fair comparison
Y_lr5 = tsne(X,'Algorithm','barneshut','NumPCAComponents',50,'LearnRate',5);
%TSNE7 (learning rate 2000)
rng default % for fair comparison
Y_lr2000 = tsne(X,'Algorithm','barneshut','NumPCAComponents',50,'LearnRate',2000);
%TSNE8 (exaggeration 200)
rng default % for fair comparison
Y_exag200 = tsne(X,'Algorithm','barneshut','NumPCAComponents',50,'Exaggeration',200);
%TSNE9 (learning rate 10000)
rng default % for fair comparison
Y_lr10000 = tsne(X,'Algorithm','barneshut','NumPCAComponents',50,'LearnRate',1e5);

% ------------------plot 9 results-----------------------
figure;

subplot(3,3,1);
gscatter(Y_ori(:,1),Y_ori(:,2),L)
title('The Original T-SNE')

subplot(3,3,2);
gscatter(Y_perp100(:,1),Y_perp100(:,2),L)
title('Perplexity 100')

subplot(3,3,3);
gscatter(Y_perp4(:,1),Y_perp4(:,2),L)
title('Perplexity 4')

subplot(3,3,4);
gscatter(Y_exag20(:,1),Y_exag20(:,2),L)
title('Exaggeration 20')

subplot(3,3,5);
gscatter(Y_exag1p5(:,1),Y_exag1p5(:,2),L)
title('Exaggeration 1.5')

subplot(3,3,6);
gscatter(Y_lr5(:,1),Y_lr5(:,2),L)
title('Learning rate 5')

subplot(3,3,7);
gscatter(Y_lr2000(:,1),Y_lr2000(:,2),L)
title('Learning rate 2000')

subplot(3,3,8);
gscatter(Y_exag200(:,1),Y_exag200(:,2),L)
title('Exaggeration 200')

subplot(3,3,9);
gscatter(Y_lr10000(:,1),Y_lr10000(:,2),L)
title('Learning rate 10000')

set(gcf,'unit','normalized','position',[0.2,0.2,0.7,0.65]);

%save result
saveas(gcf,'result.fig')

elseif type==2
    test=exist('result.fig','file');
    if test==2
        load('result.fig','-mat');
    else 
        disp('Sample figure does not exist, please run mode 1 to get it')
    end
    
else
    disp('Please run it again and enter the correct type number.')
end

