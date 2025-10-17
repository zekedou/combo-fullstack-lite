# MyApp

A project template using:

- Elixir, Combo, Ecto, PostgreSQL.
- Node.js, TypeScript, pnpm, Vite, Inertia, React, TailwindCSS.

## Quick start

### Setup environments

```
$ mix setup
```

### Run dev server

```
$ iex -S mix combo.serve
```

Now you can visit `http://localhost:4000` from web browser.

### Build the release

```
$ mix deps.get --only prod
$ mix assets.deploy
$ MIX_ENV=prod mix release
```

Here are some useful release commands you can run:

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

See [Mix.Tasks.Release](https://hexdocs.pm/mix/Mix.Tasks.Release.html) for more information about Elixir releases.

### Run the release in production

> No deployment tools are used here. Only essential setup and steps are covered.

```
$ export SECRET_KEY_BASE=<a very long secret>
$ export DB_URL=ecto://postgres:postgres@127.0.0.1/my_app
$ export NODE_ENV=production
$ _build/prod/rel/my_app/bin/migrate
$ _build/prod/rel/my_app/bin/serve
```

## License

MIT
