require 'spec_helper'

describe "Container" do
  it "clears active containers" do
    puts `docker-compose down`
  end

  it "builds containers" do
    puts `docker-compose build && docker-compose up -d`
  end

  it "healthchecks the apps" do
    puts HTTParty.get "http://localhost:32839"
    puts `docker exec trydockervolumes_roda_1 ls /app/db`
  end
end
