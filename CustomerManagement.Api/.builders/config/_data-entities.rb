puts "_DATA_ENTITIES"

def sample_dsl
  # supported cardinalities: :one_one, :one_many, :many_one
  <<~RUBY
  entities = KBuilder::EntityBuilder
    .init
    .entity(:customer)
      .id(:customer_id, type: :string)
      .column(:name)
      .column(:address)
      .column(:postal_code)
      .column(:city)
      .column(:telephone_number)
      .column(:email_address)
  
  RUBY
end

def raw_entities
  return @raw_entities if defined? @raw_entities
  @raw_entities = [
    { 
      name: :customer,
      columns: [{
        name: :customer_id,
        type: :string
      },
      {
        name: :name,
        type: :string
      },
      {
        name: :address,
        type: :string
      },
      {
        name: :postal_code,
        type: :string
      },
      {
        name: :city,
        type: :string
      },
      {
        name: :telephone_number,
        type: :string
      },
      {
        name: :email_address,
        type: :string
      }]
    }
  ]
end