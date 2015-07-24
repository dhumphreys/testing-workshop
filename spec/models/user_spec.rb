require 'rails_helper'

RSpec.describe User, type: :model do

  describe '#admin?' do
    context 'with admin role' do
      subject { User.new(role: 'admin') }
      it { expect(subject.admin?).to be(true) }
    end

    context 'with non-admin role' do
      subject { User.new(role: 'user') }
      it { expect(subject.admin?).to be(false) }
    end

    context 'with nil role' do
      subject { User.new }
      it { expect(subject.admin?).to be(false) }
    end
  end

  describe '#full_name' do
    context 'with both names' do
      subject { User.new(first_name: 'John', last_name: 'Doe') }
      it { expect(subject.full_name).to eq('John Doe') }
    end

    context 'with neither name' do
      subject { User.new(first_name: nil, last_name: nil) }
      it { expect(subject.full_name).to eq('') }
    end

    context 'with only first_name' do
      subject { User.new(first_name: 'John', last_name: nil) }
      it { expect(subject.full_name).to eq('John') }
    end

    context 'with only last_name' do
      subject { User.new(first_name: nil, last_name: 'Doe') }
      it { expect(subject.full_name).to eq('Doe') }
    end
  end

  describe '.user_limit' do
    it { expect(User.user_limit).to eq(100000) }
    it { expect(User.user_limit).to be > 0 }
    it { expect(User.user_limit).to be < 200000 }
  end
end
