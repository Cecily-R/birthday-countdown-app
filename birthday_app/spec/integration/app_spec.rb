# frozen_string_literal: true

require 'spec_helper'
require 'rack/test'
require_relative '../../app'

describe Application do
  include Rack::Test::Methods

  let(:app) { Application.new }

  context 'GET /' do
    it 'asks user for name and birthday' do
      response = get('/')

      expect(response.status).to eq 200

      expect(response.body).to include "<label>What's your name?:</label>"
      expect(response.body).to include '<label>When is your birthday?</label>'
    end
  end

  context 'POST /' do
    it 'redirects user to corresponding birthday page' do
      response = post('/')

      expect(response.status).to eq 302
    end
  end

  context 'GET /message' do
    it 'gives user a happy birthday message' do
      response = post('/',
                      name: 'Jasmin',
                      birthday_date: '2022-12-20')

      expect(response.status).to eq 302

      follow_redirect!

      expect(last_response.body).to include 'Happy Birthday, Jasmin!'
    end

    it 'gives user countdown until birthday' do
      response = post('/',
                      name: 'Hannah',
                      birthday_date: '2022-12-25')

      expect(response.status).to eq 302

      follow_redirect!

      expect(last_response.body).to include 'Your birthday will be in 5 days, Hannah.'
    end
  end
end
