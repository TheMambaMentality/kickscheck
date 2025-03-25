# Puma can serve each request in a thread from an internal thread pool.
# The `threads` method setting takes two numbers: a minimum and maximum.
# Default is set to 5 threads for minimum and maximum.
max_threads_count = ENV.fetch("RAILS_MAX_THREADS") { 5 }
min_threads_count = ENV.fetch("RAILS_MIN_THREADS") { max_threads_count }
threads min_threads_count, max_threads_count

# Worker timeout for development environment
worker_timeout 3600 if ENV.fetch("RAILS_ENV", "development") == "development"

# Port Puma will listen on
port ENV.fetch("PORT") { 3000 }

# Environment
environment ENV.fetch("RAILS_ENV") { "development" }

# PID file location
pidfile ENV.fetch("PIDFILE") { "tmp/pids/server.pid" }

# Number of workers (recommended for production)
workers ENV.fetch("WEB_CONCURRENCY") { 2 }

# Load app before forking
preload_app!

# Enable restart via `rails restart`
plugin :tmp_restart
