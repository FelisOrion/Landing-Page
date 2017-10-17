defmodule LandingWeb.PageController do
  use LandingWeb, :controller

  alias Landing.Contact
  alias Landing.Subscribe
  alias Landing.Repo

  def index(conn, params) do
    changeset = Contact.changeset(%Contact{}, params)
    render conn, "index.html", changeset: changeset
  end

  def create(conn, %{"subscribe" => params}) do
    with {:ok, changeset} <- check_changeset(params) do
      render conn, "thankyou.html"
    else
      {:error, changeset} -> render(conn, "index.html", changeset: changeset)
    end
  end

  def create(conn, %{"button" => "Subscribe!", "subscribe" => params}) do
    with {:ok, changeset} <- check_changeset(params) do
      # changeset = Contact.changeset(%Contact{}, params)
      render conn, "thankyou.html"
    else
      {:error, changeset} -> render(conn, "index.html", changeset: changeset)
    end
  end

  def create(conn, %{ "contact" => params}) do
    with {:ok, changeset} <- check_changeset(params) do
      render conn, "thankyou.html"
    else
      {:error, changeset} -> render(conn, "index.html", changeset: changeset)
    end
  end

  defp check_changeset(params) do
    params
    |> Map.values()
    |> length
    |> case do
      1 -> Subscribe.changeset(%Subscribe{}, params)
           |> Repo.insert
      _ -> Contact.changeset(%Contact{}, params)
           |> Repo.insert
    end
  end
end
