class FundraisingsController < ApplicationController
  skip_authorization_check only: :index # TODO: remove this

  def index
  end
end
