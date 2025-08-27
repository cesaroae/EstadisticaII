using Distributions, Plots, Random, LaTeXStrings

Random.seed!(123)

Y=Pareto(1,1)

# Trabajaremos con una muestra aleatoria 30

# Pareto(α, θ) , el parámetro de localización es θ (el que va en la indicadora pues) y el de escala/forma es α

#=

    RR_α = { x ∈ Ran(X) : X_(1) ≤ c_R } , c_R > 1

    Hijole, ¿Cómo le hacemos para obtener la distribución del mínimo muestral en Julia?

=#

Y_1=OrderStatistic(Pareto(1,1),30,1) #Distribución del mínimo muestral 

typeof(Y_1)

#Y_i=OrderStatistic(Pareto(2,1),30,i) Distribución del i-ésimo estadístico de orden

Y_n=OrderStatistic(Pareto(1,1),30,30) #Distribución del máximo muestral 

# Por lo demostrado en clase sabemos que Y_1 se distribuye como Pareto(1,30)

T=Pareto(30,1)

#=  

    Regresando a la región de rechazo nos interesa tener un control sobre el control de 
    probabilidad de Error Tipo I y que no sobrepasemos el nivel α dado por el usuario de la prueba 

=#

α=0.01

c_R=quantile(Y_1,α) 

c_R=quantile(T,α)

π_RR(θ)=cdf(Pareto(1,θ),c_R) #????

π_RR(θ)=1-(θ/c_R)^30

Θ_0=range(1.0,c_R,length=500)
plot(Θ_0,π_RR.(Θ_0),xlabel="θ",ylabel= L"π_{RR_α}(θ)",label=L"P(ET1|θ)", lw=2,color=1)
vline!([1],label="θ=1",lw=1,color=4)
hline!([π_RR(1)],label=L"sup{\mathbb{P}(ET1)}",color=6)

#=

    RA_β = { x ∈ Ran(X) : X_(1) ≥ d_A } , d_A > c_R > 1

=#

β=0.05 # Dado por el usuario de la prueba

d_A=cquantile(Y_1,β)

π_RA(θ)=(θ/d_A)^30
Θ_1=range(0.85,1.1;length=301)

π_RA(1)

plot(Θ_1,π_RA.(Θ_1),xlabel="θ",ylabel= L"π_{RA_β}(θ)",label=L"P(ET2|θ)",lw=2,color=1)
vline!([1],label="θ=1",lw=1,color=4)
hline!([π_RA(1)],label=L"sup{\mathbb{P}(ET2)}",color=7)

# Vamos a probar un poco

a=0.85
b=1.15
c=rand()*(b-a)+a
Z=Pareto(1,c)

ma=rand(Z, 30)

x_1=minimum(ma)

println(L"x_1^obs=",minimum(ma))

if (minimum(ma)≤c_R)
    println("La hipótesis es falsa")
elseif (minimum(ma)≥ d_A)
    println("La hipótesis es verdadera")
else 
    println("Sepa")
end

#=

    ¿Como calculamos el p-value de la RR_α en este caso?

=#

p_value_RR=cdf(T,x_1)

p_value_RA=ccdf(T,x_1)