require 'securerandom'

module Volunteer
  def self.all
    DB.exec("SELECT * FROM volunteers;").to_a
  end

  def self.save(name)
    id = SecureRandom.uuid
    DB.exec("INSERT INTO volunteers (id, name) VALUES ('#{id}','#{name}') RETURNING id;")[0]['id']
  end

  def self.find(id)
    DB.exec("SELECT * FROM volunteers WHERE id = '#{id}';")[0]
  end

  def self.edit(id, name)
    DB.exec("UPDATE volunteers SET name = '#{name}' WHERE id = '#{id}';")
  end

  def self.delete(id)
    DB.exec("DELETE FROM volunteers WHERE id = '#{id}';")
  end
end
