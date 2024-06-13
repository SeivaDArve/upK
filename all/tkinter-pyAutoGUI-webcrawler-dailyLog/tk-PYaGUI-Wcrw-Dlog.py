# Title: Support for dailYlog.org to export info to siigo.com
# Instalar Tkinter: 1. `sudo apt install python3-tk`

# Instalar Tkinter (no WSL2 que não tem X Server (parte grafica)):
#   1. O WSL2 não tem suporte nativo para interfaces graficas. Para visualizar interfaces gráficas no WSL2, você precisará de um servidor X (X server) no Windows. O X server permitirá que você visualize janelas gráficas.
#      Instalar e permitir conexões de rede ao VcXsrv: https://www.shogan.co.uk/how-tos/wsl2-gui-x-server-using-vcxsrv/
#      2.1 `sudo apt install xfce4 xfce4-goodies`
#      2.2 During the install you’ll be prompted about which display manager to use. This is up to you, though I personally chose 'lightdm'.
#      2.3 Download and extract the .zip file at C:\
#           2.3.1 `mkdir -p ~/.tmp && cd ~/.tmp`
#           2.3.1 `wget https://shogan.b-cdn.net/wp-content/uploads/WSL-VcXsrv.zip`
#           2.3.1 `sudo apt install unzip`
#           2.3.1 `unzip X.zip`
#                 `h=$(pwd)`
#           2.3.1 `cd mnt/c/`
#                 `mv $h/'WSL VcXsrv'/ .`
#                  Run the vcxsrv-64.1.20.8.1.installer.exe installer in this folder, choosing defaults for the install.

""" Tutorial: https://www.youtube.com/watch?v=MeMCBdnhvQs&list=PLs3IFJPw3G9IiHm9PEP1UaMtuvACmxVMj """

""" Note: Existem 3 'Geometry manager' para colocar os nossos widget no ecra: `pack` `place` `grid` """
import tkinter as tk

""" Criar a janela principal """
window = tk.Tk()

""" Definir o título da janela """
window.title("Janela Tkinter")

""" Definir o tamanho da janela """
window.geometry("300x200")

""" Criar Texto/label (são os textos simples e estaticos que apresentamos no ecra) """
label = tk.Label(window, text="Olá, Tkinter!")

""" Enviar esse label para a janela principal 'window' """
#label.pack()                   # Escolher entre 'pack' e 'grid'
label.grid(row=0, column=0)     # Escolher entre 'pack' e 'grid'

""" Criar campos para preencher com dados """
inserir_texto = tk.Entry(window)
#inserir_texto = tk.Entry(window, show="*")  # `show="*"` significa "Substituir todo o texto introduzido por asteriscos" ou seja, serve para introduzir passwords

""" Enviar esse campo para a janela principal 'window' """
inserir_texto.grid(row=0, column=1)

""" Criar um botao """
butao = tk.Button(window, text="Butao 1")

""" Enviar esse botao para a janela 'window' """
butao.grid(row=3, column=1)


""" Alterar a cor de fundo  """
window.configure(bg='#333333')

""" Iniciar o loop principal (apos este loop, nada seraexecutado até o loop ser cancelado) """
window.mainloop()











