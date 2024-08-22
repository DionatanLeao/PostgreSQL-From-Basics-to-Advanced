updatedb

locate postgresql.conf
locate pg_hba.conf
su - postgres
psql
SELECT name FROM pg_settings;
SHOW shared_buffers ;
SELECT current_setting('shared_buffers');

https://www.postgresql.org/docs/current/runtime-config-preset.html

SELECT name FROM pg_settings WHERE context = 'internal';
SHOW block_size;
ALTER SYSTEM SET block_size = 4096;

https://www.postgresql.org/docs/current/runtime-config-resource.html

SELECT name FROM pg_settings WHERE context = 'postmaster';
SHOW shared_buffers;
ALTER SYSTEM SET shared_buffers = '250MB'; 
SELECT pg_reload_conf();

systemctl restart postgresql-16

SHOW shared_buffers;
SELECT name FROM pg_settings WHERE context = 'sighup';
SHOW fsync;
ALTER SYSTEM SET fsync = off;
SELECT pg_reload_conf();
SHOW fsync;