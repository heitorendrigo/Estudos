### exemplo de for
#a = [4,2,3]
#for x in a:
#    print(x)

## Exemplo de funcao
#def nomeFuncao(par1,par2):
#    varNova = par1 + par2
#    return varNova
#print(nomeFuncao(2,1))

##exemplo de tamanho de string, vale para array
#str = 'heitor'
#tamanho =len(str)
#print(tamanho)

##Ordenando valores de uma array
#colors = [1,6,3,8,6,9,0]
#colors.sort()
#print(colors)
#colors.sort(reverse=True) #ordena decrescente
#print(colors)

##ordenando string
#a ='minha string'
#a=list(a) #string para lista
#a.sort()
#a="".join(a)  ##lista para string
#print(a)



##exemplo de if
#a = 9
#b = 4

#if a>b and a!=0 or b!=0:
#    print("entrou no IF, ",a," é maior que ",b)
#else:
#    print("entrou no ELSE, ",b,"a é maior que ",a)


##INSERINDO E REMOVENDO DADOS DA ARRAY
#arr = [2,3,4]

#arr.append(5) # INSERE NO FINAL
#arr.insert(0,0) # (indice, informação) INSERE ONDE EU QUISER
#print(arr)

#del(arr[0]) #remove pelo indice
#print(arr)


#################################################################
#1) - Crie uma função que retorna o maior numero impar da sequencia (sem usar o max)

"""
li = [1,11,3,33,5,55,7,77,9,99,91]

def maiorImpar(arr):
    impar = []
    for i in range(len(arr)):
        if arr[i] % 2 == 1:
            impar.append(arr[i])

    if len(impar)==0:
        return 'sem numeros impares'
    else:
        impar.sort(reverse=True)
        rt = impar[0]
        return rt
print(maiorImpar(li))
"""

#2) - Crie uma função que retorna todas as palavras de uma strind na ordem
# inversa da frase original
"""
frase = 'Heitor'

def inveteString(str):
    str = list(str)
    str.reverse()
    str="".join(str)
    return str
print(inveteString(frase))
"""


#3) Crie um programa para encontrar a sub-sequencia Continua dentro
#do array que possu a maior soma
# Exemplo 1: [-1,5,2,1,4,-7,8,-3,-4,2] -> Output: 13
# Exemplo 2: [6,-4,-2,1,-3,5,-1,2,1,1,-5,4] -> output: 8
# Youtube  : [-2,1,-3,4,-1,2,1,-5,4] -> output: 6

"""
lista = [-2,1,-3,4,-1,2,1,-5,4]

def maior_soma_sub_array(arr):
   arr_soma = [];
   soma_atual = 0;
   for i in range(len(arr)):
      if arr[i]>soma_atual+arr[i]:
         soma_atual = arr[i]
         arr_soma.append(soma_atual)
      else:
         soma_atual += arr[i]
         arr_soma.append(soma_atual)
   return max(arr_soma)
print(maior_soma_sub_array(lista))
"""
