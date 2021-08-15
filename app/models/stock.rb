class Stock < ApplicationRecord

  # before_action :iex_client_sandbox, only: [:new_lookup]
  def iex_client
    IEX::Api::Client.new(
      publishable_token: Rails.application.credentials.iex_client[:publishable_token],
      secret_token: Rails.application.credentials.iex_client[:secret_token],
      endpoint: 'https://cloud.iexapis.com/v1'
    )
  end

  def iex_client_sandbox
    IEX::Api::Client.new(
      publishable_token: Rails.application.credentials.iex_client[:publishable_token_sandbox],
      secret_token: Rails.application.credentials.iex_client[:secret_token_sandbox],
      endpoint: 'https://sandbox.iexapis.com/v1'
        )
  end

  def self.new_lookup(ticker_symbol)
    client = IEX::Api::Client.new(
      publishable_token: Rails.application.credentials.iex_client[:publishable_token_sandbox],
      secret_token: Rails.application.credentials.iex_client[:secret_token_sandbox],
      endpoint: 'https://sandbox.iexapis.com/v1'
    )
    client.quote(ticker_symbol).latest_price
  end
  # private_class_method :iex_client

end
