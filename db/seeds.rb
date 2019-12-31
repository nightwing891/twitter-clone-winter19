5.times do 
  tweet = Tweet.create(
    title: Faker::CryptoCoin.coin_name,
    author: Faker::Cannabis.strain,
    body: Faker::Lorem.paragraph(sentence_count: 2),
  )

  3.times do
    Comment.create(
      author: Faker::CryptoCoin.coin_name,
      body: Faker::Lorem.paragraph(sentence_count: 2),
      tweet_id: tweet.id
    )
  end
end
