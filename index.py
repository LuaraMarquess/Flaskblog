# Importa a classe Flask do módulo flask
from flask import Flask, render_template
# Importa a bilbioteca de acesso ao MySQL
from flask_mysqldb import MySQL, MySQLdb
# Importa todas funções dos artigos de `db_articles`
from functions.db_articles import *

# Cria uma instância da aplicação Flask
app = Flask(__name__)

# Dados de conexão
app.config['MYSQL_HOST'] = 'localhost'  # Endereço do servidor MySQL
app.config['MYSQL_USER'] = 'root'       # Nome de usuário do MySQL
app.config['MYSQL_PASSWORD'] = ''       # Senha do usuário do MySQL
app.config['MYSQL_DB'] = 'flaskblogdb'  # Nome do banco de dados

# Conecta o Python ao MySQL → `mysql` é a conexão com o banco de dados
mysql = MySQL(app)

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

    toPage = {
        'title': '',
        'css': 'view.css'
    }

    return render_template('view.html', page=toPage)


@app.route('/contacts')  # Define a rota para a URL '/contatos'
def contacts():  # Função executada quando '/contacts' é acessado

    # Variável da página HTML
    toPage = {
        'title': 'Faça contato',
        'css': 'contacts.css'
    }

    # Retorna uma mensagem simples
    return render_template('contacts.html', page=toPage)


# Verifica se o script está sendo executado diretamente
if __name__ == '__main__':
    # Inicia o servidor Flask em modo debug
    app.run(debug=True)
