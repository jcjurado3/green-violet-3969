require "rails_helper"

RSpec.describe "Airline's Show Page" do
  let!(:airline1) { Airline.create!(name: "American Airlines")}
  let!(:airline2) { Airline.create!(name: "Jetblue")}

  let!(:aaflight1) { airline1.flights.create!(number: "1727", date: "08/03/20", departure_city: "Denver", arrival_city: "Miami")}
  let!(:jbflight2) { airline2.flights.create!(number: "1739", date: "08/04/20", departure_city: "Denver", arrival_city: "Ft. Lauderdale")}
  let!(:aaflight3) { airline1.flights.create!(number: "1643", date: "08/05/20", departure_city: "Denver", arrival_city: "Reno")}

  let!(:aapassenger1) { Passenger.create!(name: "Joe", age: 42)}
  let!(:aapassenger2) { Passenger.create!(name: "Jane", age: 29)}
  let!(:aapassenger3) { Passenger.create!(name: "John", age: 18)}
  let!(:aapassenger4) { Passenger.create!(name: "James", age: 65)}
  let!(:aapassenger5) { Passenger.create!(name: "Jake", age: 32)}
  let!(:aapassenger6) { Passenger.create!(name: "Chris", age: 32)}
  let!(:aapassenger7) { Passenger.create!(name: "Kyle", age: 32)}
  let!(:aapassenger8) { Passenger.create!(name: "Craig", age: 32)}
  let!(:aapassenger9) { Passenger.create!(name: "Alex", age: 12)}
  let!(:aapassenger10) { Passenger.create!(name: "Troy", age: 32)}
  let!(:aapassenger11) { Passenger.create!(name: "Owen", age: 2)}


  let!(:aa1_pass1) { FlightPassenger.create!(passenger_id: aapassenger1.id, flight_id: aaflight1.id)}
  let!(:aa1_pass2) { FlightPassenger.create!(passenger_id: aapassenger2.id, flight_id: aaflight1.id)}
  let!(:aa1_pass3) { FlightPassenger.create!(passenger_id: aapassenger3.id, flight_id: aaflight1.id)}
  let!(:aa1_pass4) { FlightPassenger.create!(passenger_id: aapassenger4.id, flight_id: aaflight1.id)}

  let!(:jb1_pass4) { FlightPassenger.create!(passenger_id: aapassenger4.id, flight_id: jbflight2.id)}
  let!(:aa2_pass5) { FlightPassenger.create!(passenger_id: aapassenger5.id, flight_id: jbflight2.id)}
  let!(:aa2_pass6) { FlightPassenger.create!(passenger_id: aapassenger6.id, flight_id: jbflight2.id)}
  let!(:aa2_pass7) { FlightPassenger.create!(passenger_id: aapassenger7.id, flight_id: jbflight2.id)}
  let!(:aa2_pass8) { FlightPassenger.create!(passenger_id: aapassenger8.id, flight_id: jbflight2.id)}

  let!(:aa3_pass9) { FlightPassenger.create!(passenger_id: aapassenger9.id, flight_id: aaflight3.id)}
  let!(:aa3_pass10) { FlightPassenger.create!(passenger_id: aapassenger10.id, flight_id: aaflight3.id)}
  let!(:aa3_pass11) { FlightPassenger.create!(passenger_id: aapassenger10.id, flight_id: aaflight3.id)}
  let!(:aa3_pass12) { FlightPassenger.create!(passenger_id: aapassenger11.id, flight_id: aaflight3.id)}


  describe "Airline's Passenger" do
    it "displays list of passengers that have flights on that airline" do
      visit airline_path(airline1)

      within("#airline-passengers") do
        expect(page).to have_content(aapassenger1.name)
        expect(page).to have_content(aapassenger2.name)
        expect(page).to have_content(aapassenger3.name)
        expect(page).to have_content(aapassenger4.name)
      end
    end

    it "displays unique list of passengers and adult passengers only" do
      visit airline_path(airline1)

      within("#airline-passengers") do
        expect(page).to have_content(aapassenger10.name, count: 1)
        expect(page).to_not have_content(aapassenger10.name, count: 3)
        expect(page).to_not have_content(aapassenger9.name)
        expect(page).to_not have_content(aapassenger11.name)
      end
    end
  end
end