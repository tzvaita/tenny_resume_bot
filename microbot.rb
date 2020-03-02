require_relative('./lib/logic.rb')
require 'telegram/bot'
require 'open-uri'

token = ''

Telegram::Bot::Client.run(token) do |bot|
    bot.listen do |message|
      case message.text
        when '/start'
            bot.api.send_message(chat_id: message.chat.id, text: "Hello, #{message.from.first_name}, to Tennyson Takudzwa Zvaita info bot. What would you like to know about?
            - /aboutme
            - /skills
            - /experience
            - /education
            - /projects
            - /contact")
            
       when '/aboutme'
            about = Myself.about_me
            bot.api.send_message(chat_id: message.chat.id, text: about)
        when '/skills'
            skills = Myself.skillz
            bot.api.send_message(chat_id: message.chat.id, text: skills)
        when '/education'
            edu = Myself.education
            bot.api.send_message(chat_id: message.chat.id, text: edu)
        when '/experience'
            exp = Myself.experience
            bot.api.send_message(chat_id: message.chat.id, text: exp)
        when '/projects'
            pro = Myself.projects
            bot.api.send_message(chat_id: message.chat.id, text: pro)
        when '/contact'
            cont = Myself.contact
            bot.api.send_message(chat_id: message.chat.id, text: cont)
        when '/resume'
            #bot.api.send_photo(chat_id: message.chat.id, photo: Faraday::UploadIO.new('~/Desktop/1564999280.jpeg', 'image/jpeg'))
            bot.api.send_message(chat_id: message.from.id, text: "<a href=\"https://www.marlowsjewellers.com/wp-content/uploads/2018/04/free-simple-resume-builder-free-basic-resume-examples-resume-builder-samplebusinessresume-in-simple-resume-sample-for-job.jpg\">Resume</a>", parse_mode: "HTML" )
        else
            bot.api.send_message(chat_id: message.chat.id, text: "I have no idea what #{command.inspect} means. Please check start for available commands.")
        end
    end
end