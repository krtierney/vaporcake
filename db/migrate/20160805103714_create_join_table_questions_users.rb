class CreateJoinTableQuestionsUsers < ActiveRecord::Migration[5.0]
  def change
    create_join_table :questions, :users do |t|

    end
  end
end
