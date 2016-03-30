require 'colorizr'

class Jury
	attr_accessor :members

	def initialize
		@members = []
	end

	def add_member(member)
		@members.push(member)
		#puts "Members: #{@members}"
	end

	def cast_votes(finalists)
		# create finalists hash and fill it with 0 values
		finalists_hash = {}
		finalists.each {|finalist| finalists_hash[finalist] = 0}

		# puts each member vote
		@members.each do |member|
			vote_for = finalists.sample
			puts "Member #{member.to_s.light_blue} votes for #{vote_for.to_s.green}"
			finalists_hash[vote_for] += 1
		end

		# return result
		finalists_hash
	end

	def report_votes(final_votes)
		final_votes.each {|key, value| puts "Finalist #{key.to_s.yellow}: #{value.to_s.pink}"}
	end

	def announce_winner(final_votes)
		winner = final_votes.max_by{|key, value| final_votes[key]}[0]
		puts "*"*20
		puts "\nThe winner is: #{winner.to_s.red}"
		winner
	end
end
