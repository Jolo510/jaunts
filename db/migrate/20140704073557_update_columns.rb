class UpdateColumns < ActiveRecord::Migration
  def change
    change_table :trips do |t|
      t.change :user_id, :string 
    end
  end
end
