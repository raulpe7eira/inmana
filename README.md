# InMana API

This repository is the code corresponding to the [nlw#5 - trilha elixir](https://nextlevelweek.com/) lab by Rafael Camarda.

> The project simulates an inventory management API that allows to register restaurants and supplies, view supplies, generate reports of expiring supplies and send them to the restaurant's email.

## Previous installations

**Database**, we recommends install [PostgreSQL](https://www.postgresql.org/) with [Docker](https://hub.docker.com/_/postgres). After that, sets connection configuration at:

- `config/dev.exs`
- `config/test.exs`

## Gets dependencies, setups database, tests, coverages, reports and starts application

```bash
cd inmana
mix deps.get
mix ecto.setup
mix test
mix test --cover
mix coveralls.html
mix phx.server
```

## How to use?

```bash
# welcomes (
#   replaces curly braces:
#     {name} : your name
#     {age} : your age
# )
curl -X GET 'http://localhost:4000/api?name={name}&age={age}'

# creates restaurant
curl -X POST 'http://localhost:4000/api/restaurants' \
-H 'Content-Type: application/json' \
-d '{
    "email": "ribs@puffup.com",
    "name": "Ribs Puff Up"
}'

# creates supply (
#   replaces curly braces:
#     {restaurant_id} : restaurant identifier
# )
curl -X POST 'http://localhost:4000/api/supplies' \
-H 'Content-Type: application/json' \
-d '{
    "description": "Tomato Sauce",
    "expiration_date": "2021-05-09",
    "responsible": "Raul",
    "restaurant_id": "{restaurant_id}"
}'

# retrieves supply by id (
#   replaces curly braces:
#     {id} : supply identifier
# )
curl -X GET 'http://localhost:4000/api/supplies/{id}'
```

## Background processing

An expiring supplies report is emailed every 10 seconds through the generic server ([`Scheduler`](./lib/inmana/supplies/scheduler.ex)).

> See in **development mode** the emails sent at: `http://localhost:4000/send_emails`.
