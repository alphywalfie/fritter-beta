class Frit < ActiveRecord::Base
  belongs_to :user

  	validates :content, presence: true
  
  validate do |frit|
    LimitValidator.new(frit).validate
  end
end

class LimitValidator < ActiveModel::Validator

def initialize(frit)
    @frit = frit
end

def validate
	if @frit.limit == "1 sentence"
		period_count = @frit.content.scan(/\./).size
		question_count = @frit.content.scan(/\?/).size
		exclamation_count = @frit.content.scan(/\!/).size
		count = period_count + question_count + exclamation_count
		if count != 1
			@frit.errors[:base] << "You did not write a one-sentence story!"
		end
	elsif @frit.limit == "2 sentence"
		period_count = @frit.content.scan(/\./).size
		question_count = @frit.content.scan(/\?/).size
		exclamation_count = @frit.content.scan(/\!/).size
		count = period_count + question_count + exclamation_count
		if count != 2
			@frit.errors[:base] << "You did not write a two-sentence story!"
		end
	elsif @frit.limit == "6 word"
		count = (@frit.content).scan(/\w+/).size
		if count != 6
			@frit.errors[:base] << "You did not write a six-word story!"
		end
	elsif @frit.limit == "5 word"
		count = (@frit.content).scan(/\w+/).size
		if count != 5
			@frit.errors[:base] << "You did not write a five-word story!"
		end
	elsif @frit.limit == "3 sentence"
		period_count = @frit.content.scan(/\./).size
		question_count = @frit.content.scan(/\?/).size
		exclamation_count = @frit.content.scan(/\!/).size
		count = period_count + question_count + exclamation_count
		if count != 3
			@frit.errors[:base] << "You did not write a three-sentence story!"
		end
	end
end

end
