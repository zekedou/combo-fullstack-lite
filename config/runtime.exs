# This file is executed for all environments, including during releases.
#
# It is executed after compilation and before the system starts, so it is
# typically used to load production configuration and secrets from environment
# variables or elsewhere. Do not define any compile-time configuration in here,
# as it won't be applied.

import Config

if config_env() == :prod do
  db_url =
    SystemEnv.fetch_env!("DB_URL",
      message: "Set it to something like: ecto://USER:PASS@HOST/DATABASE"
    )

  db_pool_size = SystemEnv.get_env("DB_POOL_SIZE", :integer) || 10

  config :my_app, MyApp.Core.Repo,
    url: db_url,
    pool_size: db_pool_size
end

base_url = SystemEnv.get_env("BASE_URL") || "http://localhost:4000"
assets_base_url = SystemEnv.get_env("ASSETS_BASE_URL") || nil

parse_url = fn
  nil ->
    nil

  url ->
    %URI{scheme: scheme, host: host, port: port} = URI.parse(url)
    [scheme: scheme, host: host, port: port]
end

parsed_base_url = parse_url.(base_url)
parsed_assets_base_url = parse_url.(assets_base_url)

derived_host = Keyword.fetch!(parsed_base_url, :host)
derived_port = Keyword.fetch!(parsed_base_url, :port)

listen_ip =
  cond do
    derived_host in ["127.0.0.1", "localhost"] ->
      {127, 0, 0, 1}

    env = SystemEnv.get_env("LISTEN_IP") ->
      {:ok, ip} = env |> to_charlist() |> :inet.parse_address()
      ip

    true ->
      {0, 0, 0, 0}
  end

listen_port =
  if custom_port = SystemEnv.get_env("LISTEN_PORT", :integer),
    do: custom_port,
    else: derived_port

origins = [base_url]

config :my_app, MyApp.Web.Endpoint,
  url: parsed_base_url,
  static_url: parsed_assets_base_url,
  http: [
    ip: listen_ip,
    port: listen_port
  ]

case config_env() do
  :prod ->
    secret_key_base =
      SystemEnv.fetch_env!("SECRET_KEY_BASE",
        message: "Generate one by calling: mix combo.gen.secret"
      )

    config :my_app, MyApp.Web.Endpoint,
      secret_key_base: secret_key_base,
      check_origin: origins

  _ ->
    :skip
end

if SystemEnv.get_env("RELEASE_NAME") do
  config :my_app, MyApp.Web.Endpoint, server: true
end
