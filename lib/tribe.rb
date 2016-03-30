class Tribe
	attr_accessor :members
	attr_reader :name

	def initialize(options={})
		@name = options[:name]
		@members = options[:members]
		puts "Tribe #{name} created"
	end

	def to_s
		@name
	end

	def tribal_council(im)
		if im
			members_except_immune = @members.reject{|member| member == im[:immune]}
		else
			members_except_immune = @members
		end
		eliminated_member = members_except_immune.sample
		@members.delete(eliminated_member)
		eliminated_member
	end
end
