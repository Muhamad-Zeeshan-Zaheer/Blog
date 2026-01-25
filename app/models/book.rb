class Book < ApplicationRecord
  before_create :message
  after_create :log_creation
  private
  def log_creation
    puts "new book created"
  end

  def message
    puts "creating a new book"
  end
end
