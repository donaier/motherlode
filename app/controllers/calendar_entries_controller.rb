class CalendarEntriesController < ApplicationController
  layout 'zhaw_layout'
  before_filter :authenticate_user!, except: [:index, :show_for_date]

  def new
    @entry = CalendarEntry.new(date: params[:date])
  end

  def create
    @entry = CalendarEntry.new(entry_params)

    if @entry.save
      redirect_to '/zhaw/calendar_entries'
     else
       render action: 'new'
    end
  end

  def edit
    if current_user.username == CalendarEntry.find(params[:id]).author
      @entry = CalendarEntry.find(params[:id])
    else
      redirect_to '/zhaw/calendar_entries'
    end
  end

  def update
    if current_user.username == CalendarEntry.find(params[:id]).author
      @entry = CalendarEntry.find(params[:id])
      if @entry.update_attributes(entry_params)
        redirect_to '/zhaw/calendar_entries'
      else
        render 'edit'
      end
    else
      redirect_to '/zhaw'
    end
  end

  def index
    @entries = CalendarEntry.batches
    @detail_entries = CalendarEntry.detail_groups(Date.today)
  end

  def show_for_date
    @detail_entries = CalendarEntry.detail_groups(params[:date].to_date)

    respond_to do |format|
      format.js
    end
  end

  private

  def entry_params
    params.require(:calendar_entry).permit(:date, :author, :description, :modul)
  end
end
