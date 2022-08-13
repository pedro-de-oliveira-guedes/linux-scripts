# **Navegação**
<ul>
    <li>
        <a href="#1">Acesso remoto a máquinas Linux</a>
        <ul>
            <li>
                <a href="#1.1">Acessando por um Windows</a>
            </li>
            <li>
                <a href="#1.2">Acessando por um Linux</a>
            </li>
        </ul>
    </li>
    <li>
        <a href="#2">Terminal Linux</a>
    </li>
    <li>
        <a href="#3">Usuário Raiz</a>
    </li>
    <li>
        <a href="#4">Editores de texto</a>
    </li>
    <li>
        <a href="#5">Criação de Scripts</a>
    </li>
    <li>
        <a href="#6">Gerenciamento de Usuários</a>
        <ul>
            <li>
                <a href="#6.1">Edição de informações do usuário</a>
            </li>
            <li>
                <a href="#6.2">Listar usuários do sistema</a>
            </li>
            <li>
                <a href="#6.3">Grupos de usuário</a>
            </li>
            <li>
                <a href="#6.4">Permissão de grupos e usuários</a>
            </li>
        </ul>
    </li>
    <li>
        <a href="#7">Gerenciamento de Pacote</a>
    </li>
    <li>
        <a href="#8">Gerenciamento de Discos</a>
        <ul>
            <li>
                <a href="#8.1">Instalando um disco</a>
            </li>
        </ul>
    </li>
    <li>
        <a href="#9">Manipulação de arquivos</a>
        <ul>
            <li>
                <a href="#9.1">Cópia de arquivos</a>
            </li>
            <li>
                <a href="#9.2">Movendo arquivos</a>
            </li>
            <li>
                <a href="#9.3">Renomeando arquivos</a>
            </li>
            <li>
                <a href="#9.4">Manipulando processos</a>
            </li>
        </ul>
    </li>
</ul>

<br/>

---

<br/>

<div id="1">

# **Acesso remoto a máquinas Linux**

É preciso saber o IP. Para saber, acesse a máquina virtual e utilize o comando

> ***ip a***

Esse comando vai listar todos os IPs disponíveis naquela máquina. O que estamos procurando está abaixo da seção “**enp0s3**”, sendo identificado por “**inet**”.

A máquina virtual deve ter um roteador instalado. Para isso, utilize o comando

> ***sudo apt-get install openssh-server***

A máquina virtual também deve estar configurada como “*bridge*”.

<div id="1.1">

## **Acessando por um Windows:**

Faça o download do programa “Putty”. Deve-se baixar os arquivos “**putty.exe**” e “**puttygen.exe**”.

A conexão só funciona se ambas as máquinas estiverem na mesma faixa de IP.

Basta digitar o IP encontrado e confirmar. Após isso, digite o usuário e senha da máquina virtual e conecte-se normalmente.

</div>

<div id="1.2">

## **Acessando por um Linux:**

Não é necessário um software de terceiros. Basta digitar o comando a seguir, substituindo os parâmetros pelos que se quer usar:

> ***ssh <nome_usuario_maquina_destino>@<IP_maquina_destino>***

Após apertar Enter, confirme e digite a senha do usuário utilizado.

</div>

</div>

<br/>

---

<br/>

<div id="2">

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

</div>

<br/>

---

<br/>

<div id="3">

# **Usuário raiz**
No geral, quando um usuário não é administrador, ele pode executar comandos de administrador ao adicionar a palavra “**sudo**” no início do comando pretendido.
Como isso é uma tarefa cansativa, é possível contorna-la ao se logar como o usuário raiz (root). Para fazer isso, siga os passos:
<ol>
    <li>
        Defina uma senha para o usuário root, caso já não exista. Para fazer isso, digite o comando: ***sudo passwd root***. Ao apertar Enter, será solicitada a senha do usuário que você está logado e uma senha e confirmação para ser setada para o usuário root.
    </li>
    <li>
        Digite “<b><i>su</i></b>” e aperte Enter.
    </li>
    <li>
        Você já está logado como root no sistema.
    </li>
    <li>
        Para voltar para um usuário convencional, digite “<b><i>su < nome_usuario></i></b>”. Ao apertar Enter, você já estará no perfil do outro usuário.
    </li>
</ol>
O Ubuntu, por padrão, não permite que o usuário root seja acessado remotamente de primeira. Ele permite que você acesse como um usuário comum, depois alterando para root. Para que isso seja liberado, é necessário realizar uma configuração específica. Siga os passos a seguir:
<ol>
    <li>
        Acesse o arquivo de texto com as configurações de acesso remoto com permissão de edição. Para isso, digite o comando: <b><i>sudo nano etc/ssh/sshd_config.</i></b>
    </li>
    <li>
        Localize o comando “<b>PermitRootLogin</b>” no documento e descomente-o.
    </li>
    <li>
        Troque o “<b>prohibit-password</b>” para “<b>yes</b>” na frente do comando.
    </li>
    <li>
        Aperte “<i>Ctrl+O</i>” e salve o arquivo com o mesmo nome.
    </li>
    <li>
        Digite: <b><i>sudo systemctl restart sshd</i></b>, aperte Enter.
    </li>
</ol>

</div>

<br/>

---

<br/>

<div id="4">

# **Editores de texto (VI)**
Editor de texto padrão do Ubuntu. Não possui nenhuma interface gráfica. Para abrir um texto com esse editor, basta utilizar o comando: ***vi <nome_arquivo>***. Se o arquivo informado não existir, ele será criado para edição.

Inicialmente, não é possível editar nada, já que o editor é aberto no modo leitura. Para mudar para o modo de escrita, deve-se apertar a letra “**i**”.

Para sair do modo de escrita aperta-se “**Esc**”.

Para acessar o menu, deve-se estar no modo de leitura. Aperta-se o caractere “**:**” e digita-se as opções que se deseja.
- **W**: Essa opção no menu serve para salvar as alterações feitas no arquivo.
- **Q**: Essa opção no menu serve para finalizar o editor de texto.

</div>

<br/>

---

<br/>

<div id="5">

# **Criação de Scripts**
Uma das grandes vantagens do terminal do Linux é a possibilidade de utilizar scripts de comando para executar certas tarefas repetitivas mais facilmente. Esses scripts são criados em uma das pastas do sistema e executados pelo próprio terminal.

Todo script shell deve possuir extensão “**.sh**”. Para isso, é possível criar um novo através do editor de texto **nano**. Outra especificidade dos scripts shell é a necessidade de serem iniciados pelo comando: “**#!/bin/bash**”. Esse comando especifica o kernel utilizado, sendo essencial para o bom funcionamento.

As linhas seguintes do arquivo são utilizadas normalmente para escrever os comandos desejados.

Depois dos comandos definidos e do script salvo, deve-se permitir a execução do script pelo sistema. Isso é feito através do comando:

> ***chmod +x <nome_do_script>***

</div>

<br/>

---

<br/>

<div id="6">

# **Gerenciamento de usuários**
Para **criar** um usuário é utilizado o comando:

> ***useradd <nome_usuario>***

- ***-m***: Cria uma pasta home para esse usuário
- ***-c “<comentário>”***: Define um nome ou um comentário para o usuário
- ***-e <data_dd/mm/yyyy>***: Adiciona uma data de expiração do usuário no sistema. Após a data informada, não é possível mais acessar o sistema pelo usuário criado.
- ***-G <nome_grupo>***: Adiciona o usuário ao grupo cujo nome foi informado.
- ***-p <senha_encriptada>***: Para evitar de ter que editar a senha do usuário, é possível defini-la durante a criação.
    - Para encriptar a senha, existe um serviço padrão do Ubuntu chamado openssl. Nesse caso, a utilização seria algo como “***-p $(openssl passwd -crypt <senha_normal>)***”. O cifrão e os parênteses servem para definir que é um comando sendo executado dentro de outro comando.
Para **excluir** um usuário, é utilizado o comando:

> ***userdel <nome_usuario>***

- ***-r***: Remove a pasta home e outras configurações associadas ao usuário
- ***-f***: Força a exclusão do usuário

Para **alterar a senha** de um usuário é utilizado o comando:

> ***passwd <nome_usuario>***

- ***-e***: Força a senha atual a expirar. Quando for realizado login no usuário novamente, ela deverá ser, obrigatoriamente, trocada.

Quando um usuário é criado, é necessário definir um kernel para ele. Isso torna possível executar comandos e interpretar pastas associadas àquele usuário em questão. Para isso, é utilizado o comando:

> ***chsh -s <kernel_utilizado> <nome_usuario>***

Por padrão, o kernel utilizado é o bash. Então o comando seria: ***chsh -s /bin/bash <nome_usuario>***

Quando queremos logar como um usuário, digitamos ***su <nome_usuario>***.

<div id="6.1">

## **Edição de informações do usuário**
No geral, a alteração de informações e configurações de um usuário é relativamente simples. Ela gira em torno do comando ***usermod***. A sintaxe é:

> ***usermod <nome_usuario> <parâmetros_e_valores>***

</div>

<div id="6.2">

## **Listar usuários do sistema**
Os usuários estão registrados no arquivo de texto “**passwd**”, localizado na pasta “**/etc**”. Para visualizar, utilize o comando:

> ***cat /etc/passwd***

</div>

<div id="6.3">

## **Grupos de usuário**
Para visualizar todos os grupos e usuários atribuídos a eles, é visualizado o arquivo “**group**” presente na pasta “**/etc**”.

Para adicionar um usuário a um grupo, é utilizado o comando ***usermod***, juntamente com a flag “***-G***” e os grupos que se quer adicionar, separados por vírgula. Algo como:

> ***usermod -G <nomes_dos_grupos> <nome_usuario>***

Deve-se utilizar este comando com cuidado, já que o usuário será retirado de todos os grupos que fazia parte anteriormente, sendo adicionado somente aos informados. Eventualmente, ao adicionar um usuário a um grupo, pode haver uma demora ou necessidade de reiniciar a sessão/sistema.

Para remover um usuário de um grupo, é utilizado o comando “***gpasswd***” seguindo a sintaxe a seguir:

> ***gpasswd -d <nome_usuario> <grupo_que_sera_removido>***

É possível também **criar novos grupos** para usuários específicos com permissões específicas, o que favorece a organização do sistema. Para criar um grupo, utilize o comando “***groupadd”***, seguido pelo nome do grupo. Por exemplo “***groupadd TESTE***”.

De forma semelhante, é possível excluir um grupo com o comando “***groupdel***” seguindo a sintaxe: “***groupdel <nome_grupo>***”.

</div>

<div id="6.4">

## **Permissão de grupos e usuários**
Para verificar quais são as permissões de um usuário no sistema, pode-se utilizar o comando “***ls -l***” dentro do diretório “**/home**”. A flag “***-l***” exibe detalhes sobre os arquivos, assim como já foi abordado anteriormente nesse documento. Entre os detalhes exibidos, estão as permissões codificadas por letras, de acordo com a tabela a seguir:

<table>
    <tr>
        <th>
            Letra
        </th>
        <th>
            Significado
        </th>
    <tr>
    <tr>
        <td>
            r
        </td>
        <td>
            Permissão de leitura (Read)
        </td>
    </tr>
    <tr>
        <td>
            w
        </td>
        <td>
            Permissão de escrita (Write)
        </td>
    </tr>
    <tr>
        <td>
            x
        </td>
        <td>
            Permissão de execução (Execute)
        </td>
    </tr>
</table>

No geral, quando as pastas dos usuários são exibidas conforme instruído no parágrafo anterior, as todas seguem um mesmo padrão:

> D<span style="color: red">XXX</span><span style="color: green">XXX</span><span style="color: blue">XXX</span>

Onde os “***X***” são substituídos por cada uma das letras da tabela anteriormente apresentada, sempre na ordem “***r***”, “***w***”, “***x***”. Quando uma dessas permissões não está presente, é adicionado um hífen no lugar dela. São três repetições de “***X***” porque há uma divisão de escopos, que são:
- <span style="color: red">Vermelho</span>: Relativos ao próprio usuário, que é dono daquele diretório. Geralmente ele tem todas as permissões.
- <span style="color: green">Verde</span>: Relativo ao grupo. Sempre que um novo usuário é criado, é criado também um novo grupo com o mesmo nome do usuário. Dessa forma, outros usuários podem ser adicionados ao grupo criado, tendo as permissões descritas nesse trecho da especificação. Geralmente somente as permissões de escrita e execução são garantidas.
- <span style="color: blue">Azul</span>: Relativo aos usuários que não estão adicionados ao grupo do usuário em questão.

É possível, através do usuário **root** ou algum outro que possua permissão de administrador, mudar o dono e  grupo de um arquivo ou diretório através do comando “***chown***”. Ele segue a sintaxe:

> ***chown <usuário_novo_dono>:<grupo_novo_dono> <nome_diretorio_ou_arquivo>***

Para definir e alterar as permissões sobre um arquivo, utilizamos o comando “***chmod***”. São atribuídos valores numéricos às permissões, de acordo com a tabela abaixo:

<table>
    <tr>
        <th>Permissão</th>
        <th>Valor</th>
    </tr>
    <tr>
        <td>R (Leitura)</td>
        <td>4</td>
    </tr>
    <tr>
        <td>W (Escrita)</td>
        <td>2</td>
    </tr>
    <tr>
        <td>X (Execução)</td>
        <td>1</td>
    </tr>
    <tr>
        <td>Nenhuma</td>
        <td>0</td>
    </tr>
</table>

O nível de permissão é atribuído a grupos, assim como foi apresentado anteriormente. Dessa forma, as permissões atribuídas aos grupos, é dada pela soma dos valores de todas as permissões que se quer conceder. Por exemplo, se devemos conceder acesso total a um usuário, a soma seria: 1 + 2 + 4 = 7. Se queremos conceder apenas acesso de leitura e execução, a soma é: 1 + 4 = 5.

A utilização do comando segue a sintaxe:

> ***chmod <soma_permissoes_dono><soma_permissoes_grupo_dono><soma_permissoes_outros> <arquivo_ou_diretorio>***

É possível adicionar e remover permissões específicas para o dono de um arquivo ou diretório. Para fazer isso, são utilizados os sinais “**+**” e “**-**“ para adicionar e remover, respectivamente uma permissão. Veja a sintaxe:

> ***chmod <+_ou_-><letra_da_permissao_(r_w_x)> <arquivo_ou_diretorio>***

</div>

</div>

<br/>

---

<br/>

<div id="7">

# **Gerenciamento de Pacotes**
Eventualmente devemos instalar softwares não nativos do Ubuntu. Para isso, utilizamos gerenciadores de pacote. O mais conhecido é o “**apt-get**”. 

Caso o pacote buscado não esteja presente nas configurações atuais do Ubuntu, é possível adicionar um novo link do repositório que contem o pacote. Para isso, utilizamos o comando “**apt edit-sources**”.

- Para saber quais pacotes e programas você tem instalado, é possível utilizar o comando “***apt list --installed***”.
- Para saber quais podem ser atualizados, utilizamos “***apt list --upgradable***"
- Para buscar um programa no gerenciador, podemos utilizar “***apt search <nome_pacote>***”
- Para instalar um pacote, utilizamos “***apt install <nome_pacote>***”
    - Quando temos um arquivo “*.deb*”, por exemplo, que é executável para instalar algo, podemos utilizar “***apt install <caminho_do_pacote_deb>***”.
- Para desinstalar um pacote, utilizamos “***apt remove <nome_pacote>***”
- Para definir os pacotes que devem ser atualizados para a atualização do sistema, utilizamos “***apt update***”.
- Para de fato atualizar o sistema, utilizamos “***apt upgrade***”
É possível também fazer download através de links de repositórios da internet utilizando o “***wget***”. A sintaxe é:
> ***wget <link_repo_pacote>***

</div>

<br/>

---

<br/>

<div id="8">

# **Gerenciamento de Discos**
Um disco é um objeto físico que é utilizado para armazenar arquivos. Existem basicamente discos de dois tipos:
- **HD (Hard Disk)**, que é lento, mas armazena uma grande quantidade de dados.
- **SSD (Solid State Disk)**, que é mais rápido, mas armazena uma quantidade de dados mais reduzida.

Diferentes Sistemas Operacionais possuem diferentes **Sistemas de arquivos**, que definem o máximo de memória que um disco pode ter, além de como as informações são organizadas no sistema.

Um disco pode ser dividido, dentro do sistema operacional. Essa divisão é chamada de **partição**. No Linux, os discos físicos têm o nome prefixado por “**sd**”, seguido por uma letra que indica qual disco é. As partições seguem o mesmo prefixo e são acrescidas de um número ao final, indicando qual partição aquela é.

Para listar os discos reconhecidos pelo sistema, é utilizado o comando “***lsblk***”, ou o comando “***fdisk -l***”.

<div id="8.1">

## **Instalando um disco**
Quando um novo disco físico é adicionado, ele precisa ser configurado para utilização pelo sistema. Para fazer isso, utilizamos os comandos:
1.	***fdisk /dev/<nome_disco>***: Para abrir as configurações do disco selecionado.
2.	**n**: Para indicar que será criada uma partição no disco
3.	**p** ou **e**: A depender se a partição será **primária** (única partição), ou **estendida** (várias partições podem ser adicionadas depois), respectivamente.
4.	***<numero_da_particao>***: Quando a partição for visualizada, esse é o número que a diferenciará.
5.	***<numero_primeiro_setor>***: Funciona como um “endereço de memória”, em que parte do disco as informações começarão a ser escritas.
6.	***<numero_ultimo_setor>***: Último endereço utilizado pela partição do disco.
7.	**w**: Escreve as alterações feitas na configuração.

Antes da utilização, ainda é necessário formatar o disco instalado. Para isso, é utilizado o comando abaixo:

> ***mkfs.<sistema_de_arquivos> /dev/<nome_disco>***: Isso fará com que o disco seja formatado de acordo com o sistema de arquivos indicado. Por padrão, é utilizado “**ext4**”, mas existem outros.

Feitas essas configurações, ainda é necessário montar o disco no sistema para poder utilizar. Para isso, siga os passos:
1.	***cd /mnt/***: Diretório padrão para montagem de discos no sistema.
2.	***mkdir <nome_pasta_disco>***: O nome da pasta do disco não está limitado ao padrão “**sd...**”.
3.	***mount /dev/<nome_disco> /mnt/<nome_pasta_disco>/***: Esse comando realiza a montagem do disco.

A partir desse momento, a configuração já foi finalizada e o disco está disponível para uso. Todos os arquivos salvos no novo disco ficarão disponíveis na pasta “**/mnt/<nome_pasta_disco>**”.

A pasta “**/mnt/**” não é obrigatória para a montagem do disco, ela é apenas um padrão para isso. Sendo assim, é possível montar o novo disco na própria pasta raiz do sistema.

Sempre que a máquina é reiniciada, é necessário remontar o disco. A menos que o processo de montagem seja automatizado, da forma que os passos a seguir indicam:

1.	***nano /etc/fstab***: Mostra todos os discos montados do sistema
2.	***/dev/<nome_disco> <nome_pasta_disco> <sistema_de_arquivos_disco> defaults 0 0***:  Digite essa linha no final do arquivo aberto. O sistema de arquivos, como dito anteriormente, geralmente é configurado como “**ext4”**.
3.	Salve o arquivo

Dessa forma, o disco sempre estará montado ao iniciar o computador.

Para desmontar o disco, é utilizado o comando “***unmount /dev/<nome_disco>***”. Perceba que isso não exclui os arquivos salvos, apenas desmonta o disco para que ele possa ser removido. Caso os passos de montagem sejam executados novamente, todos os arquivos salvos permanecerão na pasta.

</div>

</div>

<br/>

---

<br/>

<div id="9">

# **Manipulação de arquivos e processos**

<div id="9.1">

## **Cópia de arquivos**
Para copiar um arquivo, o comando utilizado é o “***cp***”. A sintaxe dele é: 

> ***cp <caminho_origem_arquivo_copiado> <caminho_destino_copia>***

Os arquivos copiados aceitam a utilização de *Regex* e *Wildcards*. Ou seja, se queremos mover todos os arquivos com a extensão “**.txt**”, por exemplo, utilizaríamos “***cp *.txt <destino>***”.

- Caso já exista um arquivo de mesmo nome na pasta de destino, a operação de cópia irá sobrescrever o arquivo lá presente. Para evitar que isso aconteça, sempre utilize a flag “***-i***”. Ela faz com que o sistema pergunte se deve sobrescrever os arquivos copiados.

- Por padrão, a cópia não é feita para diretórios. Para mudar isso, deve ser utilizada a flag “***-r***”.

- Para ficar a par do progresso das cópias, é possível utilizar o modo “verboso” através da flag “***-v***”. 

</div>

<div id="9.2">

## **Movendo arquivos**
O comando utilizado é o “***mv***”. Ele é escrito seguindo a sintaxe:

> ***mv <origem_arquivo> <destino_arquivo>/<novo_nome_arquivo>***

O novo nome do arquivo é opcional, se não for informado, o arquivo é movido com o mesmo nome que tinha na origem.

Segue os mesmos padrões descritos na cópia, as flags anteriormente citadas se aplicam para essa operação.

</div>

<div id="9.3">

## **Renomeando arquivos**
Também utiliza o comando “***mv***”. Segue a sintaxe:

> ***mv <caminho_arquivo>/<antigo_nome_arquivo> <caminho_arquivo>/<novo_nome_arquivo>***

</div>

<div id="9.4">

## **Manipulando processos**
Os processos são as seções e execuções de aplicativos e programas. Para visualizar todos os processos ativos no sistema, utilizamos o comando “***ps***”. Para saber os processos de todos usuários, adicionamos a letra “**a**” ao final. Para saber o nome do usuário que está executando o processo, a letra “**u**” é adicionada. Abaixo temos um exemplo:

> ***ps au***

Para encerrar um processo, utilizamos o comando “***kill***”. Ele segue a sintaxe:

> ***kill <PID_processo>***

O PID, por sua vez, é um identificador do processo ativo, que pode ser lido ao listar os processos, assim como anteriormente ensinado. É possível utilizar também o comando “***killall***”, com a sintaxe:

> ***killall <nome_processo>***

Isso finaliza todos os processos ativos por todos os usuários cujo nome é o informado.

A finalização de processos também pode ser utilizada para remover usuários do sistema. Para isso, é necessário saber qual o PID de Logon do usuário ativo, que pode ser obtido com o comando “***who -a***”. Ele mostra o nome de usuário, data e hora de logon no sistema e o PID do mesmo.

Para remover o usuário, basta utilizar o comando “***kill***” seguido do PID do usuário, assim como foi mostrado acima.

</div>

</div>