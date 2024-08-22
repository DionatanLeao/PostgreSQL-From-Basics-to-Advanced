su - postgres
psql -V

postgres=# show data_directory;

locate pg_isready
su - postgres
psql 

CREATE TABLE a AS SELECT id AS a, id AS b, id AS c FROM generate_series(1, 50000) AS id;
CREATE INDEX idx_a_a ON a (a);
CREATE INDEX idx_a_b ON a (b);
SELECT COUNT(*) from a;

systemctl stop postgresql-15.service
dnf install -y postgresql16-server postgresql16
updatedb
locate pg_isready

/usr/pgsql-15/bin/

/usr/pgsql-16/bin/

ls /var/lib/pgsql/

/var/lib/pgsql/15
/var/lib/pgsql/16

su - postgres
/usr/pgsql-16/bin/initdb -D /var/lib/pgsql/16/data
time /usr/pgsql-16/bin/pg_upgrade --old-bindir /usr/pgsql-15/bin/ --new-bindir /usr/pgsql-16/bin/ --old-datadir /var/lib/pgsql/15/data --new-datadir /var/lib/pgsql/16/data --link --check

time /usr/pgsql-16/bin/pg_upgrade --old-bindir /usr/pgsql-15/bin/ --new-bindir /usr/pgsql-16/bin/ --old-datadir /var/lib/pgsql/15/data --new-datadir /var/lib/pgsql/16/data --link
systemctl enable --now postgresql-16
su - postgres
/usr/pgsql-16/bin/vacuumdb --all --analyze-in-stages

./delete_old_cluster.sh

psql -V

SELECT COUNT(*) from a;