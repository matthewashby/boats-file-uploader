class Model < ApplicationRecord
  def to_s
    name
  end

  def search_name
    name
  end
end
