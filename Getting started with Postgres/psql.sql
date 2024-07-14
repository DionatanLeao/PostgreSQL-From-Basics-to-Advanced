psql --help
psql -h hostname -p 5432 -d dbname -U username -W
sudo su - postgres
psql -c "SELECT CURRENT_TIME"
psql SQL
\h DELETE

psql -h 127.0.0.1 -d postgres-course -U postgres -W
psql -d postgres -h localhost -U postgres -W
\l -- lista todos os bancos de dados
\c teste
\dt -- lista todas as tabelas
\d alunos -- lista uma tabela em específico
\dn -- lista todos os schemas
\df -- lista as funções
\dv -- lista todas as visões
\du -- lista usuários
\s -- lista o histórico dos comandos
\s historico.txt -- salva lista de algum comando em um arquivo
\e -- lista os editores de texto
\q -- sair

