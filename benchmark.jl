include("algorithmes.jl")
alphabet = ['A','B','C','D']


function test(Algo)
	println("n | \tnbTest | \texhaustif | \tmin\t| mean \t| max")
	TESTS EXHAUSTIFS
	for n = 1:6
		words = Vector{String}(0)
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
	for n in [7,8,9,10,20,30,40,50,60,70,80,90,100,200,300,400,500,600,700,800,900,1000,1250,1500,1750,2000,2250,2500,2750,3000,4000,5000]
		words1, words2= random_words(n, 100000),random_words(n, 100000)
		
		times = Vector{Float64}(0)
		ind = 1
		push!(times, @elapsed Algo(words1[ind], words2[ind]))
		if times[1] > 180.0
			println("$n\t 1\t non\t $(times[1])")
			break
		end
		ind += 1
		while sum(times) + mean(times) < 180.0 && ind <= length(words1)
			push!(times, @elapsed Algo(words1[ind], words2[ind]))
			ind += 1
		end
		Min,Max = extrema(times)
		Mean = mean(times)
		print("$n\t $(length(times))\t non\t")
		@printf("%.3g\t  %.3g\t  %.3g\n", Min, Mean, Max)
	end
end

function gen_all_words!(n::Int,buffer::String,res::Array{String,1})
	if length(buffer) == n
		push!(res, buffer)
	else
		for v in alphabet
			gen_all_words!(n, string(buffer,v),res)
		end
	end
	res
end

function random_words(n, nbwords)::Array{String,1}
	res = Vector{String}(0)
	for i = 1:nbwords
		word = ""
		for i = 1:n
			word = string(word, rand(alphabet))
			#push!(res, rand(alphabet))
		end
		push!(res, word)
	end
	res
end

test(A1)
test(A1bis)
test(A2)
test(A3)