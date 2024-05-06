<div align="center">
  <img src="./images/header.png" width="100%">
</div>

<br>

## 🎯 Objetivo
&emsp;&emsp; O objetivo deste projeto é criar um banco de dados relacional para fazer a gestão de unidades de saúde, armazenando informações sobre pacientes, médicos, consultas e exames. Para isso, é necessário realizar deploy do banco de dados na nuvem, utilizando o serviço Amazon RDS e fazer a conexão com o MySQL Workbench para povoar o database e realizar consultas SQL.

### Tecnologias Utilizadas
![Amazon AWS](https://img.shields.io/badge/Amazon_AWS-232F3E?style=for-the-badge&logo=amazon-aws&logoColor=white)
![MySQL](https://img.shields.io/badge/MySQL-005C84?style=for-the-badge&logo=mysql&logoColor=white)

<br>

## 🤓 Desenvolvimento

### 📊 Diagrama Lógico
&emsp;&emsp; Diagrama lógico é uma representação visual de um banco de dados que descreve sua estrutura, incluindo as tabelas, colunas, tipos de dados e as relações entre as tabelas. Ele fornece uma visão geral do database, permitindo que você veja como os dados estão organizados e como eles se relacionam entre si.

&emsp;&emsp; O diagrama lógico do banco de dados foi desenvolvido utilizando a ferramenta [Lucidchart](https://www.lucidchart.com/).

<div align="center">
  <img src="./images/diagrama-logico.png" width="100%">
</div>

<br>

### 📝 Descrição das Entidades

**Entidades Fortes**
| Entidade | Atributos | Relacionamento |
| --- | --- | --- |
| Paciente | **id** int PK <br> **nome** varchar(50) <br> **idade** int | 1:N com Consulta <br> 1:N com Transporte |
| Médico | **id** int PK <br> **nome** varchar(50) <br> **especialidade** varchar(50) <br> **id_unidade** int FK | 1:N com Consulta |
| Unidade de Saúde | **id** int PK <br> **nome** varchar(50) <br> **endereco** varchar(100) <br> **tipo** varchar(50) | 1:N com Médico <br> 1:N com Estoque <br> 1:N com Veiculo |
| Veículo | **id** int Pk <br> **placa** varchar(50) <br> **modelo** varchar(50) <br> **id_unidade** int FK| 1:N com Transporte |
| Produto | **id** int PK <br> **nome** varchar(50) <br> **tipo** varchar(50) <br> **descricao** varchar(255) | 1:N com Estoque |

<br>

**Entidades Fracas**
| Entidade | Atributos | Relacionamento |
| --- | --- | --- |
| Consulta | **data_hora** datetime PK <br> **id_medico** int PK FK <br> **id_paciente** int FK <br> **gravidade** int <br> **consultorio** int | Tabela Associativa entre Paciente e Médico <br> Chave primária composta evita consultas no mesmo horário para cada médico |
| Transporte | **id** int PK <br> **id_paciente** int FK <br> **id_veiculo** int FK <br> **data** date <br> **acompanhante** boolean | Tabela Associativa entre Paciente e Veículo |
| Estoque | **id** int PK <br> **id_produto** int FK <br> **id_unidade** int FK <br> **quantidade** int <br> **quantidade_minima** int | Tabela Associativa entre Unidade de Saúde e Produto |

<br>

### 🗃️ Criar RDS

&emsp;&emsp; Para a execução deste projeto, foi criado um banco de dados MySQL na AWS, utilizando o serviço Amazon RDS. Amazon Relational Database Service é um serviço de banco de dados relacional que facilita a configuração, operação e escalabilidade de um banco de dados relacional na nuvem. 

&emsp;&emsp; Para criar o banco dados, siga o tutorial [Criar um banco de dados MySQL no Amazon RDS](https://docs.aws.amazon.com/pt_br/AmazonRDS/latest/UserGuide/CHAP_GettingStarted.CreatingConnecting.MySQL.html). Importante não esquecer de configurar o Security Group para permitir a conexão com o MySQL Workbench.

Abaixo, segue a tela da instância criada no Amazon RDS.

<div align="center">
  <img src="./images/aws-rds-created.png" width="100%">
</div>

<br>

### 🔗 Criar Conexão com MySQL Workbench
&emsp;&emsp; O MySQL Workbench é uma ferramenta visual de design de banco de dados que integra o desenvolvimento, administração, design, criação e manutenção de bancos de dados MySQL em um ambiente de desenvolvimento integrado.

&emsp;&emsp; Para conectar o MySQL Workbench com o banco de dados criado no Amazon RDS, siga o tutorial [Conectar-se a um banco de dados MySQL com o MySQL Workbench](https://docs.aws.amazon.com/pt_br/AmazonRDS/latest/UserGuide/USER_ConnectToInstance.html). Com isso, você poderá executar comandos SQL, criar tabelas, inserir dados e realizar consultas no banco de dados de forma visual.

<div align="center">
  <img src="./images/workbench-connection.png" width="100%">
</div>

### 🔎 Executar Comandos

&emsp;&emsp; Após a conexão com o banco de dados, é possível executar comandos SQL para criar tabelas, inserir dados e realizar consultas. Abaixo, segue os outputs dos comandos SQL utilizados, que podem ser encontrados nos arquivos `db.sql`, `inserts.sql` e `query.sql` dentro da pasta `src`.

**Criando Tabelas**
<div align="center">
  <img src="./images/workbench-output-create-table.png" width="100%">
</div>

<br>

**Inserindo Dados**
<div align="center">
  <img src="./images/workbech-output-inserting.png" width="100%">
</div>

<br>

**Realizando Consultas**
> Calcule o número médio de pacientes transportados por veículo por mês
<div align="center">
  <img src="./images/workbench-output-query.png" width="100%">
</div>

<br>

<hr>

<br>

<div align="center">
  <img src="./images/footer.png" width="100%">
</div>