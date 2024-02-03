## Additional info

- `info/TODO.md` - Functional spec

## Development environment setup

Requirements: podman v. 4.4.1 +, podman-compose
Clone project, in project folder run

```sh
podman-compose up --build-arg USERNAME=$(id -un) --build-arg GROUPNAME=$(id -gn) --build-arg USERID=$(id -u) --build-arg GROUPID=$(id -g)
```

Request examples:
```sh
curl --request GET localhost:3000/quotes/2
curl -s -v --header "Content-Type: application/json" --request POST localhost:3000/quotes --data '{"author":"Cat the Poo", "content":"Meau"}' | grep '^< Content-Type' 
curl -s -v --header "Content-Type: application/json" --request PUT localhost:3000/quotes/25 --data '{"author":"Cat the Poo", "content":"Meow-Meaw"}' | grep '^< Content-Type'
curl -s -v --request DELETE localhost:3000/quotes/5 | grep '^< Content-Type'
```

Just for myself:
```sh
podman exec quotes_web_1 bin/rails g migration CreateQuotes content author
podman exec quotes_web_1 bin/rails db:migrate
podman exec quotes_web_1 bin/rails db:seed
```
