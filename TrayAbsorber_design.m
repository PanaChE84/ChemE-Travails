disp('A is the component to be absorbed!')
disp('Import Y-X equilibrium curve data')
yinit= input('Enter molefraction A in entry stream');
Yinit= yinit/(1-yinit);
input2= input('Is composition of exit stream available? Y/N');
if input2==Y
    input3= input('Enter % by mole of A');
    yf= input3;
    Yf= yf/(1-yf);
elseif input2==N
    input4= input('Enter % reduction of A in exit stream')
    Yf=((100-input4)/100)*Yinit
else
    disp('Try again with proper values!')
end
G=input('Enter gas flow rate in kmol/h');
Gs=G(1-Yinit)
disp('Enter Y-X equilibrium curve data')
disp('Enter X and Y values as rowvectors,enter NA for both if either not available')
Xval= input('X values')
Yval=input('Y values')
tXval= isa(Xval,'double');
tYval= isa(Yval,'double');
if tXval || tYval == 1
    ktransvec=Xval;
    ltransvec=Yval;
       
elseif tXval || tYval == 0
    ktransvec=[];
    ltransvec=[];
    k=input('Enter x values');
    l=input('Enter y values');
    Psat= input('Enter vapor pressure of A at operating conditions');
    Ptot=input('Enter total pressure');
    m=Psat/Ptot;
    for i = 1:length(k)
        ktransvec(i)= k(i)/(1-k(i));
        for j=1:length(ktransvec)
            ltransvec(i)=1/(1/(m*ktransvec(i))+(1/m-1));
        end
    end
end

ktransvec;
ltransvec;
Xvec=ktransvec;
Yvec= ltransvec;
xvec=Xvec;
yvec=Yvec;
poly=0;
syms X Y W Z
p=1;
for q= 1:length(xvec)
    p=p*(X-xvec(1,q));
end
disp(p);
for r=1:length(xvec)
    u= p/(X-xvec(r));
    v= subs(u,xvec(r));
    w=k*yvec(r)/l;
    poly=poly+w; 
end
n=sym2poly(poly);
p=poly2sym(n);           
Y=p;
diff1=diff(Y,X);
diff2= diff(diff1,X);
if diff2==0
    maxslope=coeffs(diff1);
else
    Xreq=solve(diff2==0,X);
    diff3= diff(diff2,X);
    subsdiff3= subs(diff3,Xreq);
    if subsdiff3 <0
        maxslope=subs(diff1,Xreq);
    end
end
maxslope;
mult= 1.5;
opnlineslope=maxslope*mult;
Ls= opnlineslope*Gs;
Gi=G;
Gf=Gs(1+Yf);
Xi=0;
%eqn of opn line 1.416/0.274
Z= opnlineslope*W + Yinit
Xf= solve(Z==Yf,W);
L0=Ls;
Lf= Ls(1+Xf);
A1= L0/(m*Gf);
A2=Lf/(m*Gi);
A= (A1*A2)^(0.5);
%no. of trays
exp=(A-1)*yi/(A*yf) + 1/A;
N= log(exp)/log(A)

        
    

