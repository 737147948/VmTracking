function out=ProbabilitySimulation2(simulator,sample,ref)
tmppath=simulator();
out=zeros(length(tmppath),1);
for i=1:sample
    path=simulator();
    refPrice=ref(path);
    index=FindApproach(path,refPrice);
    out(index,1)=out(index,1)+1/length(index);
end
out=out./sample;
end
function index=FindApproach(S,ref)
tmp=abs(S-ref);
index=find(tmp==min(tmp));
end