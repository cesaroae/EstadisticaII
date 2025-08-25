#=
    Introducción a Programación en Julia
    Materia: Estadística II
    Semestre: 2026-1
    Autor:Cruz Rodríguez César Aurelio
    Módulo: 0

    Operadores Relacionales

    < Mayor que
    > Menor que 
    <= Mayor o igual que (\le + TAB)
    >= Menor o igual que (\ge + TAB)
    != Diferente de ## (\ne + TAB)##
    == Igual que 

    Operadores Matematicos

    + suma 
    - resta 
    * multiplicación
    / división 
    ^ potencia
    = asignación 

    Operadores lógicos

    & Evalúa si todas las condiciones son verdaderas
    && Evalua la siguiente condicion a la derecha si la anterior fue verdadera
    | Evalúa si alguna de las condiciones es verdadera
    || Evalua la siguiente condicion a la derecha si la anterior fue falsa

    Palabras reservadas para el lenguaje de programación Julia:

    baremodule, begin, break, catch, const, continue, do, else, 
    elseif, end, export, false, finally, for, function, global, 
    if, import, let, local, macro, module, quote, return, struct,
    true, try, using, while

    Así como los siguientes pares de palabras:

    abstract type, mutable struct, primitive type

    Siempre que vayamos a utilizar un paquete tenemos que descargarlo y declarar que lo usaremos

    import Pkg
    Pkg.add("nombre_del_paquete") ## Sintaxis para descargar un paquete

    using(nombre_del_paquete_1,…,nombre_del_paquete_n)
=#

import Pkg
Pkg.add("Distributions")

#Basta con descargarlos una vez e irlos actualizando

using Distributions, Plots, StatsPlots, Random, LaTeXStrings

#=

    Tipos de dato

    En Julia hay datos enteros, decimales(flotantes), racionales, complejos, cadenas 
    y char(un solo cáracter). 

    Podemos declarar variables siempre y cuando cumplan las siguientes condiciones:
    1. No tengan como nombre las palabaras reservadas.
    2. El nombre no empieza con un número.
    3. El nombre no lleva espacios.

    Si utilizas palabras reservadas como nombre, al declararlas borrara la función que tenía esa
    palabra globalmente, cuidado !!

=#

a=2 #Sintaxis para declarar enteros

μ=3.5   #Sintaxis para declarar flotantes 

nombre="Aurelio"    #Sintaxis para declarar cadenas

apellido_p="Cruz"

racional_1=64//96   #Sintaxis para declarar racionales

irracional_1=π    

imaginario_1=3+2im

τ='a'   #Sintaxis para declarar char

#   Para que la terminal nos muestre la modificación utilizamos "#" al final de la asignación, para 
#   que no lo muestre utilizamos ";"

#=
    Funciones de salida

    print(). Si se imprimen varias cosas no imprime tabuladores o espacios
    println(). Al final imprime un espacio "\n"

    Si queremos espacio entre lo que se muestra, tenemos que insertar tabuladores o espacios
=#

print(a,"\t",μ," ",nombre,"\t",τ)

println(a," ",μ," ", nombre, "\t",τ)

print("Puede solo imprimir texto")

println("Puede imprimir variables por interpolacion $nombre")

println(string(nombre, " ", apellido_p))

println(a,"+",a,"=",a+a)

println("Estamos a $a grados") 

for i ∈ 1:255
    printstyled(i, bold=false, color=i)
end 

printstyled("Estamos perdidas", bold=true, color=23)

printstyled("Perdidas PERDIDAS", underline=true, color=200)

#=
    Funciones 

    La sintaxis básica para declarar una función es de la forma 

        function f(x)
            f(x)
            return f(x) 
        end
    
    Para delimitar dominios se hace de la forma 
    
        function f(x)
            f(x)= a>x>b ? f(x) :0 ## Si x∈(a,b) f(x). eoc 0 
            return f(x)
        end
    
    f(x,y)=x+y ##Sintaxis más simple
    
    f=(x,y)->x+y  
    
    function g(x::Float64)::Float64 ## Esto delimita el tipo de dato que recibe la función
        g(x)=x^2
        return g(x)
    end


=#

# Julia ya tiene incorporadas muchas funciones

nombre_ma=uppercase(nombre)

nombre_mi=lowercase(nombre)

nombre=uppercasefirst(nombre_mi)

nombre_ma=lowercasefirst(nombre_ma)

typeof(a)
typeof(nombre_ma)
typeof(irracional_1)

bitstring(μ)
bitstring(a)

ceil(μ)
floor(μ)


##Con esto concluimos el módulo 0. Espero les haya gustado :D 
