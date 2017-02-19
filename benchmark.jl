include("algorithmes.jl")
const alphabet = ['A','T','C','G']


function test(Algo)
	println("n | \tnbTest | \texhaustif | \tmin\t| mean \t| max")
	#TESTS EXHAUSTIFS
	for n = 1:6
		words = Vector{Vector{Char}}(0)
	 	gen_all_words!(n,"", words)
	 	times = Vector{Float64}(0)
	 	for i = 1:length(words), j = i:length(words)
	 		push!(times, @elapsed Algo(words[i], words[j]))
	 	end
	 	Min,Max = extrema(times)
	 	Mean = mean(times)
	 	print("$n\t $(length(times))\t oui\t")
	 	@printf("%.3g\t  %.3g\t  %.3g\n", Min, Mean, Max)
	end

    #TESTS RANDOM
	for n in [7,8,9,10,20,30,40,50,60,70,80,90,100,200,300,400,500,600,700,800,900,1000,1500,2000,2500,3000,3500,4000,4500,5000,5500,6000,6500,7000,7500,8000,8500,9000,9500,10000,11000,12000,13000,14000,15000,16000,17000,18000,19000,20000,30000,40000,50000,60000,70000,80000,90000,100000]
            
        times = Vector{Float64}(0)
		word1, word2= random_word(n),random_word(n)
		push!(times, @elapsed Algo(word1, word2))
		if times[1] > 180.0
			print("$n\t $(length(times))\t non\t")
            @printf("%.3g\t  %.3g\t  %.3g\n", times[1], times[1], times[1])
			break #Si la durée d'un seul test dépasse 3min on arrete
		end

        total = times[1]
		while total + total/length(times) < 180.0
			#Modifs sur place pour consommer moins de mémoire
            random_word!(word1)
			random_word!(word2)
            time =  @elapsed Algo(word1, word2)
            total += time
			push!(times, time)
		end
		Min,Max = extrema(times)
		Mean = mean(times)
		print("$n\t $(length(times))\t non\t")
		@printf("%.3g\t  %.3g\t  %.3g\n", Min, Mean, Max)
	end
end

function gen_all_words!(n::Int,buffer::String,res::Vector{Vector{Char}})::Void
	if length(buffer) == n
		push!(res, [buffer[i] for i = 1:n])
	else
		for v in alphabet
			gen_all_words!(n, string(buffer,v),res)
		end
	end
	return nothing
end

function random_word(n::Int)::Vector{Char}
	word = Vector{Char}(0)
	for i = 1:n
		push!(word,(rand(alphabet)))
	end
    word
end

#sur place
function random_word!(word::Vector{Char})
	for i = 1:length(word)
		word[i] = rand(alphabet)
	end
end

println("A1")
test(A1)
println("A2")
test(A2)
println("A3")
test(A3)
println("A1parallel")
test(A1parallel)