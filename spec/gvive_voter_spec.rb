require "spec_helper"

RSpec.describe GVIVE::Identity::Voter do
  describe 'Voter ID Verifications' do
    context 'Valid Verifications' do
      it 'should return true when valid? method is called' do
        response = @valid_voter.valid?
        expect(response).to eql true
      end

      it 'should not have an empty fullname' do
        expect(@valid_voter.data.fullname).not_to be_empty
      end

      it 'should return a data response_code of 200 when voter is valid' do
        expect(@valid_voter.data.response_code).to eql "200"
      end
    end

    context 'Invalid Verifications' do
      it 'should return false when valid? method is called' do
        response = @invalid_voter.valid?
        expect(response).to eql false
      end

      it 'should have an empty fullname' do
        expect(@invalid_voter.data.fullname).to be_nil
      end

      it 'should return a data response_code of 201 when voter is invalid' do
        expect(@invalid_voter.data.response_code).to eql "201"
      end

      it 'should not have an empty Error Message' do
        expect(@invalid_voter.data.message).not_to be_empty
      end
    end
  end
end
