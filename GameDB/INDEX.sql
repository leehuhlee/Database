USE GameDB;

CREATE INDEX i1 ON accounts(accountNAme);

CREATE UNIQUE INDEX i2 ON accounts(accountName);

DROP INDEX accounts.i1;

CREATE UNIQUE INDEX i3 ON accounts(accountName, coins);

CREATE CLUSTERED INDEX i4 ON accounts(accountName);