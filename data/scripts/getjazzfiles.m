dataDir = '/Users/Eron/Desktop/lakh-pianoroll-dataset-main/data'; % total lmd/lpd dataset

lpdDir = fullfile(dataDir, 'lpd', 'lpd_matched');
lmdDir = fullfile(dataDir, 'lmd', 'lmd_full');
if ~exist(lpdDir, 'dir')
    error('Pianoroll directory does not exist, need to download or check path');
end
if ~exist(lmdDir, 'dir')
    error('MIDI directory does not exist, need to download or check path');
end

labelsDir = pwd;
idcs   = strfind(labelsDir,'/');
midiDestDir = fullfile(labelsDir(1:idcs(end)-1),'Midi');
prDestDir = fullfile(labelsDir(1:idcs(end)-1),'Pianoroll');
if ~exist(midiDestDir,'dir')
    mkdir(midiDestDir);
end
if ~exist(prDestDir,'dir')
    mkdir(prDestDir);
end

labels = readtable(fullfile(labelsDir,'jazz_labels.csv'));
labels = unique(labels);
labels = table2array(labels);

fCount = 0;
for ii=1:size(labels,1)
    current_label = labels{ii};
    localLPDDir = fullfile(lpdDir, current_label(3),...
                        current_label(4), current_label(5));
                    
    if exist(fullfile(localLPDDir,current_label),'dir')
        filenames=dir(fullfile(localLPDDir,current_label));
        for jj=3:length(filenames)
            
            m_name = strsplit(filenames(jj).name,'.npz');
            m_name = m_name{1};
            localLMDDir = fullfile(lmdDir, m_name(1));
            
            % get LPD
            copyfile(fullfile(localLPDDir,current_label,filenames(jj).name), ...
                     prDestDir);
                 
            % get LMD
            if exist(fullfile(localLMDDir,strcat(m_name,'.mid')),'file')
                copyfile(fullfile(localLMDDir,strcat(m_name,'.mid')),...
                         midiDestDir,'f');
            else
                sprintf('No MIDI files found for %s',m_name);
            end
            % increment through file list
            fCount = fCount+1;
        end
    else
        sprintf('No Pianoroll files found for %s',current_label)
    end  
end