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
    stuff = DB.exec("SELECT * FROM projects WHERE id = '#{id}';")[0]
  end
end
