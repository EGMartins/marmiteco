class LoggedController < ApplicationController
  before_action :logged?, only: [:index]
end
