class ChangeEncodingToUtf8 < ActiveRecord::Migration[7.0]
  def up
    execute "ALTER DATABASE `#{ActiveRecord::Base.connection.current_database}` CHARACTER SET utf8 COLLATE utf8_general_ci"
    
    tables = ActiveRecord::Base.connection.tables
    tables.each do |table|
      execute "ALTER TABLE `#{table}` CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci"
    end
  end

  def down
    execute "ALTER DATABASE `#{ActiveRecord::Base.connection.current_database}` CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci"
    
    tables = ActiveRecord::Base.connection.tables
    tables.each do |table|
      execute "ALTER TABLE `#{table}` CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci"
    end
  end
end