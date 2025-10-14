namespace :admin do
  desc "Create admin user"
  task create: :environment do
    account = Account.find_or_create_by!(name: 'My Company')
    user = User.find_or_create_by!(email: 'admin@example.com') do |u|
      u.name = 'Jordan'
      u.password = 'Jordan12345!'
      u.password_confirmation = 'Jordan12345!'
      u.account = account
    end
    AccountUser.find_or_create_by!(account: account, user: user, role: :administrator)
    puts "✅ Admin created: w99jordan@gmail.com / Jordan12345!"
  end
end
