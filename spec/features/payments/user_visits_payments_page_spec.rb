require 'spec_helper'

feature 'User visits payments page'  do
  let!(:student) { create :student, first_name: 'Jan', last_name: 'Nowak' }
  let!(:payment_1) { create :payment, student_id: student.id, amount: 99.99, month: 'February' }

  background do
    sign_in
    expect(page).to have_content 'Logout'
    visit payments_path
  end

  scenario 'should see payments list' do
    within('.breadcrumbs') do
      expect(page).to have_content 'RoR Workhops » Payments'
    end

    expect(page).to have_content '1992-02-14'
    expect(page).to have_content '99.99'
    expect(page).to have_content 'February'
  end

  scenario 'should see payments list as datatables' do
    expect(page).to have_selector 'div', 'dataTables_wrapper'
  end

  scenario 'only when sign in' do
    logout
    visit payments_path
    expect(page).to have_content 'You need to sign in or sign up before continuing.'
  end
end
