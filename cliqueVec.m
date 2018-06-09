function x = cliqueVec(k, alpha)
num = 1;
for i = 1:alpha
    if i == 1
        i1 = 0;
    else
        i1 = sum(k(1:i-1));
    end
    
    for w1 = i1+1:sum(k(1:i))
        for w2 = w1+1:sum(k(1:i))
            x(num,1) = w1;
            x(num,2) = w2;
            num = num + 1;
        end
    end
    
    if i~=1
        for j = 1:i-1
            x(num,1) = sum(k(1:j));
            x(num,2) = sum(k(1:i));
            num = num+ 1;
        end
    end
end
