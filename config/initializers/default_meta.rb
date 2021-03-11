# Be sure to restart your server when you modify this file.

# Specify a serializer for the signed and encrypted cookie jars.
# Valid options are :json, :marshal, and :hybrid.
Rails.application.config.action_dispatch.cookies_serializer = :json

# config/initializers/default_meta.rb

# Initialize default meta tags.
DEFAULT_META = YAML.load_file(Rails.root.join("config/meta.yml"))
