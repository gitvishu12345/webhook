require 'rest_client'
require 'json'
class Integration
  attr_accessor :create_url, :update_url

  def initialize(user)
    @user = user
    @webhook = @user.webhook
    @create_url = @webhook.create_url
    @update_url = @webhook.update_url
  end

  def push(payload = nil, type)
    begin
      header = {'content_Type' => 'application/json'}
      payload = payload
      url = (type == 'create') ? @create_url : @update_url
      response = RestClient::Request.execute(method: :post, url: url, payload: payload, header: header)
      if [200,400].include?(response.code)
        return true
      else
        puts "Response:: Body::#{response.body}"
        return response
      end
    rescue Exception => e
      puts "Error::Integration::PushInv::Message:: #{e.message}"
    end
    
  end


end 