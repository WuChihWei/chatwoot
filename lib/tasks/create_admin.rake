namespace :admin do
  desc "Create admin user"
  task create: :environment do
    # 創建或查找帳戶
    account = Account.find_or_create_by!(name: 'My Company')
    
    # 創建用戶（不設定 account）
    user = User.find_or_create_by!(email: 'w99jordan@gmail.com') do |u|
      u.name = 'Jordan'
      u.password = 'Jordan12345!'
      u.password_confirmation = 'Jordan12345!'
    end
    
    # 確認用戶郵箱（如果需要）
    user.confirm if user.respond_to?(:confirm) && !user.confirmed?
    
    # 通過 AccountUser 建立關聯並設定為管理員
    AccountUser.find_or_create_by!(account: account, user: user) do |au|
      au.role = :administrator
    end
    
    puts "✅ Admin user created successfully!"
    puts "   Email: w99jordan@gmail.com"
    puts "   Password: Jordan12345!"
  end
end
