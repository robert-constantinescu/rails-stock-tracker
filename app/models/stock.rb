class Stock < ApplicationRecord
  has_many :user_stocks
  has_many :users, through: :user_stocks

  validates :name, :ticker, presence: true

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
    begin
      new(ticker: ticker_symbol, name: client.company(ticker_symbol).company_name, last_price: client.price(ticker_symbol))
    rescue => exception
      nil
    end
  end
  # private_class_method :iex_client

  Stock.where(ticker: 'GOOG').first

  def self.get_stock_from_db(ticker_symbol)
    Stock.where(ticker: ticker_symbol).first
  end
end
