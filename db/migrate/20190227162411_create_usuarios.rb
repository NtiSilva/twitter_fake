class CreateUsuarios < ActiveRecord::Migration[5.2]
  def change
    create_table :usuarios do |t|
      t.string :nome
      t.string :email
      t.string :password
      t.string :password_confirmation

      t.timestamps
    end
  end
end
