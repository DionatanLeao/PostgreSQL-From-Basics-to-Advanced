ss -tulpn | grep LISTEN
locate postgresql.conf
locate postgresql-16.service
vim /usr/lib/systemd/system/postgresql-16.service

Environment=PGDATA=/var/lib/pgsql/16/data/

systemctl stop postgresql-16.service
chmod 770 /var/run/postgresql/
adduser postgres2
passwd postgres2
usermod -a -G postgres postgres2
ls -la /var/run/postgresql/
mkdir -p /usr/local/pgsql2
chown postgres2 /usr/local/pgsql2
chmod 740 -R /usr/local/pgsql2
su - postgres2
initdb -D /usr/local/pgsql2/data

cd /usr/local/pgsql2/data
vim postgresql.conf

port = 5434

cp /usr/lib/systemd/system/postgresql-16.service /usr/lib/systemd/system/postgresql-5434.service
vim /usr/lib/systemd/system/postgresql-5434.service

User=postgres2
Group=postgres2

Environment=PGDATA=/usr/local/pgsql2/data

sudo systemctl daemon-reload
systemctl enable --now postgresql-5434.service
systemctl list-unit-files | grep postgres
ls -la /var/run/postgresql
systemctl restart postgresql-16
su - postgres2
psql -p 5434 postgres
psql -p 5432 postgres -U postgres
ss -tulpn | grep LISTEN