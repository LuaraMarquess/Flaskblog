from flask_mysqldb import MySQLdb


def get_all(mysql):

    sql = """
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
    """
    cur = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
    cur.execute(sql)
    articles = cur.fetchall()
    cur.close()

    return articles