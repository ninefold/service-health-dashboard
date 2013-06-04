require 'time'


class EventsController < ApplicationController
  before_filter :authenticate_user!, :only => [:create, :new]

  def index
  	@events = Event.all
  end

  def new
    @event = Event.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @event }
    end
  end  	

  def create
    @event = Event.new(params[:event])

    respond_to do |format|
      if @event.save
        if @event.start > DateTime.now && @event.invisible = true
          es = EventScheduler
          p "Scheduling event expose in "+(@event.start - DateTime.now).abs.round.to_s
          Resque.enqueue_in((@event.start - DateTime.now).abs.round, es, @event.id)
        end
        format.html { redirect_to '/', notice: 'Event was successfully created.' }
        format.json { render json: @event, status: :created, location: @event }
      else
        format.html { render action: 'new' }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end
  def show
    @event = Event.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @event }
    end
  end
end
