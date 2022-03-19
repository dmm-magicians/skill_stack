# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# ユーザーの作成
5.times do |n|
  User.create!(
    email: "test#{n + 1}@test.com",
    password: "Magician",
    name: "テスト太郎#{n + 1}",
    is_delete: false
  )
end

# スキルの作成
[
  ['Ruby', ''],
  ['PHP', ''],
  ['Java', ''],
  ['Go', ''],
  ['Python', ''],
  ['AWS', ''],
  ['GCP', ''],
  ['Azure', ''],
  ['Laravel', ''],
  ['Rails', ''],
  ['Vue.js', ''],
  ['React', '']
].each do |name, image|
  Skill.create!(
    { name: name, image: image}
  )
end

# ユーザースキルの作成
10.times do |n|
  UserSkill.create!(
    user_id: 1,
    skill_id: (n + 1),
  )
end



# 投稿の作成
10.times do |n|
  Output.create!(
    user_id: 1,
    skill_id: 1,
    title: "Ruby学習#{n + 1}日目",
    text: "Ruby学習#{n + 1}日目頑張りました！！明日も頑張ります！",
    time: rand(0.5..8),
    self_assessment_score: rand(1..5),
    date: "March #{n + 1}, 2022"
  )
end

20.times do |n|
  Output.create!(
    user_id: 1,
    skill_id: 2,
    title: "PHP学習#{n + 1}日目",
    text: "PHP学習#{n + 1}日目頑張りました！！明日も頑張ります！",
    time: rand(0.5..8),
    self_assessment_score: rand(1..5),
    date: "April #{n + 1}, 2022"
  )
end

22.times do |n|
  Output.create!(
    user_id: 1,
    skill_id: 6,
    title: "AWS学習#{n + 1}日目",
    text: "AWS学習#{n + 1}日目頑張りました！！インフラの勉強楽しい！明日も頑張ります！",
    time: rand(0.5..8),
    self_assessment_score: rand(1..5),
    date: "May #{n + 5}, 2022"
  )
end

13.times do |n|
  Output.create!(
    user_id: 1,
    skill_id: 9,
    title: "Laravel学習#{n + 1}日目",
    text: "Laravel学習#{n + 1}日目もう疲れました。",
    time: rand(0.5..8),
    self_assessment_score: rand(1..5),
    date: "June #{n + 3}, 2022"
  )
end