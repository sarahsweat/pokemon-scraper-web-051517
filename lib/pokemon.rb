require "pry"
class Pokemon

  attr_accessor :id, :name, :type, :db

  def initialize(hash)
    @name = hash[:name]
    @type = hash[:type]
    @db = hash[:db]
    @id = hash[:id]
  end

  def self.save(name,type,db)
    db.execute( "INSERT INTO pokemon ( name, type ) VALUES ( ?, ? )", [name, type])
  end

  def self.find(id,db)
    pokearray=db.execute("SELECT * FROM pokemon WHERE id = ?", id)[0]
    new_hash = {id: pokearray[0], name:  pokearray[1], type: pokearray[2], db: db}
    Pokemon.new(new_hash)
  end

end
