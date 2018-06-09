%%%%%%%%%%%%%%
% NW Model
%%%%%%%%%%%%%%

% code for the ring lattice obtained from:
% https://www.mathworks.com/help/matlab/examples/build-watts-strogatz-small-world-graph-model.html
% newman-watts is a varient of the watts-strogatz model described above. 

% for each edge in the circle, we add with independant probability p an
% additional shortcut between two vertices chosen at random
% instead of rewiring that edge entirely

N = 10; 
K = 2;
p = .5;

%sets up the ring lattice;  
s = repelem((1:N)', 1, K);
t = s + repmat(1:K, N, 1);
t = mod(t-1, N) + 1;
edges = [s(:, 1) t(:, 1); s(:, 2) t(:, 2)];

edges1 = edges;
edges2 = edges;


% in the following model, we decide if a given shortcut is added with
% probability p
% we choose a starting edge at random, and choose an ending edge at random
% until we get an ending edge different from the starting edge (ie no self-loops)
% we allow duplicate edges, and remove them after we generate all the
% shortcuts
for i = 1:N
    for j = 1:K
        switchP = rand() < p;
        if switchP
            startEdge = randi([1, N], 1, 1);
            endEdge = startEdge;
            while endEdge == startEdge
                endEdge = randi([1 N], 1, 1);
            end
            edges1(end+1, :) = [startEdge, endEdge];
        end
    end
end

uniqueEdgeList = unique(sort(edges1,2),'rows');

h2 = graph(uniqueEdgeList(:,1), uniqueEdgeList(:,2));
figure;
plot(h2, 'layout', 'circle')
title ('NW, N = 10, K = 2, p = .5, Duplicate Edges Removed')

N = 10;
K = 2;
p = .5;

% in this varient, we instead continue randomizing an edge until it we generate an
% edge that does not already exist
% clearly, this varient will produce more shortcuts than the above model

for i = 1:N
    for j = 1:K
        switchP = rand() < p;
        if switchP
            startEdge = 1;
            endEdge = 2;
            while (ismember([startEdge,endEdge], edges2, 'rows') | ismember([endEdge, startEdge], edges2, 'rows'))
                startEdge = randi([1 N], 1,1);
                endEdge = startEdge;
                while endEdge == startEdge;
                    endEdge = randi([1 N], 1, 1);
                end
            end 
            edges2(end+1,:) = [startEdge, endEdge];
        end
    end
end

h3 = graph(edges2(:,1),edges2(:,2));
figure
plot(h3, 'layout', 'circle')
title ('NW Model, N = 10, K = 2, p = .5, Duplicate Edges Regenerated')
    