using PyPlot

xlabel("longueur")
ylabel("temps (s)")
f = readdlm("dataA1.csv")
x = f[:,1]
A1best = f[:,4]
A1mean = f[:,5]
A1worst = f[:,6]
plot(x,A1best,"b.",label="")
plot(x,A1mean,"b-",label="A1")
plot(x,A1worst,"b.",label="")

f = readdlm("dataA2.csv")
x = f[:,1]
A2best = f[:,4]
A2mean = f[:,5]
A2worst = f[:,6]
plot(x,A2best,"r.",label="")
plot(x,A2mean,"r-",label="A2")
plot(x,A2worst,"r.",label="")

f = readdlm("dataA3.csv")
x = f[:,1]
A3best = f[:,4]
A3mean = f[:,5]
A3worst = f[:,6]
plot(x,A3best,"g.",label="")
plot(x,A3mean,"g-",label="A3")
plot(x,A3worst,"g.",label="")

f = readdlm("dataA1Parallel.csv")
x = f[:,1]
A1Pbest = f[:,4]
A1Pmean = f[:,5]
A1Pworst = f[:,6]
plot(x,A1Pbest,"y.",label="")
plot(x,A1Pmean,"y-",label="A1Parallel")
plot(x,A1Pworst,"y.",label="")

legend()
show()
