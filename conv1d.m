% function for computing 1D convolution
function Y=conv1d(s,h) %s=signal  and k=kernel
m=length(s);
n=length(h);
S=[s;zeros(n,1)]; 
H=[h;zeros(m,1)]; 
for i=1:n+m-1
    Y(i)=0;
    for j=1:m
        if(i-j+1>0)
            Y(i)=Y(i)+S(j)*H(i-j+1);
        else
        end
    end
end
Y=Y';
end
