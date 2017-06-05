class LoggedController < ApplicationController
  before_action :logged?, only: %i[index new]
end
