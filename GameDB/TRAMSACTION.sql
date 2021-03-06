use GameDB;

SELECT *
FROM accounts;

INSERT INTO accounts VALUES(1, 'Hanna', 100, GETUTCDATE());

DELETE accounts;

BEGIN TRAN;
	INSERT INTO accounts VALUES(2, 'Hanna2', 100, GETUTCDATE());
ROLLBACK;

BEGIN TRAN;
	INSERT INTO accounts VALUES(2, 'Hanna2', 100, GETUTCDATE());
COMMIT;

BEGIN TRY
	BEGIN TRAN;
		INSERT INTO accounts VALUES (1, 'Hanna', 100, GETUTCDATE());;
		INSERT INTO accounts VALUES (3, 'Hanna3', 100, GETUTCDATE());;
	COMMIT;
END TRY
BEGIN CATCH
	IF @@TRANCOUNT>0
		ROLLBACK
	PRINT('ROLLBACK')
END CATCH

BEGIN TRAN;
	INSERT INTO accounts VALUES(4, 'Hanna4', 100, GETUTCDATE());
ROLLBACK;