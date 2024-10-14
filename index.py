# Importa a classe Flask do módulo flask
from flask import Flask, render_template, request
# Importa a bilbioteca de acesso ao MySQL
from flask_mysqldb import MySQL, MySQLdb
# Importa todas funções dos artigos de `db_articles`
from functions.db_articles import *
from functions.db_contacts import save_contact
# Envio de e-mails
from flask_mail import Mail, Message

# Cria uma instância da aplicação Flask
app = Flask(__name__)

# Dados de conexão
app.config['MYSQL_HOST'] = 'localhost'  # Endereço do servidor MySQL
app.config['MYSQL_USER'] = 'root'       # Nome de usuário do MySQL
app.config['MYSQL_PASSWORD'] = ''       # Senha do usuário do MySQL
app.config['MYSQL_DB'] = 'flaskblogdb'  # Nome do banco de dados

# Dados do SMTP
app.config['MAIL_SERVER'] = 'smtp.gmail.com'
app.config['MAIL_PORT'] = 587
app.config['MAIL_USE_TLS'] = True
app.config['MAIL_USERNAME'] = 'jocadasilvajoquinha@gmail.com'
app.config['MAIL_PASSWORD'] = 'sua_senha'

# Conecta o Python ao MySQL → `mysql` é a conexão com o banco de dados
mysql = MySQL(app)

# Cria o objeto de e-mail
mail = Mail(app)

########################
# Tratamento das rotas #
########################


@app.route('/')  # Define a rota para a URL raiz ('/')
def home():  # Função executada quando '/' é acessado

    articles = get_all(mysql)

    # Debug: mostra o resultado no console
    # print('\n\n\n',articles, '\n\n\n')

    # Variável da página HTML
    toPage = {
        # Valor da tag <title> → Título da página
        'title': 'FlaskBlog',
        # Nome da folha de estilos desta página (opcional)
        'css': 'home.css',
        # Nome do JavaScript desta página (opcional)
        'js': 'home.js',
        # Outros pares "chave" : "valor" entram aqui
        'articles': articles
    }

    # Abre a página de template → layout.html
    # Passa a variável local `toPage` para o template como `page`
    return render_template('home.html', page=toPage)


# Rota que exibe o artigo completo
@app.route('/view/<artid>')
def view(artid):

    # Se o Id do artigo não é um número, exibe erro 404
    if not artid.isdigit():
        return page_not_found(404)

    article = get_one(mysql, artid)

    # Se o artigo não existe, exibe erro 404
    if article == None:
        return page_not_found(404)

    # Debug → Comente-me!
    # print('\n\n\n', article, '\n\n\n')

    # Atualiza vsualizações do artigo
    update_views(mysql, article['art_id'])

    # Obtém mais artigos do autor
    articles = get_by_author(mysql, article['sta_id'], article['art_id'])

    # Traduz o type do author
    match article['sta_type']:
        case 'admin':
            article['sta_typebr'] = 'Administrador'
        case 'author':
            article['sta_typebr'] = 'Autor'
        case 'moderator':
            article['sta_typebr'] = 'Moderador'
        case _:
            article['sta_typebr'] = 'Colaborador'

    toPage = {
        'title': '',
        'css': 'view.css',
        'article': article,  # Passa o artigo para a view.html
        'articles': articles
    }

    return render_template('view.html', page=toPage)


# Define a rota para a URL '/contatos'
@app.route('/contacts', methods=['GET', 'POST'])
def contacts():  # Função executada quando '/contacts' é acessado

    # Formulário não enviado
    success = False

    # Primeiro nome do remetente
    first = ''

    # Se o formulário foi enviado
    if request.method == 'POST':

        # Recebe os dados do front-end (form)
        form = dict(request.form)

        # print('\n\n\n', form, '\n\n\n')

        # Salva contato no banco de dados
        success = save_contact(mysql, form)

        # Obtém o primeiro nome do remetente
        first = form['name'].split()[0]

        # Envia e-mail para o ADM
        subject = form['subject']
        body = form['message']
        recipient = 'admin@flaskblo.com' # Destinatário

        msg = Message(
            subject, sender=app.config['MAIL_USERNAME'], recipients=[recipient])
        msg.body = f'Olá Admin! \n\n Você recebeu um novo contato do site:\n\n{body}'

        mail.send(msg)

    # Variável da página HTML
    toPage = {
        'title': 'Faça contato',
        'css': 'contacts.css',
        'success': success,
        'first': first
    }

    print('\n\n\n', toPage, '\n\n\n')

    # Retorna uma mensagem simples
    return render_template('contacts.html', page=toPage)


@app.errorhandler(404)  # Manipula o erro 404
def page_not_found(e):
    toPage = {
        'title': 'Erro 404',
        'css': '404.css'
    }
    return render_template('404.html', page=toPage), 404


# Verifica se o script está sendo executado diretamente
if __name__ == '__main__':
    # Inicia o servidor Flask em modo debug
    app.run(debug=True)
