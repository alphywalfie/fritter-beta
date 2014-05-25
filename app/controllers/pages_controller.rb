class PagesController < ApplicationController
	def index
		@latest_frits = Frit.last(10)
	end

	def show
		@frits = Frit.all
	end

end