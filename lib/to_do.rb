class Task
  @@all_tasks = []

  def initialize(description)
    @description = description
  end

  def description
    @description
  end

  def self.all
    @@all_tasks.description
  end

  def save
    @@all_tasks.push(self)
  end

  def self.clear
    @@all_tasks = []
  end
 end
