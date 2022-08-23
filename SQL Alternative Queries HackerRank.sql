-- Draw The Triangle 1

-- P(R) represents a pattern drawn by Julia in R rows. The following pattern represents P(5):

DECLARE @i INT = 20 
WHILE @i > 0
    BEGIN
        PRINT REPLICATE('* ', @i)
        SET @i = @i - 1
    END


 -- Draw The Triangle 2

 -- P(R) represents a pattern drawn by Julia in R rows. The following pattern represents P(5):

DECLARE @i INT = 1
WHILE @i < 21 
	BEGIN
		PRINT REPLICATE('* ', @i)
		SET @i = @i + 1
	END