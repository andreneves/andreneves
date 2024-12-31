-- Código para criar uma tabela temporária a partir de uma consulta
-- A tabela não vai aparecer na listagem das tabelas, mas vai ser possível consulta-la via select

-- CRIACAO
CREATE TEMPORARY TABLE IF NOT EXISTS empresas_temp AS (SELECT * FROM empresas limit 1000);

-- CONSULTA
SELECT * FROM empresas_temp;


-- Crédito: David Oliveira @dbolvr