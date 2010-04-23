# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_myrplife_session',
  :secret      => 'b0358f309b748f60d0e7c64a5c66b7a7eabeca575a28c1e43f4b46bdc56bb8fbdbb9e148db73a4c9f2cedebec9cc6f1a473761109cd4242b480af3a7c8fb9d8a'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
