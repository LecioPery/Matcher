function EER = runMonteCarlo()
% Adding paths:
addpath('27/1','27/2','27/3','27/4','27/5')

% Running 1'th Experiment:
EER{1}{1} = Database1_1_MC();
EER{1}{2} = Database1_2_MC();
EER{1}{3} = Database1_3_MC();
EER{1}{4} = Database1_4_MC();
% Running 2'th Experiment:
EER{2}{1} = Database2_1_MC();
EER{2}{2} = Database2_2_MC();
EER{2}{3} = Database2_3_MC();
EER{2}{4} = Database2_4_MC();
% Running 3'th Experiment:
EER{3}{1} = Database3_1_MC();
EER{3}{2} = Database3_2_MC();
EER{3}{3} = Database3_3_MC();
EER{3}{4} = Database3_4_MC();
% Running 4'th Experiment:
EER{4}{1} = Database4_1_MC();
EER{4}{2} = Database4_2_MC();
EER{4}{3} = Database4_3_MC();
EER{4}{4} = Database4_4_MC();
% Running 5'th Experiment:
EER{5}{1} = Database5_1_MC();
EER{5}{2} = Database5_2_MC();
EER{5}{3} = Database5_3_MC();
EER{5}{4} = Database5_4_MC();
% Removing paths:
rmpath('27/1','27/2','27/3','27/4','27/5')

'Done!'
end