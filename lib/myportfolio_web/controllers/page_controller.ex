defmodule MyportfolioWeb.PageController do
  use MyportfolioWeb, :controller

  def home(conn, _params) do
    # The home page is often custom made,
    # so skip the default app layout.
    render(conn, :home, layout: false)
  end

  def about(conn, _params) do
    render(conn, :about)
    end

   def contact(conn, _params) do
     render(conn, :contact)
   end

   def projects(conn, _params) do
    render(conn, :projects)
   end
end
