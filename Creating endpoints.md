# Creating Rest endpoints

## Suppose we have a list of words

## To create our JSON APIs with out model, we need to use

```
mix phx.gen.json Directory Word words name:string description:text tag:string
```

The mix command just created a set of files including a controller and a migration file and some test files. Then Phoenix asks us to add this resource to our lib/.../router.ex and update the database with mix ecto.migrate:

```elixir
  scope "/api", FuransuliveWeb do
    pipe_through :api
    resources "/words", WordController, except: [:delete]
  end
```

Add some seeds in priv/repo/seeds.exs

```
alias Furansulive.Repo
alias Furansulive.Directory.Word

Repo.insert!(%Word{name: "Bonjour", description: "Bonjour bonjour", tag: "Facile, Présentation"})

```

Run the seeding command:
mix run priv/repo/seeds.exs

## Auth

mix phx.gen.json Accounts User users email:unique encrypted_password:string
