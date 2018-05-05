# README

Pasos para la correcta instalación:

* Ruby version
- La API utiliza el siguiente versionamiento:
-- Rails 5.0.7

* Configuration


* System dependencies
** Faker
** MySQL2
** yaml_db

* Database creation
- Esta API utiliza mysql2, para crear la base de datos en un entorno local,
- escriba en la terminal 
<rake db:create>

* Database initialization
- Para poblar la base de datos con data necesaria, 
- escriba en la terminal:
<rake db:seed>

- Para poblar la base de datos con data dummy,
- escriba en la terminal:
<rake user:fake_users>

<!-- * How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
 -->