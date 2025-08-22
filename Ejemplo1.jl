using Plots, Distributions, LaTeXStrings, Random

#=

    La región de rechazo había quedado especificado de la forma

    RR_α = { x ∈ X : T >= k_R }

=#

#import Pluto
#Pluto.run()

α=0.05 #Dado por el usuario

T=Binomial(100,0.1)

# ¿Cómo obtener númericamente el valor crítico para el nivel de la prueba (PET1)?

for i ∈ -1:20
    println("P(T≥",i+1,")=",ccdf(T,i))
end

for i ∈ 13:18
    println("P(T≥",i+1,")=",ccdf(T,i))
end

# ¿Al tanteo? ¿Qué tal que la muestra es muy grande? 

k_R=quantile(T,1-α)+1 

# For a given 0 ≤ α ≤ 1, quantile(T, α) is the smallest value t in the support of T for which cdf(T, t) ≥ α

#Obtiene el valor más pequeño tal que 

k_R= findfirst(k-> ccdf(T,k+1) ≤ α, 0 : 100) + 1

# P(T≥k+1)=P(T>k)1-P(T≤k) Esto pasa porque es una v.a discreta 

# El valor crítico es 16 !

π_RR(θ)=ccdf(Binomial(100,θ),k_R) # g(θ) 

Θ=range(0.0,0.3;length=301)

plot(Θ,π_RR.(Θ),xlabel="θ",ylabel= L"π_{RR_α}(θ)", lw=2 ,title= L"\mathbb{P}(T≥16|θ≤0.1)")
vline!([0.1],lw=2,color=4,label="θ=0.1")
hline!([π_RR(0.1)],lw=2,color=2,label=L"sup{\mathbb{P}(Error Tipo I)}")

#=

    La región de aceptación quedó especificada como 

    RA_β = { x ∈ X : T ≤ k_A } = { 0, 1, … , k_A }

=#

β=0.05

k_A=quantile(T,β)-1 

k_A=findfirst(k->cdf(T,k+1)≤β,0:100) # !!!

π_RA(θ)=cdf(Binomial(100,θ),4)

Θ=range(0.0,0.3;length=301)

plot(Θ,π_RA.(Θ),xlabel="θ",ylabel= L"π_{RA_β}(θ)", lw=2 ,title= L"\mathbb{P}(T≤4|θ≥0.1)")
vline!([0.1],lw=2,color=4,label="θ=0.1")
hline!([π_RA(0.1)],lw=2,color=2,label=L"sup{\mathbb{P}(Error Tipo II)}")