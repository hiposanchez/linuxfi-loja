# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_loja_session',
  :secret      => '3cda0cfd7a30e738dd40673becf0cb79cbc818c7efc51880d969a9be600a8a912febf697ebc77bb3b8932c7c3e2f156370cbce38a3ffe55811c8e6849b2cbb89'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
