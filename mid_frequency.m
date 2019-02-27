height = ceil(m/8);
width = ceil(n/8);
I = mat2cell(orig,height*ones(1,8),width*ones(1,8));
dct = zeros(8,8);
for i = 1:8
    for j = 1:8
        temp =dct2(cell2mat(I(i,j)),1,1);
        dct(i,j) = temp;
    end
end

a = unique(dct);
out = [a,histc(dct(:),a)];
out = sortrows(out,2);
t = unique(out(:,2));
val = t(round((length(t)+1)/2));
embedv = [];
for i = 1:length(out)
    if(out(i,2) == val)
        embedv = [embedv,out(i,1)];
    end
end


indices = {};
for i =1:8
    for j = 1:8
        if(ismember(dct(i,j),embedv))
            indices = cat(1,indices,{i,j});
        end
    end
end
if (mod(val,2) ~= 0)
    val = val - 1;
end

