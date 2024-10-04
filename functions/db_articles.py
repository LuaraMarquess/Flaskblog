from flask_mysqldb import MySQLdb


def get_all(mysql):

    sql = '''
        -- Recebe a lista de artigos do banco de dados:
        --  A) Somente os campos necessários
        --  B) Somente artigos online
        --  C) Somente artigos do presente e passado (agendamento)
        --  D) Ordenados pela data, com mais recentes primeiro

        -- A --
        SELECT art_id, art_title, art_resume, art_thumbnail
        FROM `article` 
        -- B --
        WHERE art_status = 'on'
        -- C --
            AND art_date <= NOW()
        -- D --
        ORDER BY art_date DESC;
    '''
    cur = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
    cur.execute(sql)
    articles = cur.fetchall()
    cur.close()

    return articles


def get_one(mysql, artid):  # Obtém 1 artigo pelo id com os dados do autor

    sql = '''
        SELECT
            -- Campos do artigo
            art_id, art_title, art_content,
            -- Campos do author
            sta_id, sta_name, sta_image, sta_description, sta_type,
            -- Campos expeciais
            -- Converter a data do artigo para PT-BR
            DATE_FORMAT(art_date, '%%d/%%m/%%Y às %%H:%%i') AS art_datebr,
            -- Obtém a idade do autor
            TIMESTAMPDIFF(YEAR, sta_birth, CURDATE()) - 
                (RIGHT(CURDATE(), 5) < RIGHT(sta_birth, 5)) AS sta_age
        FROM article
        -- Junção das tabelas article e staff
        INNER JOIN staff ON art_author = sta_id
        -- Fitros
        WHERE art_id = %s
            AND art_status = 'on'
            AND art_date <= NOW();
    '''
    cur = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
    cur.execute(sql, (artid,))
    article = cur.fetchone()
    cur.close()

    return article


def get_by_author(mysql, staid, artid, limit=4): # Obtém as artigos do author

    sql = '''
        SELECT art_id, art_title, art_thumbnail 
        FROM article
        WHERE art_author = %s
            AND art_id != %s
            AND art_status = 'on'
            AND art_date <= NOW()
        ORDER BY RAND()
        LIMIT %s
    '''
    cur = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
    cur.execute(sql, (staid, artid, limit,))
    articles = cur.fetchall()
    cur.close()

    return articles

def update_views(mysql, artid): # Atualiza as visualizações do artigo

    sql = '''
        UPDATE article 
        SET art_views = art_views + 1
        WHERE art_id = %s;
    '''
    cur = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
    cur.execute(sql, (artid,))
    mysql.connection.commit()
    cur.close()

    return True