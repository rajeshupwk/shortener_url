class AddHitColumnToUrl < ActiveRecord::Migration[5.2]
  def change
    add_column :urls, :hit, :integer, default: 0
  end
end
