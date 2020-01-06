defmodule Demo13.Meetups.Meetup do
  use Ecto.Schema

  schema "meetups_meetups" do
    field :date, :date
    field :description, :string
    field :location, :string
    field :title, :string

    timestamps()
  end
end
