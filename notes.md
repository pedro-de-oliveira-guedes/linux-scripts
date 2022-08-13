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

<br/>

---

<br/>

# **Terminal Linux**
A seguir, temos os principais comandos utilizados no Terminal do Linux.
- ***date:*** Exibe a data do sistema.
- ***pwd:*** Mostra o caminho atual das pastas do sistema
- ***cd:*** Caminha pelas pastas do sistema
- ***ls:*** Lista os arquivos do sistema. Abaixo estão as possíveis flags para este comando. Flags são comandos opcionais na execução de um comando que podem estender a funcionalidade dele.
    - ***| more***: Lista os elementos da pasta atual em ordem alfabética, um em cima do outro, dando a opção de abaixar a lista para ver mais elementos ao apertar Enter.
    - ***<nome_de_arquivo_ou_diretorio>***: Lista todos os arquivos ou diretórios presentes na pasta que tenham o nome informado. É possível também informar apenas parte de um nome.
        - Utiliza Regex para fazer match de nomes. Portanto é possível utilizar nomes como “P?d*”, onde a “?” é qualquer letra e “*” é qualquer continuação.
        - A Regex também funciona para sequências. A expressão “ls arquivo[1-4].*”, vai listar todos os arquivos que tenham nome começando por “arquivo” e continuação de números “1”, “2”, “3” ou “4”, do formato que seja.
    - ***<nome_completo_diretorio>***: Lista todos os arquivos e subdiretórios presentes dentro daquele diretório escrito.
    - ***-l***: Lista detalhadamente todos os elementos do diretório pesquisado.
        - O nome dos arquivos é modificado nessa exibição. Os que começam com “**d**” são **diretórios**. Os que começam com “**-**“ são **arquivos**. Os que começam com “**l**” são **links para outros diretórios ou arquivos**.
    - ***-a***: Lista também os arquivos ocultos.
    - ***-h***: Utilizado juntamente com o “-l”. Significa “**humano**”, serve para entender o tamanho dos arquivos em bytes.
    - ***-R <nome_diretorio>***: Lista recursivamente todos os arquivos e diretórios presentes dentro do diretório especificado.
- ***touch <nome_arquivo.extensao_arquivo>***: Cria um arquivo com a extensão especificada.
- ***find***: Encontra arquivos dentro do diretório atual.
    - ***-name <nome_arquivo>***: Procura o arquivo cujo nome foi digitado. Aceita Regex.
- ***mkdir <caminho_e_nome_diretorio>***: Cria um novo diretório no caminho especificado e com o nome especificado.
    - Para criar um diretório com nome separado por espaço, devemos utilizar aspas simples para envolver o nome do diretório a ser criado.
- ***rmdir <nome_diretorio>***: Remove o diretório descrito. Caso haja arquivos dentro deste diretório, a remoção é barrada. Aceita Regex.
- ***rm <nome_arquivo>***: Exclui o arquivo descrito. Aceita Regex.
    - ***-r <nome_diretorio>***: Significa “Recursivo”. Remove todos os arquivos presentes no diretório informado.
    - ***-f***: Significa “Forçado”. Vai remover todos os arquivos e pastas, independentemente de permissões especiais ou de possuir ou não arquivos internos.
- ***\<comando\> --help***: Busca ajuda para os comandos do sistema.
- ***cat <arquivo_de_texto>***: Exibe o conteúdo do arquivo de texto especificado.
- ***history***: Exibe o histórico de comandos utilizados recentemente pelo usuário que está logado.
    - ***<quantidade_de_comandos>***: Exibe os últimos comandos executados dentro da quantidade especificada.
    - ***!<numero_do_comando>***: Executa o comando cujo número foi informado como parâmetro. O número aparece na lista do histórico.
    - ***!!***: Executa o último comando executado.
    - ***| grep <expressão_para_pesquisa>***: Busca todos os comandos que apresentem uma correspondência para a expressão pesquisada.
    - ***-w***: Escreve o histórico no arquivo .bashrc localizado na pasta do usuário.
    - Para informações de data e hora de execução do comando, é necessário alterar uma variável de ambiente do sistema. Para fazer isso, execute o comando: **export HISTTIMEFORMAT = “%c “**.
    - Para que os comandos não sejam armazenados no histórico, é feita a alteração: ***set +o history***. Para voltar a armazenar, é utilizado ***set -o history***.
