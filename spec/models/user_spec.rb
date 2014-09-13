require 'rails_helper'

RSpec.describe User, :type => :model do

	describe User do
		let(:user) { User.new }
		subject {user}
		it { should respond_to(:name) }
		it { should respond_to(:email) }
		it { should respond_to(:password) }
	end

end

