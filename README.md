# README

**Pasos para la correcta instalación**:

* Ruby version \
La API utiliza el siguiente versionamiento: \
Rails v.5.0.7

* Configuration\
Realiza un 'Fork' para descargar la API a tus repositorios \
Ejecuta el siguiente comando para instalar las dependencias anexas al proyecto \
`bundle install`

* System dependencies\
--> *Faker* \
--> *MySQL2* \
--> *yaml_db* \
--> *validates*\
--> *bcrypt*\


* Database creation \
Esta API utiliza mysql2, para crear la base de datos en un entorno local, escriba en la terminal \
`rake db:create` \
`rake db:migrate` \

* Database initialization \
Para poblar la base de datos con data necesaria, escriba en la terminal: \
`rake db:seed` \
\
Para poblar la base de datos con data dummy, escriba en la terminal: \
`rake db:Fake_users` \
Esto poblará con datos en la tabla de usuarios y en las tablas de estudiantes (students) y profesores (teachers), con sus respectivas llaves foraneas (FK). \
\
Las rutas para la API son: 
<pre>
<b>Verb   URI Pattern                                                                                       Controller#Action</b>

GET    /api/v1/users/:user_id/cursos(.:format)                                                           api/v1/cursos#index
POST   /api/v1/users/:user_id/cursos(.:format)                                                           api/v1/cursos#create
DELETE /api/v1/users/:user_id/cursos/:id(.:format)                                                       api/v1/cursos#destroy

GET    /api/v1/users(.:format)                                                                           api/v1/users#index
POST   /api/v1/users(.:format)                                                                           api/v1/users#create
GET    /api/v1/users/:id(.:format)                                                                       api/v1/users#show
PATCH  /api/v1/users/:id(.:format)                                                                       api/v1/users#update
PUT    /api/v1/users/:id(.:format)                                                                       api/v1/users#update
DELETE /api/v1/users/:id(.:format)                                                                       api/v1/users#destroy

GET    /api/v1/categories/:category_id/catedras/:catedra_id/catedra_surveys(.:format)                    api/v1/catedra_surveys#index
POST   /api/v1/categories/:category_id/catedras/:catedra_id/catedra_surveys(.:format)                    api/v1/catedra_surveys#create
GET    /api/v1/categories/:category_id/catedras/:catedra_id/catedra_surveys/:id(.:format)                api/v1/catedra_surveys#show
PATCH  /api/v1/categories/:category_id/catedras/:catedra_id/catedra_surveys/:id(.:format)                api/v1/catedra_surveys#update
PUT    /api/v1/categories/:category_id/catedras/:catedra_id/catedra_surveys/:id(.:format)                api/v1/catedra_surveys#update
DELETE /api/v1/categories/:category_id/catedras/:catedra_id/catedra_surveys/:id(.:format)                api/v1/catedra_surveys#destroy
GET    /api/v1/categories/:category_id/catedras/:catedra_id/avg(.:format)                                api/v1/catedra_surveys#avg

GET    /api/v1/categories/:category_id/catedras/:catedra_id/clases/:clase_id/notifications(.:format)     api/v1/notifications#index
POST   /api/v1/categories/:category_id/catedras/:catedra_id/clases/:clase_id/notifications(.:format)     api/v1/notifications#create
GET    /api/v1/categories/:category_id/catedras/:catedra_id/clases/:clase_id/notifications/:id(.:format) api/v1/notifications#show
PATCH  /api/v1/categories/:category_id/catedras/:catedra_id/clases/:clase_id/notifications/:id(.:format) api/v1/notifications#update
PUT    /api/v1/categories/:category_id/catedras/:catedra_id/clases/:clase_id/notifications/:id(.:format) api/v1/notifications#update
DELETE /api/v1/categories/:category_id/catedras/:catedra_id/clases/:clase_id/notifications/:id(.:format) api/v1/notifications#destroy

GET    /api/v1/categories/:category_id/catedras/:catedra_id/clases(.:format)                             api/v1/clases#index
POST   /api/v1/categories/:category_id/catedras/:catedra_id/clases(.:format)                             api/v1/clases#create
GET    /api/v1/categories/:category_id/catedras/:catedra_id/clases/:id(.:format)                         api/v1/clases#show
PATCH  /api/v1/categories/:category_id/catedras/:catedra_id/clases/:id(.:format)                         api/v1/clases#update
PUT    /api/v1/categories/:category_id/catedras/:catedra_id/clases/:id(.:format)                         api/v1/clases#update
DELETE /api/v1/categories/:category_id/catedras/:catedra_id/clases/:id(.:format)                         api/v1/clases#destroy

GET    /api/v1/categories/:category_id/catedras(.:format)                                                api/v1/catedras#index
POST   /api/v1/categories/:category_id/catedras(.:format)                                                api/v1/catedras#create
GET    /api/v1/categories/:category_id/catedras/:id(.:format)                                            api/v1/catedras#show
PATCH  /api/v1/categories/:category_id/catedras/:id(.:format)                                            api/v1/catedras#update
PUT    /api/v1/categories/:category_id/catedras/:id(.:format)                                            api/v1/catedras#update
DELETE /api/v1/categories/:category_id/catedras/:id(.:format)                                            api/v1/catedras#destroy

GET    /api/v1/categories(.:format)                                                                      api/v1/categories#index
POST   /api/v1/categories(.:format)                                                                      api/v1/categories#create
GET    /api/v1/categories/:id(.:format)                                                                  api/v1/categories#show
PATCH  /api/v1/categories/:id(.:format)                                                                  api/v1/categories#update
PUT    /api/v1/categories/:id(.:format)                                                                  api/v1/categories#update
DELETE /api/v1/categories/:id(.:format)                                                                  api/v1/categories#destroy
</pre>
<!-- * How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
 -->