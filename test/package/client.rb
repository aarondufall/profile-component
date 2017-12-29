require 'profile/client'
require 'profile/client/controls'

profile_id = Identifier::UUID::Random.get
name = Profile::Client::Controls::Profile.name
email = Profile::Client::Controls::Profile.email
avatar_url = Profile::Client::Controls::Profile.avatar_url

reply_stream_name = Profile::Client::Controls::StreamName::Reply.example

Profile::Client::Initiate.(
  profile_id: profile_id, 
  name: name, 
  email: email, 
  avatar_url: avatar_url,
  reply_stream_name: reply_stream_name
)

stream_name = Messaging::StreamName.stream_name(profile_id, 'profile')

sleep 1

profile_data = MessageStore::Postgres::Get::Last.(stream_name)

pp profile_data
