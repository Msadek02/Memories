(1..30).each do |id|
  user = User.new
  user.email = "test#{id}@example.com"
  user.password = 'password'
  user.password_confirmation = 'password'
  user.save!

  Friendship.create(user_id: 1, friend_id: user.id)

  profile = Profile.new(first_name: "test#{id}", last_name: "test#{id}", bio: "whatever", company: 'moonshine')
  profile.user_id = user.id
  profile.image = File.new('public/uploads/profile/image/4/bmw-335i-04.jpg')
  profile.save
end