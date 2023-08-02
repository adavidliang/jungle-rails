require 'rails_helper'

RSpec.describe User, type: :model do
  
    # validation examples here
    before :each do
      @user = User.new(
        password: "password",
        password_confirmation: "password",
        email: "hello@gmail.com",
        first_name: "first",
        last_name: "last"
        )
    end
    describe 'Validations' do
    it "should validates :password, presence: true" do
      @user.password = nil
      expect(@user.valid?).to be(false)
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it "should validates :password, presence: true" do
      @user.password = "password"
      @user.password = "nilpassword"
      expect(@user.valid?).to be(false)
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "should validates :password_confirmation, presence: true" do
      @user.password_confirmation = nil
      expect(@user.valid?).to be(false)
      expect(@user.errors.full_messages).to include("Password confirmation can't be blank")
    end


    it "should validates :first_name, presence: true" do
      @user.first_name = nil
      expect(@user.valid?).to be(false)
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it "should validates :last_name, presence: true" do
      @user.last_name = nil
      expect(@user.valid?).to be(false)
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

    it "should validates :email, presence: true" do
      @user.email = nil
      expect(@user.valid?).to be(false)
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

      
  end

  describe '.authenticate_with_credentials' do
    let(:user) { User.create(email: 'hello@hello', password: 'qwe', password_confirmation: 'qwe') }
    # examples for this class method here
    it "should return false" do
      authenticated_user = User.authenticate_with_credentials('hello@hello', 'qwe')
      pp user
      pp authenticated_user
      expect(authenticated_user.email).to eq(user.email)
    end

    it 'returns nil when given a wrong password' do
      # here you should call the method with the real email and a wrong password
      authenticated_user = User.authenticate_with_credentials('test@example.com', 'wrongpassword123')
      # your expectation should check that the returned value is nil
      expect(authenticated_user).to be(nil)
   end
  
  end

end
