from flask_mysqldb import MySQLdb


def save_comment(mysql, form):

    sql = '''
        INSERT INTO comment (
            com_article,
            com_author_name,
            com_author_email,
            com_comment
        ) VALUES (
            %s,
            %s,
            %s,
            %s
        )
    '''
    cur = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
    cur.execute(sql, (
        form['id'],         # Id do artigo
        form['name'],       # nome do autor do comentário
        form['email'],      # email do autor do comentário
        form['comment'],    # comentário
    ))
    mysql.connection.commit()
    cur.close()

    return True


def get_all_comments(mysql, artid):

    sql = '''
        SELECT com_author_name, com_comment,
        DATE_FORMAT(com_date, '%%d/%%m/%%Y às %%H:%%i') AS com_datebr
        FROM comment
        WHERE com_article = %s
            AND com_status = 'on'
        ORDER BY com_date DESC;
    '''
    cur = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
    cur.execute(sql, (artid,))
    comments = cur.fetchall()
    cur.close()

    return comments
