require 'rails_helper'

describe 'a visitor' do
  describe 'visits trail show page' do
    it 'sees all attributes of trails and all trip that includes trail' do
      trail = Trail.create(length: 2, name: 'high pic', address: '32 road')
      trip = trail.trips.create(name: 'mountain', start_date: '02/03/2018', end_date: '04/05/2018')
      trip2 = trail.trips.create(name: 'lake', start_date: '02/04/2018', end_date: '04/06/2018')

      visit trail_path(trail)

      expect(page).to have_content(trail.length)
      expect(page).to have_content(trail.name)
      expect(page).to have_content(trail.address)
      expect(page).to have_content(trip.name)
      expect(page).to have_content(trip2.name)




    end
  end

end
=begin
As a visitor,
when I visit a trail's page,
I see the name, address, and total length of
every hiking trip that includes this trail

As a visitor,

when I visit a trail's page,
I see the total number of hiking trips where this trail
was included
=end
