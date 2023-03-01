require 'rails_helper'

RSpec.describe User, type: :model do
  subject { described_class.new(name: 'John', email: 'john@example.com', password: 'password') }

  describe 'validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is not valid without a name' do
      subject.name = nil
      expect(subject).not_to be_valid
    end

    it 'is not valid without an email' do
      subject.email = nil
      expect(subject).not_to be_valid
    end

    it 'is not valid with a duplicate name' do
      described_class.create(name: 'John', email: 'test@example.com', password: 'password')
      expect(subject).not_to be_valid
    end
  end

  describe '#generate_jwt' do
    it 'generates a JWT token' do
      expect(subject.generate_jwt).to be_a(String)
    end
  end

  describe 'associations' do
    it { should have_many(:candidates) }
  end

  describe 'Devise modules' do
    it { should respond_to(:database_authenticatable) }
    it { should respond_to(:trackable) }
    it { should respond_to(:rememberable) }
    it { should respond_to(:validatable) }
    it { should respond_to(:registerable) }
  end
end
