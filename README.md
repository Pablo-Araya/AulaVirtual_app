# README

**Pasos para la correcta instalación**:

* Ruby version \
La API utiliza el siguiente versionamiento: \
Rails v.5.0.7

* Configuration\
Realiza un 'Fork' para descargar la API a tus repositorios \
Ejecuta el siguiente comando para instalar las dependencias anexas al proyecto \
`bundle install` \
`bundle update`

* System dependencies\
--> *Faker* \
--> *Factory-Helper* \
--> *MySQL2* \
--> *yaml_db* 

* Database creation \
Esta API utiliza mysql2, para crear la base de datos en un entorno local, escriba en la terminal \
`rake db:create`

* Database initialization \
Para poblar la base de datos con data necesaria, escriba en la terminal: \
`rake db:seed`

Para poblar la base de datos con data dummy, escriba en la terminal: \
`rake db:Fake_users`

<!-- * How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
 -->