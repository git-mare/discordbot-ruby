require 'discordrb'
require './settings.rb'

bot = Discordrb::Commands::CommandBot.new(token: get_token, client_id: c_id, intents: [:server_messages], prefix: "!") 

bot.member_join do |event_join|
  event_join.bot.channel("#{welcome_channel}").send_message("#{event_join.user.mention} joined.")
end

# with slash
bot.register_application_command(:ping, 'an awesome slash command!')
bot.application_command(:ping) do |event_slash|
  event_slash.respond(content: "pong!")
end

# with prefix
bot.command(:eval) do |event, *code|
  break unless event.user.id == owner.to_i
  begin
    eval code.join(" ")
  rescue StandardError
    'error.'
  end
end

# with prefix
bot.command(:status) do |set_activity, *args|
  break unless set_activity.user.id == owner.to_i
  begin
    bot.game = args.join(" ")
  rescue StandardError
    'error'
  end
  set_activity.respond "New bot activity set!"
end

# just message, without prefix
bot.message do |event, *args|
  case event.message.content

  when "hey"
    event.respond "hi!" 

end

# bot activity
bot.ready do |set_activity|
  bot.game = "hey!" # bot.watching, bot.listening
  bot.idle # online, dnd
end

bot.run