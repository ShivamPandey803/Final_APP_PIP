class AddDetailsToEvents < ActiveRecord::Migration[7.0]
  def change
    add_column :events, :public, :boolean
    add_column :events, :budget, :integer
    add_column :events, :guest_limit, :integer
    add_column :events, :invitation_message, :text
  end
end
