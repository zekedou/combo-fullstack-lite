defmodule MyApp.Web.ConnCase do
  @moduledoc """
  This module defines the test case to be used by tests that require setting
  up a connection.

  Such tests rely on `Combo.ConnTest` and also import other functionality to
  make it easier to build common data structures and query the data layer.

  Finally, if the test case interacts with the database, we enable the SQL
  sandbox, so changes done to the database are reverted at the end of every test.
  Because we are using PostgreSQL, we can even run database tests asynchronously
  by setting `use MyApp.Core.DataCase, async: true`.
  """

  use ExUnit.CaseTemplate

  using do
    quote do
      # The default endpoint for testing
      @endpoint MyApp.Web.Endpoint

      use MyApp.Web, :verified_routes

      # Import conveniences for testing with connections
      import Plug.Conn
      import Combo.ConnTest
      import MyApp.Web.ConnCase
    end
  end

  setup tags do
    MyApp.Core.DataCase.setup_sandbox(tags)
    {:ok, conn: Combo.ConnTest.build_conn()}
  end
end
