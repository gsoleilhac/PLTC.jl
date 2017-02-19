using JuMP
using PyPlot

#A1#
begin
m = Model()
@variable(m, a >= 0)
@variable(m, b >= 0)
@variable(m, c >= 0)
@variable(m, d >= 0)

f = readdlm("dataA1.csv")
x = convert(Array{Float64,1},f[:,1])
y = convert(Array{Float64,1},f[:,5])
n = length(x)

@NLobjective(m, Min,  sum( (( (a*x[i])^3 + (b*x[i])^2 + c*x[i] + d) - y[i])^2 for i = 1:n))

originalSTDOUT = STDOUT; (outRead, outWrite) = redirect_stdout()
solve(m)
close(outWrite);close(outRead);redirect_stdout(originalSTDOUT)

a,b,c,d = map(getvalue, [a,b,c,d])
println("A1 : $a*x^3 + $b*x^2 + $c*x + $d")

yreg = [(a*x[i])^3 + (b*x[i])^2 + c*x[i] + d for i = 1:n]

xlabel("longueur")
ylabel("temps (s)")
plot(x,y,"b-",label="A1")
plot(x,yreg,"r.",label="$(round(a,6))n^3 + $(round(b,6))n^2 + $(round(c,6))n + $(round(d,6))")
legend()
show()
end

#A2#
begin
m = Model()
@variable(m, a >= 0)
@variable(m, b >= 0)
@variable(m, c >= 0)
@variable(m, d >= 0)
@variable(m, e >= 0)

f = readdlm("dataA2.csv")
x = convert(Array{Float64,1},f[:,1])
y = convert(Array{Float64,1},f[:,5])
n = length(x)

@NLobjective(m, Min,  sum( (( (a*x[i])^4 + (b*x[i])^3 + (c*x[i])^2 + d*x[i] + e) - y[i])^2 for i = 1:n))


originalSTDOUT = STDOUT; (outRead, outWrite) = redirect_stdout()
solve(m)
close(outWrite);close(outRead);redirect_stdout(originalSTDOUT)

a,b,c,d,e = map(getvalue, [a,b,c,d,e])
println("A1 : $a*x^4 + $b*x^3 + $c*x^2 + $d*x + $e")

yreg = [(a*x[i])^4 + (b*x[i])^3 + (c*x[i])^2 + d*x[i] + e for i = 1:n]

xlabel("longueur")
ylabel("temps (s)")
plot(x,y,"b-",label="A2")
plot(x,yreg,"r.",label="$(a)n^4 + $(b)n^3 + $(c)n^2 + $(d)n + $e")
legend()
show()
end

#A3#
begin
m = Model()
@variable(m, a >= 0)
@variable(m, b >= 0)
@variable(m, c >= 0)
@variable(m, d >= 0)

f = readdlm("dataA3.csv")
x = convert(Array{Float64,1},f[:,1])
y = convert(Array{Float64,1},f[:,5])
n = length(x)

@NLobjective(m, Min,  sum( (( (a*x[i])^3 + (b*x[i])^2 + c*x[i] + d) - y[i])^2 for i = 1:n))

originalSTDOUT = STDOUT; (outRead, outWrite) = redirect_stdout()
solve(m)
close(outWrite);close(outRead);redirect_stdout(originalSTDOUT)

a,b,c,d = map(getvalue, [a,b,c,d])
println("A1 : $a*x^3 + $b*x^2 + $c*x + $d")

yreg = [(a*x[i])^3 + (b*x[i])^2 + c*x[i] + d for i = 1:n]

xlabel("longueur")
ylabel("temps (s)")
plot(x,y,"b-",label="A3")
plot(x,yreg,"r.",label="$(a)n^3 + $(b)n^2 + $(c)n + $d")
legend()
show()
end


#A1Parallel#
begin
m = Model()
@variable(m, a >= 0)
@variable(m, b >= 0)
@variable(m, c >= 0)
@variable(m, d >= 0)

f = readdlm("dataA1Parallel.csv")
x = convert(Array{Float64,1},f[:,1])
y = convert(Array{Float64,1},f[:,5])
n = length(x)

@NLobjective(m, Min,  sum( (( (a*x[i])^3 + (b*x[i])^2 + c*x[i] + d) - y[i])^2 for i = 1:n))

originalSTDOUT = STDOUT; (outRead, outWrite) = redirect_stdout()
solve(m)
close(outWrite);close(outRead);redirect_stdout(originalSTDOUT)

a,b,c,d = map(getvalue, [a,b,c,d])
println("A1 : $a*x^3 + $b*x^2 + $c*x + $d")

yreg = [(a*x[i])^3 + (b*x[i])^2 + c*x[i] + d for i = 1:n]

xlabel("longueur")
ylabel("temps (s)")
plot(x,y,"b-",label="A1Parallel")
plot(x,yreg,"r.",label="$(round(a,6))n^3 + $(round(b,6))n^2 + $(round(c,6))n + $(round(d,6))")
legend()
show()
end