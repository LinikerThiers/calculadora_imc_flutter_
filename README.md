# Calculadora de IMC - Flutter

Este projeto é uma calculadora de IMC (Índice de Massa Corporal) desenvolvida em Flutter. Ele permite que os usuários calculem seu IMC com base no peso e altura fornecidos, além de armazenar o histórico de cálculos em um banco de dados SQLite. O projeto é composto por várias páginas, widgets, modelos, repositórios e um banco de dados.

![Image](https://github.com/user-attachments/assets/f835449b-6167-488d-bbf8-e63654bf3471)
![Image](https://github.com/user-attachments/assets/bafb935e-f474-453f-878c-33b50c02b59f)

## Funcionalidades

- **Cálculo de IMC**: O usuário pode inserir seu nome, peso e altura para calcular o IMC.
- **Histórico de Cálculos**: O aplicativo armazena todos os cálculos de IMC realizados, permitindo que o usuário visualize o histórico.
- **Exclusão de Registros**: O usuário pode excluir registros do histórico.
- **Interface Amigável**: A interface é simples e intuitiva, com feedback visual imediato após o cálculo.

## Estrutura do Projeto

### Páginas

1. **ImcCalculoPage**: Página principal onde o usuário insere os dados para calcular o IMC.
2. **ResultadoCalculosImcPage**: Página que exibe o histórico de cálculos de IMC.
3. **MyHomePage**: Página que gerencia a navegação entre as duas páginas anteriores usando um `PageView` e um `BottomNavigationBar`.

### Widgets Utilizados

- **TextField**: Para entrada de dados (nome, peso, altura).
- **TextButton**: Para os botões de "Calcular" e "Limpar".
- **SnackBar**: Para exibir mensagens de sucesso ou erro.
- **ListView.builder**: Para exibir o histórico de cálculos.
- **Dismissible**: Para permitir a exclusão de registros com um gesto de deslizar.
- **Card**: Para estilizar os itens do histórico.
- **BottomNavigationBar**: Para navegar entre as páginas de cálculo e histórico.

### Dependências

- **sqflite**: Para gerenciar o banco de dados SQLite.
- **path_provider**: Para obter o caminho do diretório onde o banco de dados será armazenado.

### Modelo (ImcModel)

A classe `ImcModel` representa o modelo de dados para o cálculo do IMC. Ela contém os seguintes atributos:

- `id`: Identificador único do registro.
- `nome`: Nome do usuário.
- `peso`: Peso do usuário.
- `altura`: Altura do usuário.
- `resultado`: Resultado do cálculo do IMC.
- `statusImc`: Status do IMC (ex: "Saudável", "Sobrepeso", etc.).

A classe também possui um método `calcular` que realiza o cálculo do IMC e define o status com base no resultado.

### Repositório (ImcRepository)

A classe `ImcRepository` é responsável por gerenciar as operações de banco de dados, incluindo:

- **obterDados**: Recupera todos os registros de IMC do banco de dados.
- **salvar**: Salva um novo cálculo de IMC no banco de dados.
- **atualizar**: Atualiza um registro existente.
- **remover**: Remove um registro do banco de dados.

### Banco de Dados (SQLiteDataBase)

A classe `SQLiteDataBase` gerencia a criação e atualização do banco de dados SQLite. Ela contém um script SQL para criar a tabela `imc` e métodos para obter e inicializar o banco de dados.

## Como Executar o Projeto

1. **Clone o repositório**:
   ```bash
   git clone https://github.com/seu-usuario/calculadora-imc-flutter.git
   cd calculadora-imc-flutter
2. **Instale as dependências**:
   ``` bash
    flutter pub get

3. **Execute o aplicativo**:
    ```bash
    flutter run
   
**Dependências do Projeto**:

As dependências utilizadas no projeto estão listadas no arquivo pubspec.yaml:

    dependencies:
      flutter:
      sdk: flutter
      sqflite: ^2.4.0
      path_provider: ^2.1.5 

Conclusão

Este projeto é uma aplicação simples, mas funcional, que demonstra o uso de Flutter para criar uma calculadora de IMC com armazenamento de dados local. Ele pode ser expandido com novas funcionalidades, como gráficos de progresso, integração com APIs de saúde, ou até mesmo a adição de autenticação de usuários.


### Como salvar como arquivo `README.md`:
1. Abra um editor de texto (como VS Code, Notepad++, ou qualquer outro).
2. Copie e cole o conteúdo acima.
3. Salve o arquivo com o nome `README.md` na raiz do seu projeto Flutter.

Pronto! Agora você tem um arquivo `README.md` completo para o seu projeto.
