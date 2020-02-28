require 'telegram_bot'
token = ''
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
        when /skills/i
            skills = %w[Html CSS Ruby Rails Javascript Git]
            all_skills = skills.each {|i| puts i.upcase}
            reply.text = "#{all_skills}"
        when /learn/i
            reply.text = 'To search for information from RubyDocs type what you want to search for'
        else
            reply.text = "I have no idea what #{command.inspect} means."
        end
        puts "sending #{reply.text.inspect} to @#{message.from.username}"
        reply.send_with(bot)
    end
end