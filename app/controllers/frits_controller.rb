class FritsController < ApplicationController
	def index
		@frits = current_user.frits
	end

	def new
		prompts = Prompt.all
		limits = Limit.all
		@random_prompt = prompts.sample(1)
		@prompt = @random_prompt[0].topic
		@random_limit = limits.sample(1)
		@limit = @random_limit[0].limit
		@frit = Frit.new
	end

	def create
		@frit = Frit.new
		@frit.content = params[:frit][:content]
		@frit.posted_on = DateTime.now
		@frit.user = current_user
		@frit.prompt = params[:frit][:prompt]
		@frit.limit = params[:frit][:limit]
		if @frit.save
			redirect_to frits_path
		else
			@message = "You did not follow the story limit. >:c"
			@prompt = params[:frit][:prompt]
			@limit = params[:frit][:limit]
			render :action => 'new'
		end
	end

	def edit
		@frit = Frit.find(params[:id])
		@prompt = @frit.prompt
		@limit = @frit.limit
	end

	def update
		@frit =Frit.find(params[:id])
		@back_up_frit = Frit.find(params[:id])
		@frit.content = params[:frit][:content]
		if @frit.save
			redirect_to frits_path
		else
			@message = "You did not follow the story limit. >:c"
			@prompt = @frit.prompt
			@limit = @frit.limit
			@frit.content = @back_up_frit.content
			render :edit
		end
	end

	def destroy
		@frit = Frit.find(params[:id])
		@frit.destroy!
		redirect_to frits_path
	end
end