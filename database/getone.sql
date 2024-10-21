-- Obtém 1 artigo pelo id com os dados do autor

SELECT
	-- Campos do artigo
	art_id, art_title, art_content,
    -- Campos do author
    sta_id, sta_name, sta_image, sta_description, sta_type,
    -- Campos expeciais
    -- Converter a data do artigo para PT-BR
    DATE_FORMAT(art_date, '%d/%m/%Y às %H:%i') AS art_datebr,
    -- Obtém a idade do autor
    TIMESTAMPDIFF(YEAR, sta_birth, CURDATE()) - 
        (RIGHT(CURDATE(), 5) < RIGHT(sta_birth, 5)) AS sta_age
FROM article
-- Junção das tabelas article e staff
INNER JOIN staff ON art_author = sta_id
-- Fitros
WHERE art_id = '6'
	AND art_status = 'on'
    AND art_date <= NOW();