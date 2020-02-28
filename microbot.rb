require_relative('./lib/logic.rb')
require 'telegram_bot'

token = 'token here'
bot = TelegramBot.new(token: token)

bot.get_updates(fail_silently: true) do |message|

    puts "@#{message.from.username}: #{message.text}"
    command = message.get_command_for(bot)
  
    message.reply do |reply|
        case command
        when /start/i
            reply.text = "Hello, #{message.from.first_name}, to Tennyson Takudzwa Zvaita info bot. What would you like to know about?
            - /aboutme
            - /skills
            - /experience
            - /education
            - /projects
            - /contact"
        when /aboutme/i
            about = Myself.about_me
            reply.text = about
        when /skills/i
            skills = Myself.skillz
            reply.text = skills
        when /education/i
            edu = Myself.education
            reply.text = edu
        when /experience/i
            exp = Myself.experience
            reply.text = exp
        when /projects/i
            pro = Myself.projects
            reply.text = pro
        when /contact/i
            cont = Myself.contact
            reply.text = cont
        else
            reply.text = "I have no idea what #{command.inspect} means. Please check start for available commands."
        end
        puts "sending #{reply.text.inspect} to @#{message.from.username}"
        reply.send_with(bot)
    end
end