function eer = runAll
% Adding paths:
addpath('2/1','2/2','2/3','2/4','2/5')

% Running Database's Averages:
eer{1} = Database1Average();
eer{2} = Database2Average();
eer{3} = Database3Average();
eer{4} = Database4Average();

% Running 1'th Experiment:
Database1_1
Database1_2
Database1_3
Database1_4
Experiment1Average

% Running 2'th Experiment:
Database2_1
Database2_2
Database2_3
Database2_4
Experiment2Average

% Running 3'th Experiment:
Database3_1
Database3_2
Database3_3
Database3_4
Experiment3Average

% Running 4'th Experiment:
Database4_1
Database4_2
Database4_3
Database4_4
Experiment4Average

% Running 5'th Experiment:
Database5_1
Database5_2
Database5_3
Database5_4
Experiment5Average

rmpath('2/1','2/2','2/3','2/4','2/5')
'Done!'
end