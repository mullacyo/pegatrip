class ExampleController < ApplicationController
	require 'signet/oauth_2/client'
	
	def redirect
    client = Signet::OAuth2::Client.new(client_options)

    redirect_to client.authorization_uri.to_s
  end

  private

  def client_options
    {
      client_id: ENV['GOOGLE_APP_ID'],
      client_secret: ENV['GOOGLE_APP_SECRET'],
      authorization_uri: 'https://accounts.google.com/o/oauth2/auth',
      token_credential_uri: 'https://accounts.google.com/o/oauth2/token',
      scope: Google::Apis::CalendarV3::AUTH_CALENDAR,
      redirect_uri: 'http://localhost:3000/auth/google_oauth2/callback'
    }
  end
end
