# ChatApp

A chat application with Elixir, Phoenix and LiveView.

## Setup

### Without devcontainer

- Create `docker-compose.override.yml` at the root with this content:

```yml
version: "3.9"

services:
  app:
    ports:
      - 4000:4000
```

- Start the docker containers: `docker compose up -d`
- Go in the Elixir container: `docker compose exec app bash`
- Jump to section `Start Phoenix server`

### With devcontainer

- In VSCode, choose `Dev Containers: Reopen in Container`.
- Jump to section `Start Phoenix server`

## Start Phoenix server

- Run `mix setup` to install and setup dependencies
- In the terminal of the `app` container, start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Now you can visit `localhost:4000` from your browser.
