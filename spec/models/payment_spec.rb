require 'rails_helper'

RSpec.describe Payment do
  describe 'validations' do
    it { is_expected.to validate_presence_of :student_id }
    it { is_expected.to validate_inclusion_of(:month).in_array(Payment::MONTHS) }
  end

  describe 'database columns' do
    it { should have_db_column :student_id }
    it { should have_db_column :date_of_payment }
    it { should have_db_column :month }
    it { should have_db_column :amount }
  end

  describe 'associations' do
    it { is_expected.to belong_to :student }
  end
end
