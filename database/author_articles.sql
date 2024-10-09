-- Obtém as artigos do author

-- Seleciona os campos abaixo da tabela `article`
SELECT art_id, art_title, art_thumbnail 
FROM article
WHERE art_author = '2' -- Deste autor
	AND art_id != '1'  -- Não obtém o artigo atual
    AND art_status = 'on' -- Status sempre 'on' (RN)
    AND art_date <= NOW() -- Data no passado ou presente (RN)
ORDER BY RAND() -- Ordena aleatoriamente
LIMIT 4; -- Obtém até 4