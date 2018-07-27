require 'rails_helper'

describe 'A visitor' do
  describe 'visiting show trip page' do
    it 'sees a list of trails included in the trip with attributes' do
      trip = Trip.create(name: 'mountain', start_date: '02/03/2018', end_date: '04/05/2018')
      trail_1 = trip.trails.create(length: 2, name: 'high pic', address: '32 road')
      trail_2 = trip.trails.create(length: 4, name: 'low pic', address: '34 trail')

      visit trip_path(trip)

      expect(page).to have_content(trail_1.name)
      expect(page).to have_content(trail_1.address)
      expect(page).to have_content(trail_1.length)
      expect(page).to have_content(trail_2.name)
      expect(page).to have_content(trail_2.address)
      expect(page).to have_content(trail_2.length)
    end
  end
end

=begin
As a visitor,
when I visit a hiking trip's page,
I see a list of trails included in the trip,
I see the name, address, and length for each trail.
As a visitor,

when I visit a hiking trip's page,
I see the total hiking distance
of all trails on that hiking trip
=end
