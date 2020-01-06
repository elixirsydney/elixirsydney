defmodule Demo13.Repo.Migrations.CreateDemo13.Meetups.Meetup do
  use Ecto.Migration

  def change do
    create table(:meetups_meetups) do
      add :title, :string
      add :description, :string
      add :date, :date
      add :location, :string

      timestamps()
    end

  end
end
