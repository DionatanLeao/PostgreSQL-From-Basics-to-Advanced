sudo su - postgres
psql

SELECT * FROM pg_stat_activity;

SELECT pg_cancel_backend(978);

SELECT pg_terminate_backend(978);

SELECT pg_terminate_backend(pid) FROM pg_stat_activity WHERE usename = 'algum_role';