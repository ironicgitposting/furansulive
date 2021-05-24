defmodule Furansulive.Repo.Migrations.CreateWords do
  use Ecto.Migration

  def change do
    create table(:words) do
      add :word, :string
      add :phonectic, :string
      add :context, :string
      add :definition, :string
      add :example, :string
      add :audio, :string
      add :part_of_speech, :string
      add :frequency, :integer
      add :main_lexicon, :string
      add :level, :string
      timestamps()
    end

  end
end
