class CreateTodos < ActiveRecord::Migration[5.2]
  def change
    create_table :todos do |t|
      t.string :task
      t.string :description
      t.string :acceptance_criteria
      t.string :status
      t.string :priority
    	t.belongs_to :project, index: true
      t.belongs_to :user, index: true
      t.timestamps
    end
  end
end
