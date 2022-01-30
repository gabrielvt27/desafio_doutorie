# Desafio Doutor-IE

### Pastas:
  - Server
    - Contém a aplicação backend desenvolvida em NodeJS
  - Client
    - Contém a aplicação mobile desenvolvida em Flutter
    
### Como executar:
  1. Faça o download do projeto no GitHub
  2. Inicie o Server:
    	- Abra a pasta **server** pelo terminal e execute o seguinte comando para baixar todas as depedências do projeto:
      
      ```console
      npm install
      ```
      
      - Em seguida inicie o server executando:
      
       ```console
      node app.js
      ```
      
      - Por padrão o servidor estará rodando na porta 3000
      
  3. Inicie o aplicativo:
     - Abra a pasta **client** pelo terminal e execute o seguinte comando para baixar todas as depedências do projeto:
     
     ```console
      flutter pub get
      ```
      
     - Em seguida abra o projeto no VS Code ou Android Studio e builde a aplicação
     - **ATENÇÃO:** Caso deseje buildar a aplicação em  um dispositivo físico, se atente em alterar a URL para o servidor no arquivo src/constants.dart
