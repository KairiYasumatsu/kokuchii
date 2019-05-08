class AddProfileToCompanies < ActiveRecord::Migration[5.1]
  def change
    add_column :companies, :profile, :text
  end
end
