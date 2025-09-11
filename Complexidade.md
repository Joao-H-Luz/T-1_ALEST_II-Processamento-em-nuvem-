# **Complexidade do Algoritmo ProcessTree**


### Análise dos Algoritmos apresentados no projeto
- Analisar a Complexidade das diferentes versões do algoritmo
    - Demonstrar a diferença de tempo entre eles
    - Demonstrar com tabelas a relação de Complexidade
    - Mostrar Graficamente o desempenho da ProcessTree V2 na simulação


## *ProcessTree V1*
- Complexidades de cada função:
    - **O(1)**
        - get_or_create(nome)
        - add_relation(pai_nome, filho_nome)

    - **O(n)**
        - find_root()
        - insert(valor, tempo)
        - reset()

    - **O(n log n)**
        - pre_execution(política)

    - **O(n²)**
        - execution(cpu, política)

A complexidade da **Process Tree V1** vem da utilização do loop na função ***execution(cpu, política)*** que a cada iteração ele roda novamente a função ***pre_execution(política)*** que por sua vez roda a árvore toda, todas as vez tendo uma complexidade **O(n log n)** aumentando muito o custo de operação da ***execution(cpu, política)***.

Em nossos testes em máquina o tempo para fazer a *simulação de 20000* linhas nas duas política ultrapassou *3 min* de máquina, um ***extremo custo***.

- ✅ Complexidade aproximada: **O(n²)** (dominado pela ordenação da *pre_execution* em cada iteração).



## *ProcessTree V2*
- Complexidades de cada função:
    - **O(1)**
        - get_or_create(nome)
        - add_relation(pai_nome, filho_nome)

    - **O(n)**
        - find_root()
        - insert(valor, tempo)
        - reset()

    - **O(n log n)**
        - execution(cpu, politica)

A função execution é a principal função do Algoritmo e por sua vez a com maior custo ***O(n log n)***. O motivo é por causa do loop do ready_queue que faz um sort completo a cada ciclo, o que torna o Algoritmo caro ***O(k log k)** por iteração*

- 👉 No pior caso, isso se repete até todos os nós terminarem.
- ✅ Complexidade aproximada: **O(n log n + m)** (dominado pela ordenação em cada iteração).


# **Resumo Geral de Complexidade**

### Process Tree V2

|    Função     |     Tempo      | Espaço |
|---------------|----------------|--------|
| get_or_create |      O(1)      |  O(n)  |
| add_relation  |      O(1)	     |  O(1)  |
|   find_root   |      O(n)	     |  O(1)  |
|    insert	    |      O(n)	     |  O(n)  |
|     reset     |      O(n)	     |  O(1)  |
|   execution   | O(n log n + m) |	O(n)  |


***n* = número de nodes**
***m* = número total de relações pai-filho.**


## *Resultados Da Simulação de todos os Casos*

| Arquivo   |  CPU  |  MIN  |  MAX  | Otimizado | Delta max\min |
|-----------|-------|-------|-------|-----------|---------------|
| caso5     |     4 |   783 |   783 |    Na/    |        0      |
| caso6     |     4 |  1157 |  1157 |    Na/    |        0      |
| caso7     |     4 |   767 |   767 |    Na/    |        0      |
| caso10    |     5 |  1568 |  1568 |    Na/    |        0      |
| caso100   |    12 |  3315 |  3315 |    Na/    |        0      |
| caso200   |    16 |  4691 |  4657 |    Max    |       34      |
| caso500   |    24 |  7742 |  6931 |    Max    |      811      |
| caso1000  |    33 |  9332 |  9022 |    Max    |      310      |
| caso2000  |    46 | 15560 | 13493 |    Max    |     2067      |
| caso5000  |    72 | 20453 | 19505 |    Max    |      948      |
| caso10000 |   102 | 27401 | 27012 |    Max    |      389      |
| caso20000 |   143 | 38960 | 37715 |    Max    |     1245      |

***Delta max\min* = a diferença do tempo de ambos os casos.**
***Otimizado* = mostra qual política é a mais rápida.**


## *Resultados Da comparação de Tempo Dos dois Algoritimos*

Arquivo   | CPU |	Temp_MIN | Temp_MAX	| Temp_MIN(V2) | Temp_MAX(V2) |
----------|-----|------------|----------|--------------|--------------|
caso5 	  |   4 |    0	     |    0     |	   0       |	  0       |
caso6 	  |   4	|    0	     |    0	    |      0	   |      0       |
caso7 	  |   4	|    0	     |    0	    |      0	   |      0       |
caso10 	  |   5	|    0	     |    0	    |      0	   |      0       |
caso100   |	 12 |	 0	     |    0.01	|      0	   |      0       |
caso200   |	 16	|    0.02	 |    0.01	|      0	   |      0       |
caso500   |	 24 |	 0.07	 |    0.05	|      0.01	   |      0.01    |
caso1000  |	 33 |	 0.14	 |    0.14	|      0.02	   |      0.02    |
caso2000  |	 46 |	 0.56	 |    0.53	|      0.03	   |      0.04    |
caso5000  |	 72 |	 4.09	 |    4.02	|      0.12	   |      0.16    |
caso10000 |	102	|    18.23	 |   18.18	|      0.32	   |      0.34    |  
caso20000 |	143	|    113.54	 |  107.75  |	   0.70	   |    1.06      |

***Temp_MIN(V2) | Temp_MAX(V2)* = Tempo do algoritimo ProcessTree(V2)**



## Gráficos

### *Gráfico Geral de Barras*

- Gráfico que demonstra a diferença de desempenho com os casos e seus respectivos tempos analisando as duas políticas "MAX" e "MIN".

![Vendas Semanais](/T1-Alest_II/Saida%20de%20Arquivos/grafico_barras.png)


### *Gráfico Geral de Linha*

- Gráfico que demonstra a diferença de desempenho com os casos e seus respectivos tempos analisando as duas políticas "MAX" e "MIN".

![Vendas Semanais](/T1-Alest_II/Saida%20de%20Arquivos/grafico_geral_de_linhas.png)