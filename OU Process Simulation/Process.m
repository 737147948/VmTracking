classdef Process<handle
    properties
        S0=0;
        t=1:60;
        Uint=0.3;
        Dint=0.3;
        zeroProb=0.7;
        alpha=-0.1;
        beta=1;
        
    end
    methods
        function obj=Process()
        end
        function path=ZeroWeightSkelem2(obj)
        path=obj.ZeroWeightSkelem(obj.S0,obj.t,obj.Uint,obj.Dint,obj.zeroProb);
        end
function path=ZeroWeightSkelem(obj,S0,t,Uint,Dint,zeroProb)
path=zeros(length(t),1);
path(1,1)=S0;
for i=2:length(t)
    zeroR=rand(1);
    if zeroR<zeroProb;
        path(i)=path(i-1);
    else
        sign= 2*binornd(1,0.5)-1;
        if sign>0
            path(i)=path(i-1)+poissrnd(Uint)+1;
        else
            path(i)=path(i-1)-poissrnd(Dint)-1;
        end
    end
end

end
function path=ARMA()
    path=zeros(length(t),1);
    PastInno=normrnd(0,1)
    path(1,1)=obj.S0;
    for i=2:length(t)
        CurrentInno=normrnd(0,1)
        path(i,1)=obj.alpha*path(i-1,1)+CurrentInfo
    end
    end
end