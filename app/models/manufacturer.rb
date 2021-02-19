class Manufacturer < ApplicationRecord
  def to_s
    self.name
  end

  def search_name
    name
  end
end
