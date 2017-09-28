require "spec_helper"

RSpec.describe GVIVE::Identity::Driver do
  describe 'Driver License Verifications' do
    context 'Valid Verifications' do
      it 'should return true when valid? method is called' do
        # Looking for a valid driver license to test against
      end

      it 'should not have an empty FirstName' do
        # Looking for a valid driver license to test against
      end

      it 'should return a data ResponseCode of 200 when voter is valid' do
        # Looking for a valid driver license to test against
      end
    end

    context 'Invalid Verifications' do
      it 'should return false when valid? method is called' do
        response = @invalid_driver.valid?
        expect(response).to eql false
      end

      it 'should have an empty Fullname' do
        expect(@invalid_driver.data.Fullname).to be_nil
      end

      it 'should return a data ResponseCode of 201 when voter is invalid' do
        expect(@invalid_driver.data.ResponseCode).to eql "201"
      end

      it 'should not have an empty Error Message' do
        expect(@invalid_driver.data.Message).not_to be_empty
      end
    end
  end
end
