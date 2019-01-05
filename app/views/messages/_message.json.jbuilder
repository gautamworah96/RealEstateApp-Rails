json.extract! message, :id, :subject, :content, :sender, :receiver, :created_at, :updated_at
json.url message_url(message, format: :json)
