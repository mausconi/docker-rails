json.extract! @post, *@post.attributes.keys

json.images @post.images do |image|
  json.id image.id
  json.filename image.filename
  json.size image.byte_size
  json.mime_type image.content_type

  json.url url_for(image)
  json.large_url url_for(image.variant(resize: "1200x1200"))
  json.thumbnail_url url_for(image.variant(resize: "400x400"))
end
