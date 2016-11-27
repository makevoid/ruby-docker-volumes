require 'spec_helper'

# TODO: implement id tracing and url assignation based on docker network setup (config file / env var) - use configatron or an alternative for managing configurations ( https://github.com/markbates/configatron )

def container_id
  1
end

def container_url
  "http://localhost:32839"
end

# ---

describe "Container" do
  it "clears active containers" do
    puts `docker-compose down`
  end

  it "builds containers" do
    puts `docker-compose build && docker-compose up -d`
  end

  it "healthchecks the apps" do
    puts HTTParty.get container_url(container_id)
    puts `docker exec trydockervolumes_roda_1 ls /app/db`
  end
end
