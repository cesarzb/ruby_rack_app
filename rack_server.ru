# frozen_string_literal: true

require './application'
# require 'rack/session'

use Rack::Reloader, 0
use Rack::Session::Cookie,
    key: 'og_rack_session',
    domain: 'localhost',
    path: '/',
    expire_after: 3600 * 24,
    secret: 'your_secret_key'
run Application.new
