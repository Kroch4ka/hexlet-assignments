require 'csv'

namespace :hexlet do
  
  desc 'Import users from CSV'
  task "import_users", [:path] => :environment do |_, args|
    puts "RUN!"
    CSV.foreach(args[:path]) do |row|
      first_name, last_name, birthday, email = row
      month, day, year = birthday.split('/')
      birthday = [day, month, year].join('/')
      User.create(first_name: first_name, last_name: last_name, birthday: birthday, email: email)
    end
  end

end
