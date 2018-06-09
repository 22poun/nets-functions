function x = clique(k, alpha)

% this generates alpha k-cliques
num = 1;
for i = 1:alpha
    for j = (i-1)*k + 1: k*i - 1 
        for w = j+1:k*i
            x(num,1) = j;
            x(num,2) = w;
            num = num + 1;
        end
    end
end

% now we want to connect each k-clique to another

for i = 1:alpha-1
    x(num,1) = (i-1)*k + 1;
    x(num,2) = (i)*k + 1;
    num = num+1;
end

% x(num,1) = i*k + 1;
% x (num,2) = 1;
for i = 1:alpha-1
    for j = i:alpha-1
        x(num,1) = (i-1)*k + 2;
        x(num,2) = j*k + 2;
        num = num + 1;
    end
end
% 

% num = 1;
% for i = 1:alpha
%     if i == 1
%         i1 = 0;
%     else
%         i1 = sum(k(1:i-1))
%     end
%     
%     for w1 = i1+1:sum(k(1:i))
%         for w2 = w1+1:sum(k(1:i))
%             x(num,1) = w1;
%             x(num,2) = w2
%             num = num + 1;
%         end
%     end
%     
%     if i~=1
%         for j = 1:i-1
%             x(num,1) = sum(k(1:j));
%             x(num,2) = sum(k(1:i));
%             num = num+ 1;
%         end
%     end
% end
