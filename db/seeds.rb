loan_1 = Loan.create!(funded_amount: 100.00, remaining_balance: 100.00)
payment_1 = loan_1.payments.create!(loan_id: loan_1.id, amount: 20.0, date: '2022-10-10')