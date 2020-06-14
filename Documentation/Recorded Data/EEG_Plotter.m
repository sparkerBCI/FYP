res = {f.x1, f.A15F0, f.AA963, f.x69B2F, f.x8B8A2, f.x17063, f.x12290, f.x76C9, f.x7AA4};
% Convert cell to a table and use first row as variable names
T = cell2table(res,'VariableNames',["Marker", "Ch1", "Ch2", "Ch3", "Ch4", "Ch5", "Ch6", "Ch7", "Ch8"]);
 
% Write the table to a CSV file
writetable(T,'myDataFile.csv');