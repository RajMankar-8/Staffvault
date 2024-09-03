#!/bin/bash
set -o errexit

# Install necessary gems
bundle install 

# Clean up old assets to start with a fresh state
bundle exec rails assets:clobber

# Precompile the assets
bundle exec rails assets:precompile

# Optionally clean up old assets after precompilation
bundle exec rails assets:clean
