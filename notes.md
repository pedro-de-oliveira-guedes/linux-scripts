# **Acesso remoto a máquinas Linux**

É preciso saber o IP. Para saber, acesse a máquina virtual e utilize o comando

> ***ip a***

Esse comando vai listar todos os IPs disponíveis naquela máquina. O que estamos procurando está abaixo da seção “**enp0s3**”, sendo identificado por “**inet**”.

A máquina virtual deve ter um roteador instalado. Para isso, utilize o comando

> ***sudo apt-get install openssh-server***

A máquina virtual também deve estar configurada como “*bridge*”.

## **Acessando por um Windows:**

Faça o download do programa “Putty”. Deve-se baixar os arquivos “**putty.exe**” e “**puttygen.exe**”.

A conexão só funciona se ambas as máquinas estiverem na mesma faixa de IP.

Basta digitar o IP encontrado e confirmar. Após isso, digite o usuário e senha da máquina virtual e conecte-se normalmente.

## **Acessando por um Linux:**

Não é necessário um software de terceiros. Basta digitar o comando a seguir, substituindo os parâmetros pelos que se quer usar:

> ***ssh <nome_usuario_maquina_destino>@<IP_maquina_destino>***

Após apertar Enter, confirme e digite a senha do usuário utilizado.