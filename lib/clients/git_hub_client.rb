class GitHubClient

  ROOT_ENDOINT = 'https://api.github.com'
  ACCESS_TOKEN = 'aea19681d6b34a372723bb83d2f68d5cc4e07aad'

  def initialize 
    @http_client = setup_http_client
  end

  def create_gist(params)
    @http_client.post('gists', params) do |request|
      request.headers['Authorization'] = "token #{ACCESS_TOKEN}"
      request.headers['Content-Type'] = "application/json"
      request.body = params.to_json
    end  
  end

  private

  def setup_http_client
    Faraday.new(url: ROOT_ENDOINT)
  end
end