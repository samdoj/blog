json.extract! post, :id, :title, :article, :preview, :category, :image_url, :created_at, :updated_at
json.url post_url(post, format: :json)
