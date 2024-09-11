require "rails_helper"

RSpec.describe ApplicationClient, type: :request do
  before do
    @client = ApplicationClient.new(token: "test")
  end

  it "authorization header" do
    stub_request(:get, "https://example.org/").with(headers: { "Authorization" => "Bearer test" }).to_return(status: 200, body: "")
  end
end
