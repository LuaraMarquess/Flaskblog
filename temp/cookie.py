from flask import Flask, request, make_response, render_template
import json

app = Flask(__name__)


@app.route('/set_cookie', methods=['POST'])
def set_cookie():

    # form = dict(request.form)
    form = {
        'name': 'Joca da Silva',
        'email': 'joca@silva.com'
    }

    data = {
        'name': form['name'],
        'email': form['email']
    }
    resp = make_response(render_template('template.html'))
    # Converte o dicionário para JSON e salva no cookie
    resp.set_cookie('meu_cookie', json.dumps(data))
    return resp


@app.route('/get_cookie')
def get_cookie():
    cookie_data = request.cookies.get('meu_cookie')
    if cookie_data:
        # Converte a string JSON de volta para um dicionário
        data = json.loads(cookie_data)
        return f"Nome: {data['name']}, Email: {data['email']}"
    else:
        return "Cookie não encontrado!"


if __name__ == '__main__':
    app.run(debug=True)
