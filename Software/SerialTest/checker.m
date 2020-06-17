score = 0;
for i = 1:122
    if (i > 1)
        classi = cell2mat(output_test(i));
        classi = classi(2:end);
    else
        classi = output_test{i};
    end
   y = cell2mat(YTest(i));
    if (strcmp(classi, y))
        score = score + 1;
    end
    
end

CorrectRate = score / 122