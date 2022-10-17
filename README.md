# auth
```sh
Authentication service
```
## Dependencies:
```sh
ruby '2.7.2'
```
## Requests:
```sh
#ping request:
curl --request GET \
  --url http://localhost:3003/auth/ping
```
```sh
#ping response:
PONG
```
##
```sh
#login request:
curl --request POST \
  --url http://localhost:3003/auth/login \
  --header 'Content-Type: application/json' \
  --data '{
	"email": "new_ivan@gmail.com",
	"password": "123342"
}'
```
```sh
#login response:
{ "meta": { "token": "0a72150e-01c6-4400-ac14-5838fc056938" } }
```
##
```sh
#signup request:
curl --request POST \
  --url http://localhost:3003/auth/signup \
  --header 'Content-Type: application/json' \
  --data '{
	"email": "new_ivanov@mail.com",
	"password": "123342",
	"name": "name."
}'
```
```sh
#signup response:
{ "errors": [{ "detail": "Ошибка в параметре запроса" }] }
```