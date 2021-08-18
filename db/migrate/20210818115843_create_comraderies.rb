class CreateComraderies < ActiveRecord::Migration[6.1]
  def change
    create_table :comraderies do |t|
      t.references :user, null: false, foreign_key: true

      # self referencing relation, the comrade will be another user, from the User table,
      # and we need to reference the user.id as a foreign key
      t.references :comrade,references: :users, foreign_key: {to_table: :users}
      t.timestamps
    end
  end
end
