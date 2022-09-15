function MCAI=MCAI(D_load)

mkdir('MCAI_results')
subjectsID = TASH_DefineSubjects;
    
for isub = 1:length(subjectsID)
    
    try
    fname = fullfile(D_load,['HG_lh_cg1.tif']);
    tash = imread(fname);
    imshow(tash(:,:,1)==9&tash(:,:,2)==9);
    hg=zeros(600,600);
    for i=1:600
        for j=1:600
            if tash(i,j,1)==9 && tash(i,j,2)==9
                hg(i,j)=100;
            end
        end
    end
    [L_clusters, N_clusters] = bwlabeln(hg);
    if N_clusters>1 
        S_clusters = histc(L_clusters(:),1:N_clusters);
        [~, indexC] = sort(S_clusters,'ascend');
        for ii = 1:length(indexC)-1
           hg(L_clusters==indexC(ii)) = 0;
        end
    end
    trace=bwboundaries(hg);
    plot(trace{1,1}(:,2),-trace{1,1}(:,1),'bo')
    plot_file=[pwd,'/MCAI_results/MCAI_TASH_lh_boundary_',subjectsID{isub},'.jpg']
    saveas(gcf,plot_file)
    [MCAI.MCAI_lh_total(isub,:) MCAI.MCAI_lh_lat(isub,:) MCAI.MCAI_lh_med(isub,:) MCAI.MCAI_lh_ant(isub,:) MCAI.MCAI_lh_post(isub,:) MCAI.MCAI_lh_antlat(isub,:) MCAI.MCAI_lh_latpost(isub,:) MCAI.MCAI_lh_postmed(isub,:) MCAI.MCAI_lh_medant(isub,:) MCAI.MCAI_8_antlat_lh(isub,:) MCAI.MCAI_8_latant_lh(isub,:) MCAI.MCAI_8_latpost_lh(isub,:) MCAI.MCAI_8_postlat_lh(isub,:) MCAI.MCAI_8_postmed_lh(isub,:) MCAI.MCAI_8_medpost_lh(isub,:) MCAI.MCAI_8_medant_lh(isub,:) MCAI.MCAI_8_antmed_lh(isub,:)] = MCAI_directed(hg,'lh')
    catch
    end
    
    try
    fname = fullfile(D_load,['HG_rh_cg1.tif']);
    tash = imread(fname);
    imshow(tash(:,:,1)==9&tash(:,:,2)==9);
    hg=zeros(600,600);
    for i=1:600
        for j=1:600
            if tash(i,j,1)==9 && tash(i,j,2)==9
                hg(i,j)=100;
            end
        end
    end
    [L_clusters, N_clusters] = bwlabeln(hg);
    if N_clusters>1
        S_clusters = histc(L_clusters(:),1:N_clusters);
        [~, indexC] = sort(S_clusters,'ascend');
        for ii = 1:length(indexC)-1
           hg(L_clusters==indexC(ii)) = 0;
        end
    end
    trace=bwboundaries(hg);
    plot(trace{1,1}(:,2),-trace{1,1}(:,1),'bo')
    plot_file=[pwd,'/MCAI_results/MCAI_TASH_rh_boundary_',subjectsID{isub},'.jpg']
    saveas(gcf,plot_file)
    [MCAI.MCAI_rh_total(isub,:) MCAI.MCAI_rh_lat(isub,:) MCAI.MCAI_rh_med(isub,:) MCAI.MCAI_rh_ant(isub,:) MCAI.MCAI_rh_post(isub,:) MCAI.MCAI_rh_antlat(isub,:) MCAI.MCAI_rh_latpost(isub,:) MCAI.MCAI_rh_postmed(isub,:) MCAI.MCAI_rh_medant(isub,:) MCAI.MCAI_8_antlat_rh(isub,:) MCAI.MCAI_8_latant_rh(isub,:) MCAI.MCAI_8_latpost_rh(isub,:) MCAI.MCAI_8_postlat_rh(isub,:) MCAI.MCAI_8_postmed_rh(isub,:) MCAI.MCAI_8_medpost_rh(isub,:) MCAI.MCAI_8_medant_rh(isub,:) MCAI.MCAI_8_antmed_rh(isub,:)] = MCAI_directed(hg,'rh')
    catch
    end
    
end









