class TrendsController < ApplicationController
	def index
    @cstrengths = Cstrength.all
	end
end
