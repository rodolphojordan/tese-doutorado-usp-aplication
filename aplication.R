#Aplicação 

Agora será utilzada a função \textit{data_out} para criar um data frame com uma obervação aberrante que será deslocada para a última posição do data frame 

```{r echo=T, message=FALSE, warning=FALSE}
source("data_out.R") # Chamada da função 

# Esta função recebe um data frame e uma valor para os
#desvio padrão, que será utilzado para criar uma
#obsevação discrepante e retorna um data frame com a
#variável resposta pertubada na última posição.

data_mod<- data_out(df, DP = 3)
plot(data_mod$y)
```
