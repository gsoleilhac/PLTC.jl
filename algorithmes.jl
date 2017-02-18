##################### A1 #####################

function A1(S::String, T::String)::Int
	res = 0
	for i=1:length(S), j=1:length(T)
		@inbounds res = max(res, pls(S[1:i], T[1:j]))
	end
	res
end

function A1parallel(S::String, T::String)::Int
	ls,lt = length(S),length(T)
	res = @parallel max for ind=1:ls*lt
		i,j = ind2sub((ls,lt), ind)
		pls(S[1:i], T[1:j])
	end
	res
end

@everywhere function pls(a::String,b::String)::Int
	if length(a) == 1 || length(b) == 1
		return a[end] == b[end] ? 1 : 0
	else
		return a[end] == b[end] ? 1 + pls(a[1:end-1], b[1:end-1]) : 0
	end
end

##################### A2 #####################

function A2(S::String,T::String)::Int
	ns, nt = length(S),length(T)
	n = min(ns,nt)
	PLTC = 0
	for l = 1:n, a = 1:ns-l+1, p = 1:nt-l+1
		@inbounds S[a:a+l-1] == T[p:p+l-1] && (PLTC = l)
	end
	PLTC
end

##################### A3 #####################

function A3(S::String,T::String)::Int
    Max=0
    n = length(S)
    for i=0:n-1, j=i:n-1
        sij = j-i+1
        if PMK_ij(sij, S[i+1:j+1], T)
            Max = max(Max, sij)
        end
    end
    Max
end

function PMK_ij(sij::Int, Sij::String,T::String)::Bool
	a,b = 0,-1
	PMK_ij = zeros(Int,sij+1)
	PMK_ij[1] = -1

	while a < sij
		while b > -1 && Sij[a+1]!=Sij[b+1]
			b = PMK_ij[b+1]
		end

		a += 1
		b += 1

		if a<sij && Sij[a+1]==Sij[b+1]
			PMK_ij[a+1] = PMK_ij[b+1]
		else
			PMK_ij[a+1] = b
		end
	end

	bool_res = false
	a = 0
	n = length(T)
	for b = 0:n-1
		while a > -1 && Sij[a+1] != T[b+1]
			a = PMK_ij[a+1]
		end
		a += 1
		if a >= sij
			bool_res = true
			a = PMK_ij[a+1]
		end
	end
	bool_res
end


