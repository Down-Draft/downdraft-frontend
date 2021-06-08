require "rails_helper"

describe "MovieFacade" do
  it "returns an array popular movies", :vcr do
    facade = MovieFacade.popular_movies
    expect(facade).to be_an Array
    expect(facade.first).to be_a MovieInfo
  end

end
