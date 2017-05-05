require 'securerandom'

module Project
  def self.all
    DB.exec("SELECT * FROM projects;").to_a
  end

  def self.save(name, description)
    id = SecureRandom.uuid
    DB.exec("INSERT INTO projects (id, name, description) VALUES ('#{id}','#{name}','#{description}') RETURNING id;")[0]['id']
  end

  def self.find(id)
    DB.exec("SELECT * FROM projects WHERE id = '#{id}';")[0]
  end

  def self.edit(id, name, description)
    DB.exec("UPDATE projects SET name = '#{name}', description = '#{description}' WHERE id = '#{id}';")
  end

  def self.delete(id)
    DB.exec("DELETE FROM projects WHERE id = '#{id}';")
  end
end
