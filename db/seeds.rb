# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
clients = Client.create(
  [
    { key: 1, name: 'Cliente 1' },
    { key: 2, name: 'Cliente 2' }
  ]
)
services = Service.create(
  [
    { name: 'Serviço 1', value: 10 },
    { name: 'Serviço 2', value: 20 }
  ]
)
service_orders = ServiceOrder.create(
  [
    {
      client: clients.find { |i| i.key == 1 },
      service: services.find { |i| i.name.include?('Serviço 1') }
    },
    {
      client: clients.find { |i| i.key == 2 },
      service: services.find { |i| i.name.include?('Serviço 2') }
    }
  ]
)
