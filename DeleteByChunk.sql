
DECLARE @BatchSize INT = 100000; -- Número de linhas a serem excluídas por vez
DECLARE @RowsDeleted INT = 1;

WHILE @RowsDeleted > 0
BEGIN
    -- Deleta um lote de linhas
    DELETE TOP (@BatchSize)
    FROM TB_Parcela_affix
    WHERE Data_atualizacao < '2023-10-01 00:00:00';

    -- Obtém o número de linhas afetadas na última execução
    SET @RowsDeleted = @@ROWCOUNT;

    -- Aguarda um curto período para liberar recursos
    WAITFOR DELAY '00:00:01'; -- Ajuste conforme necessário
END
