namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    User.create!(name: "Ilnar",
                 email: "25gaisarov@gmail.com",
                 password: "104Hmoa)",
                 password_confirmation: "104Hmoa)")
    User.create!(name: "ALsu",
                 email: "alsu1111@gmail.com",
                 password: "0123456789",
                 password_confirmation: "0123456789")
    99.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@railstutorial.org"
      password  = "password"
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end

    20.times do |n|
      title = "My message 100#{n+1}"
      body = "Возможно, ваше приложение потребует макет, немного отличающийся от обычного макета приложения, для поддержки одного определенного контроллера. Вместо повторения главного макета и редактирования его, можете выполнить это с помощью вложенных макетов (иногда называемых подшаблонами). Вот пример:"
      sender_id = 1+n
      recipient_id = 2+n
      conversation = Conversation.create!(sender_id: sender_id, recipient_id: recipient_id)
      conversation.messages.create!(title: title, body: body, sender_id: sender_id)
    end

    20.times do |n|
      title = "My messagesss 100#{n+1}"
      body = "Возможно, вашеss приложение потребует макет, немного отличающийся от обычного макета приложения, для поддержки одного определенного контроллера. Вместо повторения главного макета и редактирования его, можете выполнить это с помощью вложенных макетов (иногда называемых подшаблонами). Вот пример:"
      sender_id = 1
      recipient_id = 2
      conversation = Conversation.between(sender_id,recipient_id).first
      message = conversation.messages.create!(sender_id: sender_id, title: title ,body: body)
    end

    20.times do |n|
      title = "My messagesss 100#{n+1}"
      body = "Возможно, вашеss приложение потребует макет, немного отличающийся от обычного макета приложения, для поддержки одного определенного контроллера. Вместо повторения главного макета и редактирования его, можете выполнить это с помощью вложенных макетов (иногда называемых подшаблонами). Вот пример:"
      sender_id = 2
      recipient_id = 1
      conversation = Conversation.between(sender_id,recipient_id).first
      message = conversation.messages.create!(sender_id: sender_id, title: title ,body: body)
    end
  end
end
