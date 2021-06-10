class Beer
  attr_reader :id,
              :name,
              :description,
              :abv,
              :style
  
  def initialize(data)
    @id = data[:id]
    @name = data[:attributes][:name]
    @description = data[:attributes][:description]
    @abv = data[:attributes][:abv].round(1)
    @style = data[:attributes][:style]
  end
end
