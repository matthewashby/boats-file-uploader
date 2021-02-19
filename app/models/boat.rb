class Boat < ApplicationRecord
  belongs_to :manufacturer
  belongs_to :model

  default_scope -> { includes(:model, :manufacturer) }

  def display_description
    [manufacturer.name, model.name, year, ref_id].select(&:present?).join(' - ')
  end
end
