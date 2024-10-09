import tkinter as tk
import random

def verificar_letra():
    global tentativas
    letra = entrada.get()
    if letra in palavra_secreta:
        letras_adivinhadas.append(letra)
        atualizar_palavra()
    else:
        tentativas -= 1
        atualizar_tentativas()
        if tentativas == 0:
            fim_de_jogo("Perdeu")

    entrada.delete(0, tk.END)

def atualizar_palavra():
    palavra_atual = ''.join([letra if letra in letras_adivinhadas else '_' for letra in palavra_secreta])
    label_palavra.config(text=palavra_atual)
    if "_" not in palavra_atual:
        fim_de_jogo("Ganhou")

def atualizar_tentativas():
    label_tentativas.config(text=f"Tentativas restantes: {tentativas}")

def fim_de_jogo(resultado):
    label_resultado = tk.Label(janela, text=resultado, font=("Helvetica", 18))
    label_resultado.pack()
    botao_fechar = tk.Button(janela, text="Fechar", command=janela.destroy)
    botao_fechar.pack()

# Lista de palavras
palavras = ["banana", "abacate"]

# Selecionar uma palavra aleatoriamente
palavra_secreta = random.choice(palavras)

# Configuração da interface gráfica
janela = tk.Tk()
janela.title("Jogo da Forca")

letras_adivinhadas = []
tentativas = 6

label_palavra = tk.Label(janela, text="_ " * len(palavra_secreta))
label_palavra.pack()

label_tentativas = tk.Label(janela, text=f"Tentativas restantes: {tentativas}")
label_tentativas.pack()

entrada = tk.Entry(janela)
entrada.pack()

botao_verificar = tk.Button(janela, text="Verificar", command=verificar_letra)
botao_verificar.pack()

janela.mainloop()
