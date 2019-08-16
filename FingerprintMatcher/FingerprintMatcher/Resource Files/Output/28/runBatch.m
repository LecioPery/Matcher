function EER = runBatch()
% Adding paths:
% addpath('28/1','28/2','28/3','28/4','28/5')

% Running Database's Averages:
EER{1} = Database1Average();
EER{2} = Database2Average();
EER{3} = Database3Average();
EER{4} = Database4Average();

% Running 1'th Experiment:
% discard = Database1_1();
% discard = Database1_2();
% discard = Database1_3();
% discard = Database1_4();
% discard = Experiment1Average();

% Running 2'th Experiment:
% discard = Database2_1();
% discard = Database2_2();
% discard = Database2_3();
% discard = Database2_4();
% discard = Experiment2Average();

% Running 3'th Experiment:
% discard = Database3_1();
% discard = Database3_2();
% discard = Database3_3();
% discard = Database3_4();
% discard = Experiment3Average();

% Running 4'th Experiment:
% discard = Database4_1();
% discard = Database4_2();
% discard = Database4_3();
% discard = Database4_4();
% discard = Experiment4Average();

% Running 5'th Experiment:
% discard = Database5_1();
% discard = Database5_2();
% discard = Database5_3();
% discard = Database5_4();
% discard = Experiment5Average();

% Removing paths:
% rmpath('28/1','28/2','28/3','28/4','28/5')

'Done!'
end