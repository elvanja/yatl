class AddTasksAndUsersRelationForeignKey < ActiveRecord::Migration
  def up
    execute <<-SQL
      ALTER TABLE tasks
      ADD CONSTRAINT fk_tasks_users
      FOREIGN KEY (user_id)
      REFERENCES users(id)
    SQL
  end

  def down
    execute <<-SQL
      ALTER TABLE tasks
      DROP FOREIGN KEY fk_tasks_users
    SQL
  end
end
