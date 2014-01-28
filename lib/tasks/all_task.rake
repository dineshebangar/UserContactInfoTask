task :set_products_published_date => :environment do
  puts "Process Started.................."
  count = 0
  products = Product.all.each do |p|
    p.published_date = p.created_at
    if p.save(:validate=>false)
      count +=1
      puts "Product(id=#{p.id}) published_date updated successfully"
    else
      puts "Product(id=#{p.id}) published_date not updated "
      puts "Error: #{p.errors}"
    end
  end
  puts "#{count} Products published_date Updated"
end

task :remove_slash_from_folder_path => :environment do
  puts "Process Started.................."
  products = Product.where('folder_path like ?', "/%").each do |p|
    if p.save
      puts "Product(id=#{p.id}) folder_path updated successfully"
    else
      puts "Product(id=#{p.id}) folder_path not updated "
      puts "Error: #{p.errors}"
    end
  end
  puts "Products folder_path Updated"
end
task :create_admin_user,[:username, :email, :password, :firstname, :lastname]  => :environment  do  |task, user|
  user = User.create(:username => user[:username], :email => user[:email], :firstname => user[:firstname], :lastname => user[:lastname], :password => user[:password], :password_confirmation => user[:password])
  if user.errors.any?
    puts "**********************************User not created*************************"
    puts user.errors.inspect
  else
    puts "**********************************User created successfully******************"
  end
end

task :update_admin_user_password,[:username,  :password]  => :environment  do  |task, user|
  puts "*********************************************"
  puts user[:username]
  admin_user = User.find_by_username(user[:username].to_s)
  admin_user.update_attributes(:password => user[:password] ,:password_confirmation => user[:password])
  puts "**********password updated successfully************************"
end

task :delete_admin_user,[:username]  => :environment  do  |task, user|
  admin_user = User.find_by_username(user[:username].to_s)
  admin_user.destroy
  puts "*********user deleted successfully*************************"
end

desc 'Delete Documents with doctype URL'
task :delete_documents_with_url_doctype => :environment do
  puts "Deleting Documents with doctype URL ..............."
  counts = Document.delete_all(:doctype => 'URL')
  puts "#{counts} No of documents deleted"
end
