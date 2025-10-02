# MyApp

A Combo project using:

- Vite, TailwindCSS
- PostgreSQL

## Requirements

- Elixir
- Node.js

## Quick start

### Setup environments

```
$ mix setup
```

### Run dev server

```
$ iex -S mix combo.serve
```

Now you can visit [`localhost:4000`](http://localhost:4000) from web browser.

### Build release

```
$ mix deps.get --only prod
$ mix assets.deploy
$ MIX_ENV=prod mix release
```

Here are some useful release commands you can run in any release environment:

```
# To start your system with the Combo server running
$ _build/prod/rel/my_app/bin/serve

# To run migrations
$ _build/prod/rel/my_app/bin/migrate

# Connect to the release remotely, once it is running:
$ _build/prod/rel/my_app/bin/my_app remote

# To list all available commands
$ _build/prod/rel/my_app/bin/demo
```

See https://hexdocs.pm/mix/Mix.Tasks.Release.html for more information about Elixir releases.

## Deployment

Ready to run in production? Please [check out deployment guides](https://hexdocs.pm/combo/deployment.html).
