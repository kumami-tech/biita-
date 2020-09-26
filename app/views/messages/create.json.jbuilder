json.user @message.user
json.user_id @message.user.id
json.user_image @message.user.profile_image_url
json.user_name @message.user.name
json.created_at @message.created_at.strftime("%-m月%-d日 %-H:%M")
json.text @message.text
json.image @message.image_url
json.group_id @message.group.id
json.id @message.id