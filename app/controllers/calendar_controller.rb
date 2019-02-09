class CalendarController < ApplicationController
	require 'signet/oauth_2/client'

	def redirect
    client = Signet::OAuth2::Client.new(client_options)
    cookies[:trip_id] = params["trip_id"]
    redirect_to client.authorization_uri.to_s
  end

  def callback
    client = Signet::OAuth2::Client.new(client_options)
    client.code = params[:code]

    response = client.fetch_access_token!

    session[:authorization] = response

    client = Signet::OAuth2::Client.new(client_options)
    client.update!(session[:authorization])

    service = Google::Apis::CalendarV3::CalendarService.new
    service.authorization = client

    trip = Trip.find(cookies[:trip_id])

    start_date = Date.parse(trip.start_date.strftime('%a, %d %b %Y'))
    end_date = Date.parse(trip.end_date.strftime('%a, %d %b %Y'))

    event = Google::Apis::CalendarV3::Event.new({
      start: Google::Apis::CalendarV3::EventDateTime.new(date: start_date),
      end: Google::Apis::CalendarV3::EventDateTime.new(date: end_date + 1),
      location: trip.location,
      summary: 'Pegatrip App: Your trip to ' + trip.location
    })

    service.insert_event(current_user.email, event)

    redirect_to user_path(current_user.id)
    flash[:primary] = "Trip added to your calendar!"

  end


  private

  def client_options
    {
      client_id: ENV['GOOGLE_APP_ID'],
      client_secret: ENV['GOOGLE_APP_SECRET'],
      authorization_uri: 'https://accounts.google.com/o/oauth2/auth',
      token_credential_uri: 'https://accounts.google.com/o/oauth2/token',
      scope: Google::Apis::CalendarV3::AUTH_CALENDAR,
      redirect_uri: callback_url
    }
  end
end
