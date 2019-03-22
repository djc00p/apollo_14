require 'rails_helper'

RSpec.describe "As a visitor" do
  before :each do
    @astronaut_1 = Astronaut.create(name: "Neil Armstrong", age: 37, job: "Commander")
    @mission_3 = Astronaut.missions.create(title: "Apollo 13")
    @mission_2 = Astronaut.missions.create(title: "Capricorn 4")
    @mission_1 = Astronaut.missions.create(title: "Gemini 7")
  end
  it "show a list of astronaut" do
    visit astronauts_path

    expect(page).to have_content("Name: #{@astronaut_1.name}")
    expect(page).to have_content("Age: #{@astronaut_1.age}")
    expect(page).to have_content("Job: #{@astronaut_1.job}")
  end

  it "a list of the space missions' in alphabetical order for each astronaut" do
    visit astronauts_path
    binding.pry
    expect(page).to have_content("Missions: Apollo 13, Capricorn 4, Gemini 7")
  end
end
