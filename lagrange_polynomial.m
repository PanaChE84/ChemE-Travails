xvec= [0 1 2 5];
yvec=[2 3 12 147];
poly=0;
syms x
p=1;
for i= 1:length(xvec)
    p=p*(x-xvec(1,i));
end
disp(p);
for j=1:length(xvec)
    k= p/(x-xvec(j));
    l= subs(k,xvec(j));
    m=k*yvec(j)/l;
    poly=poly+m; 
end
n=sym2poly(poly);
p=poly2sym(n);
Y=p;
diff1=diff(Y,x)
diff2=diff(diff1,x)
xreq= solve(diff2==0,x)
diff3= diff(diff2,x)

diff4=diff(diff3,x)

    