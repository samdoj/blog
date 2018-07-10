json.extract! post, :id, :title, :article, :image_url, :category, :created_at, :updated_at
json.url post_url(post, format: :json)
