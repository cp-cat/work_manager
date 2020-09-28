# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create({ email: 'aaa@aaa.bbb.cc', name: 'sample', login_id: 'aaa', password: 'password' }) unless User.exists?

unless WorkType.exists?
  work_types = []
  # %w[出勤 欠勤 有給 所定休暇]
  { 'shukkin' => '出勤', 'kekkin' => '欠勤', 'yukyu' => '有給', 'shoteikyuka' => '所定休暇' }.each { |cd, name| work_types << WorkType.new(cd: cd, name: name) }
  WorkType.import work_types
end
