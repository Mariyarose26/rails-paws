class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  before_action :set_list, only: [:show, :destroy]
end
