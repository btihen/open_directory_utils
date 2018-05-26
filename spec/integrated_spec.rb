require 'spec_helper'

RSpec.describe "Integrated OpenDirectoryUtils User Commands" do

  let!(:od )          { OpenDirectoryUtils::Connection.new }
  let( :existing_uid) { {uid: 'btihen'} }
  let( :not_here_uid) { {uid: 'nobody'} }

  context "query od info" do
    describe "without uid info" do
      it ""
    end
    describe "user_get_info" do
      it "with existing user" do
        answer  = od.run(command: :user_get_info, attributes: existing_uid)
        correct = "email: #{existing_uid[:uid]}"
        expect( answer[:success][:response].first ).to match( correct )
      end
      it "with non-existing user" do
        answer  = od.run(command: :user_get_info, attributes: not_here_uid)
        correct = "eDSRecordNotFound"
        expect( answer[:error][:response].first ).to match( correct )
      end
      it "decide if user_exists?"
    end
    describe "with invalid uid info" do
      it "with internal space - get ERROR message"
    end
  end
  context "modify/update user info" do
    describe "without uid info" do
      it ""
    end
    describe "with valid input params" do
      it ""
    end
    describe "with invalid input params" do
      it ""
    end
  end
end
