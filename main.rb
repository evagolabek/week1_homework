require 'json'

def read_contacts
  contacts_json = File.read("contacts.json")
  return JSON.parse(contacts_json, { symbolize_names: true })
end

def map_contacts
  read_contacts.map { |contact| { contact[:name] => contact[:phone] } }
end

def phone_filter
   read_contacts.select { |contact| contact[:phone].include? '+1'}
end

def email_filter
  read_contacts.select { |contact| contact[:email].include? '.org'}
end

def count_filter_phone
  phone_filter.reduce(0) do |sum, element| ##???
    sum = sum + 1
  end
end

#def count_test
#  puts phone_filter.count
#end

def count_filter_email
  email_filter.reduce(0) do |sum, element| ##???
    sum += 1
  end
end

puts count_filter_email
