module Project
  def self.all
    DB.exec("SELECT * FROM projects").to_a
  end
end
