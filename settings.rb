require 'json'

def get_token
    token = JSON.parse('{"get": "YOUR TOKEN"}')
    
    token["get"]
end

def c_id
    client = JSON.parse('{"client_id": "BOT ID"}')

    client["client_id"]
end

def welcome_channel
    channel  = JSON.parse('{"channel_id": "WELCOME CHANNEL MESSAGE"}')

    channel["channel_id"]
end

def owner
    owner = JSON.parse('{"id": "YOUR ID"}')

    owner["id"]
end
