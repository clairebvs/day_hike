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
    it 'sees total hiking distance for all trails of the trip' do
      trip = Trip.create(name: 'mountain', start_date: '02/03/2018', end_date: '04/05/2018')
      trail_1 = trip.trails.create(length: 2, name: 'high pic', address: '32 road')
      trail_2 = trip.trails.create(length: 4, name: 'low pic', address: '34 trail')

      visit trip_path(trip)

      expected_result = 6
      expect(page).to have_content(expected_result)
    end

    it 'sees average trip distance of all trails ' do
      trip = Trip.create(name: 'mountain', start_date: '02/03/2018', end_date: '04/05/2018')
      trail_1 = trip.trails.create(length: 2, name: 'high pic', address: '32 road')
      trail_2 = trip.trails.create(length: 4, name: 'low pic', address: '34 trail')

      visit trip_path(trip)
      expected_result = 3

      expect(page).to have_content("Average distance : #{expected_result}")
    end
    it 'sees longest trip distance of all trails ' do
      trip = Trip.create(name: 'mountain', start_date: '02/03/2018', end_date: '04/05/2018')
      trail_1 = trip.trails.create(length: 2, name: 'high pic', address: '32 road')
      trail_2 = trip.trails.create(length: 4, name: 'low pic', address: '34 trail')

      visit trip_path(trip)
      expected_result = trail_2.length

      expect(page).to have_content("Longest distance : #{expected_result}")
    end
    it 'sees shortest trip distance of all trails ' do
      trip = Trip.create(name: 'mountain', start_date: '02/03/2018', end_date: '04/05/2018')
      trail_1 = trip.trails.create(length: 2, name: 'high pic', address: '32 road')
      trail_2 = trip.trails.create(length: 4, name: 'low pic', address: '34 trail')

      visit trip_path(trip)
      expected_result = trail_1.length

      expect(page).to have_content("Shortest distance : #{expected_result}")
    end

    it 'can click on the name of a trail
    to see a show page for that specific trail' do
    trip = Trip.create(name: 'mountain', start_date: '02/03/2018', end_date: '04/05/2018')
    trail_1 = trip.trails.create(length: 2, name: 'high pic', address: '32 road')
    trail_2 = trip.trails.create(length: 4, name: 'low pic', address: '34 trail')

    visit trip_path(trip)

    expect(page).to have_content(trail_1.name)
    expect(page).to have_content(trail_2.name)

    within "#trail-#{trail_1.id}" do
      click_link "#{trail_1.name}"
      expect(current_path).to eq(trail_path(trail_1))
    end
  end
end
end 


=begin

=end
