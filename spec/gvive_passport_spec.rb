require "spec_helper"

RSpec.describe GVIVE::Identity::Passport do
  describe 'Passport ID Verifications' do
    context 'Valid Verifications' do
      it 'should return true when valid? method is called' do
        response = @valid_passport.valid?
        expect(response).to eql true
      end

      it 'should not have an empty first_name' do
        expect(@valid_passport.data.first_name).not_to be_empty
      end

      it 'should return a data response_code of 200 when voter is valid' do
        expect(@valid_passport.data.response_code).to eql "200"
      end
    end

    context 'Invalid Verifications' do
      it 'should return false when valid? method is called' do
        response = @invalid_passport.valid?
        expect(response).to eql false
      end

      it 'should have an empty first_name' do
        expect(@invalid_passport.data.first_name).to be_nil
      end

      it 'should return a data response_code of 201 when voter is invalid' do
        expect(@invalid_passport.data.response_code).to eql "201"
      end

      it 'should not have an empty Error Message' do
        expect(@invalid_passport.data.message).not_to be_empty
      end
    end
  end
end
