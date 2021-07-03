class Location < ActiveRecord::Base
  belongs_to :region
  has_many :people

  def self.ordered_by_name
    Location.all.order(:name)
  end
end
