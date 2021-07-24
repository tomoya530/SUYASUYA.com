class AddEvaluationToItem < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :evaluation, :float
  end
end
