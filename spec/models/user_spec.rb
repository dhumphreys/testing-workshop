require 'rails_helper'

RSpec.describe User, type: :model do

  it { should have_many(:blogs) }

  it { should validate_presence_of(:username) }
  it { should validate_uniqueness_of(:username) }
  it { should validate_presence_of(:password) }
  it { should validate_confirmation_of(:password) }
  it { should validate_length_of(:password).is_at_least(8) }
  it { should validate_presence_of(:role) }
  it { should validate_inclusion_of(:role).in_array(User::ROLES) }
  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }

  context 'when not admin' do
    before { allow(subject).to receive(:admin?).and_return(false) }
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
  end

  context 'when admin' do
    before { allow(subject).to receive(:admin?).and_return(true) }
    it { should_not validate_presence_of(:first_name) }
    it { should_not validate_presence_of(:last_name) }
  end

  describe '.admins' do
    let!(:admins) { create_list(:user, 2, :admin) }
    let!(:users) { create_list(:user, 1) }
    it { expect(User.admins).to eq(admins) }
  end

  describe '.users' do
    let!(:admins) { create_list(:user, 1, :admin) }
    let!(:users) { create_list(:user, 2) }
    it { expect(User.users).to eq(users) }
  end

  describe '#admin?' do
    context 'with admin role' do
      subject { build(:user, :admin) }
      it { expect(subject.admin?).to be(true) }
    end

    context 'with non-admin role' do
      subject { build(:user) }
      it { expect(subject.admin?).to be(false) }
    end

    context 'with nil role' do
      subject { build(:user, :no_role) }
      it { expect(subject.admin?).to be(false) }
    end
  end

  describe '#full_name' do
    context 'with both names' do
      subject { build(:user, :john_doe) }
      it { expect(subject.full_name).to eq('John Doe') }
    end

    context 'with neither name' do
      subject { build(:user, :no_name) }
      it { expect(subject.full_name).to eq('') }
    end

    context 'with only first_name' do
      subject { build(:user, :john_doe, last_name: nil) }
      it { expect(subject.full_name).to eq('John') }
    end

    context 'with only last_name' do
      subject { build(:user, :john_doe, first_name: nil) }
      it { expect(subject.full_name).to eq('Doe') }
    end
  end

  describe '.user_limit' do
    it { expect(User.user_limit).to eq(100000) }
    it { expect(User.user_limit).to be_between(0, 200000).exclusive }
    it { expect(User.user_limit).to be < 200000 }
  end
end
