require 'rails_helper'

describe 'A visitor' do
  describe 'visiting index trip page' do
    it 'sees all hiking trips with names and can click on it to visit show page' do
      trip_1 = Trip.create(name: 'mountain', start_date: '02/03/2018', end_date: '04/05/2018')
      trip_2 = Trip.create(name: 'mountain', start_date: '02/03/2018', end_date: '04/05/2018')

      visit trips_path

      expect(page).to have_content(trip_1.name)
      expect(page).to have_content(trip_2.name)

      within "#trip-#{trip_1.id}" do
        click_link "#{trip_1.name}"
        expect(current_path).to eq(trip_path(trip_1))
      end
    end
  end
end
