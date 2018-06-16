task dummy_data: :environment do
    account = Account.create(name: 'Test account 1')
    50.times do
        member = Member.create(name: Faker::Name.name, mobile: Faker::Number.number(10))
        account_member = AccountMember.create(account_id: account.id, member_id: member.id)
        saving = Saving.create(amount: 2200, account_member_id: account_member.id)
    end
end
