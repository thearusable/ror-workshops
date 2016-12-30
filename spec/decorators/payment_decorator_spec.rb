require 'rails_helper'

describe PaymentDecorator do
  let!(:student) { create :student, first_name: 'Jan', last_name: 'Nowak' }
  let(:payment_1) { create :payment, student_id: student.id, date_of_payment: '1992/02/14'}
  let(:payment_2) { create :payment, student_id: student.id, amount: 99.99 }

  describe "#displayed_money" do
    describe "when payment have assigned amount of money" do
      subject { payment_2.decorate.displayed_money }
      it { is_expected.to eq 99.99 }
    end

    describe "when payment doesn't have assigned amount of money" do
      subject { payment_1.decorate.displayed_money }
      it { is_expected.to eq 'NOT PAYED' }
    end
  end

  describe "#displayed_date" do
    describe "when payment have assigned amount of money" do
      subject { payment_2.decorate.displayed_date }
      it { is_expected.to eq '1992-02-14'}
    end

    describe "when payment doesn't have assigned amount of money" do
      subject { payment_1.decorate.displayed_date }
      it { is_expected.to eq 'NOT PAYED'}
    end
  end
end
