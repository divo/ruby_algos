require 'securerandom'

# Schema should look like
# {
#   a: Integer,
#   b: String
# }

class ObjectDefinition
  attr_reader :id, :name, :schema

  def initialize(name:, schema:)
    @id = SecureRandom.uuid
    @name = name
    @schema = schema
  end

  def validate(data)
    Set.new(data.keys).subset?(Set.new(schema.keys)) &&
      data.map { |k, v| v.is_a?(schema[k]) }.all?(true)
  end

  def append_field(name:, type:)
    raise if @schame[:name]

    @schema.merge!({ name => type })
  end
end

class ObjectInstance
  attr_reader :id, :definition, :data

  def initialize(definition:, data:)
    raise 'Invalid Data' unless definition.validate(data)

    @id = SecureRandom.uuid
    @definition = definition
    @data = data
  end
end

# One to many
class Relationship
  attr_reader :parent_def, :child_def

  def initialize(parent_def:, child_def:)
    @parent_def = parent_def
    @child_def = child_def
  end

  # This isn't great tbh, not ready to share
  def parent(parent_instance)
    raise 'Invalid data' unless parent_instance.definition== @parent_def

    @parent_instance = parent_instance
    self
  end
end

make = ObjectDefinition.new(name: 'make', schema: { name: String })
car = ObjectDefinition.new(name: 'car', schema: { name: String, type: String, automatic: Integer, make: Relationship })

car_make = Relationship.new(parent_def: make, child_def: car)
# We could also use the Definition as a sort of factory

ford = ObjectInstance.new(definition: make, data: { name: 'Ford' })
ranger = ObjectInstance.new(definition: car, data: { name: 'Ranger', type: 'Pickup', automatic: 1, make: car_make.parent(ford) })
require 'byebug'; byebug;

begin
  invalid = ObjectInstance.new(definition: car, data: { name: 'Honda', wheels: 2 })
rescue => e
  puts 'Invalid data'
end


