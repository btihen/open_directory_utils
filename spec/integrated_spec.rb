require 'spec_helper'

RSpec.describe "Integrated OpenDirectoryUtils User Commands" do

  let!(:od )          { OpenDirectoryUtils::Connection.new }

  let( :existing_gid) { {gid: 'employee'} }
  let( :not_here_gid) { {gid: 'nogroup'} }
  let( :new_group )   { {gid: 'odgrouptest', real_name: "OD_Gruop TEST",
                          gidnumber: '54321'} }

  let( :existing_uid) { {uid: 'btihen'} }
  let( :not_here_uid) { {uid: 'nobody'} }
  let( :new_user_r_n) { {uid: 'odusertest', real_name: "OD_User TEST",
                          uidnumber: 987654321, gidnumber: "1031",
                          email: "user@example.com"} }
  let( :new_user_fnl) { {uid: 'od_util_test', uidnumber: 987654321,
                          first_name: "Od_Util", last_name: "TEST",
                          gidnumber: "1031", email: "user@example.com"} }

  context "query od info" do

    describe "group_get_info" do
      it "with existing group" do
        answer  = od.run(command: :group_get_info, params: existing_gid)
        correct = "RecordName: #{existing_gid[:gid]}"
        expect( answer[:success][:response].first ).to match( correct )
      end
      it "with non-existing user" do
        answer  = od.run(command: :group_get_info, params: not_here_gid)
        correct = "eDSRecordNotFound"
        expect( answer[:error][:response].first ).to match( correct )
      end
    end

    describe "group_exists?" do
      it "answers true when group group_exists" do
        answer  = od.run(command: :group_exists?, params: existing_gid)
        correct = {:success=>{:response=>[true], :command=>:group_exists?, :attributes=>{:gid=>"employee", :shortname=>"employee"}}}
        expect( answer ).to eq(correct)
        expect( answer[:success][:response] ).to eq( [true] )
      end
      it "answers false when group does not exist" do
        answer  = od.run(command: :group_exists?, params: not_here_gid)
        correct = {:success=>{:response=>[false], :command=>:group_exists?, :attributes=>{:gid=>"nogroup", :shortname=>"nogroup"}}}
        expect( answer ).to eq(correct)
        expect( answer[:success][:response] ).to eq( [false] )
      end
    end

    describe "user_get_info" do
      it "with existing user" do
        answer  = od.run(command: :user_get_info, params: existing_uid)
        correct = "email: #{existing_uid[:uid]}"
        expect( answer[:success][:response].first ).to match( correct )
      end
      it "with non-existing user" do
        answer  = od.run(command: :user_get_info, params: not_here_uid)
        correct = "eDSRecordNotFound"
        expect( answer[:error][:response].first ).to match( correct )
      end
    end

    describe "users_exists?" do
      it "answers true when user exists" do
        answer  = od.run(command: :user_exists?, params: existing_uid)
        correct = {:success=>{:response=>[true], :command=>:user_exists?, :attributes=>{:uid=>"btihen", :shortname=>"btihen"}}}
        expect( answer ).to eq(correct)
        expect( answer[:success][:response] ).to eq( [true] )
      end
      it "answers false when user does not exist" do
        answer  = od.run(command: :user_exists?, params: not_here_uid)
        correct = {:success=>{:response=>[false], :command=>:user_exists?, :attributes=>{:uid=>"nobody", :shortname=>"nobody"}}}
        expect( answer ).to eq(correct)
        expect( answer[:success][:response] ).to eq( [false] )
      end
    end

    describe "create new minimal od_test user" do
      it "with username" do

      end
    end
    describe "delete od_test user" do
      it "with username" do
      end
    end

  end
  context "modify/update user info" do
    describe "without uid info" do
      it "a"
    end
    describe "with valid input params" do
      it "b"
    end
    describe "with invalid input params" do
      it "c"
    end
  end
end
