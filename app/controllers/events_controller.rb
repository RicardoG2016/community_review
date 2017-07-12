class EventsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    params = { category: '34',
    city: 'Austin',
    zip: '78748',
    status: 'upcoming',
    format: 'json',
    topic: 'ruby-on-rails',
    page: '25'}
    meetup_api = MeetupApi.new
    @events = meetup_api.open_events(params)['results']
  end

  def show
    # meetup_api = MeetupApi.new
    # @event = meetup_api.open_events.find(params)['results'][:id])
  end

  def new
  end

  def create
  end

  def update
  end

  def delete
  end



end
