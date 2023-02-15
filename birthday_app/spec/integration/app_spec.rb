# frozen_string_literal: true

require 'spec_helper'
require 'rack/test'
require_relative '../../app'
require 'timecop'

describe Application do
  include Rack::Test::Methods

  let(:app) { Application.new }

  before do
    Timecop.freeze(Time.local(2023, 02, 15))
  end

  after do
    Timecop.return
  end

  context 'GET /' do
    it 'asks user for name and birthday' do
      response = get('/')

      expect(response.status).to eq 200

      expect(response.body).to include "<label class=input_prompt>What's your name?</label>"
      expect(response.body).to include '<label class=input_prompt>When is your birthday?</label>'
    end

    it 'returns an errorr message when given invalid name' do
      response = post('/',
                      name: '',
                      birthday_date: '2023-12-02')
      
      expect(response.status).to eq 302

      expect(response.body).to include '<div className=error> <%= @error %> </div>'
    end

    it 'returns an errorr message when given invalid name' do
      response = post('/',
                      name: 'Molly',
                      birthday_date: '')
      
      expect(response.status).to eq 302

      expect(response.body).to include '<div className=error> <%= @error %> </div>'
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
                      birthday_date: '2023-02-15')

      expect(response.status).to eq 302

      follow_redirect!

      expect(last_response.body).to include 'Happy Birthday, Jasmin!'
    end

    it 'gives user countdown until birthday' do
      response = post('/',
                      name: 'Hannah',
                      birthday_date: '2023-02-20')

      expect(response.status).to eq 302

      follow_redirect!

      expect(last_response.body).to include 'Your birthday will be in 5 days, Hannah.'
    end
  end
end
