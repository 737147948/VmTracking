function out=ProbabilitySimulation(simulator,t,deltat,mu,sigma,lambda,sample,ref)
periods=floor(t/deltat);
out=zeros(periods,1);
S0=0;
for i=1:sample
    path=simulator(S0, mu, sigma, lambda, deltat, t);
    refPrice=ref(path);
    index=FindApproach(path,refPrice);
    out(index,1)=out(index,1)+1/length(index);
end
end
function index=FindApproach(S,ref)
tmp=abs(S-ref);
index=find(tmp==min(tmp));
end