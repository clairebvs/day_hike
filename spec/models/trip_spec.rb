require 'rails_helper'

describe Trip, type: :model do
  describe 'instance methods' do
    it 'can calculate total distance of trails from a trip' do
      trip = Trip.create(name: 'mountain', start_date: '02/03/2018', end_date: '04/05/2018')
      trail_1 = trip.trails.create(length: 2, name: 'high pic', address: '32 road')
      trail_2 = trip.trails.create(length: 4, name: 'low pic', address: '34 trail')

      expected_result = 6

      expect(trip.total_distance).to eq(expected_result)
    end
    it 'can calculate average trip distance of trails' do
      trip = Trip.create(name: 'mountain', start_date: '02/03/2018', end_date: '04/05/2018')
      trail_1 = trip.trails.create(length: 2, name: 'high pic', address: '32 road')
      trail_2 = trip.trails.create(length: 4, name: 'low pic', address: '34 trail')

      expected_result = 3

      expect(trip.average_distance).to eq(expected_result)
    end
    it 'can find longest trip distance of trails' do
      trip = Trip.create(name: 'mountain', start_date: '02/03/2018', end_date: '04/05/2018')
      trail_1 = trip.trails.create(length: 2, name: 'high pic', address: '32 road')
      trail_2 = trip.trails.create(length: 4, name: 'low pic', address: '34 trail')

      expected_result = trail_2.length

      expect(trip.longest_distance).to eq(expected_result)
    end
    it 'can find shortest trip distance of trails' do
      trip = Trip.create(name: 'mountain', start_date: '02/03/2018', end_date: '04/05/2018')
      trail_1 = trip.trails.create(length: 2, name: 'high pic', address: '32 road')
      trail_2 = trip.trails.create(length: 4, name: 'low pic', address: '34 trail')

      expected_result = trail_1.length

      expect(trip.shortest_distance).to eq(expected_result)
    end
  end
 end
