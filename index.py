from flask import Flask   #from flask import Flask


app = Flask(__name__)    #Cria uma instância da classe Flask. O parâmetro __name__
#é usado para identificar o módulo atual e ajudar o Flask a localizar recursos como templates e arquivos estáticos.


@app.route('/') #Define uma rota para a URL raiz ('/'). 
#O decorador @app.route é usado para associar uma função a um URL específico. Quando um usuário acessa a URL raiz, a função home será chamada.
#python


def home():
 #Define a função home, que será executada quando alguém acessar a URL associada à rota '/'.



    return "Hello World!"

@app.route('/contatos')
def contacts():
    return "Diga o que você quer!"

if __name__ == '__main__':
    app.run(debug=True)