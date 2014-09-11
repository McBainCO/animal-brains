require 'csv'
require 'pp'



  def parse
    table = CSV.read('../lib/assets.Animals.csv', headers: true)
      table.map do |row|
        row.to_hash
      end
  end

  def create_seeds(animals)
    parsed_data = ''
    animals.each do |brain|
      seed = "Brain.create!(animal: '#{brain['animal']}', body: #{brain['body']}, brain: #{brain['brain']})\n\n"
      parsed_data << seed
    end
    parsed_data
  end

  def write(seed)
    File.open('../db/seeds.rb', 'w') do |file|
      file.write(seed)
    end
  end

  def create_seed_file
    hash = parse
    seed = generate_seeds(hash)
    write_seeds(seed)
  end

create_seed_file










































end