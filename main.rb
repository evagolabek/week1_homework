require 'json'

def read_contacts
  contacts_json = File.read("contacts.json")
  return JSON.parse(contacts_json, { symbolize_names: true })
end

def map_contacts
  read_contacts.map { |contact| { contact[:name] => contact[:phone] } }
end

puts map_contacts
