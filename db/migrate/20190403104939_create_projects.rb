class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
    	t.string :name
    	t.string :description
    	t.string :client_name
    	t.string :technology_stack
    	t.string :project_type
    	t.timestamps
    end
  end
end
