class Person < ActiveRecord::Base
  belongs_to :location
  belongs_to :role
  belongs_to :manager, class_name: "Person", foreign_key: :manager_id
  has_many :employees, class_name: "Person", foreign_key: :manager_id

  def self.order_by_location_name
    joins(:location).order('locations.name')
  end

  def self.manager_ids
    joins(:manager).select(:manager_id).distinct
  end

  def self.with_employees
    where(id: Person.manager_ids)
  end

  def self.with_employees_order_by_location_name
    from(Person.with_employees, :people).joins(:location).merge(Location.ordered_by_name)
  end
end
