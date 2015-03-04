class Request
  attr_accessor :header_line

  def initialize
    input
    @get_request_data = @get_request.split("\n")
    @post_request_data = @post_request.split("\n")
    @response_data = @response
  end

  def path
    array = @get_request_data[0].split(" ")
    array[1]
  end

  def verb
    array = @get_request_data[0].split(" ")
    array[0]
  end

  def params
    setup = @post_request_data
    hash = {}
    setup[5].split("&").each do |param|
      hold = param.split("=")
      hash[hold[0]] = hold[1]
    end
    hash
  end

  def querystring
    setup = @get_request_data[0]
    array = setup.split(" ")
    hold = array[1].split("?")
    hold[1]
  end

  def version
    array = @get_request_data[0].split(" ")
    array[2]
  end

  def headers
    hash = {}
    array = @post_request_data[1].split(" ")
    hash[array[0]] = array[1]
    array = @post_request_data[2].split(" ")
    hash[array[0]] = array[1]
    array = @post_request_data[3].split(" ")
    hash[array[0]] = array[1]
    hash
  end

  private

  def input
    @post_request = File.read("data/post_request.txt")
    @get_request = File.read("data/get_request.txt")
    @response = File.read("data/response_200.txt")
  end

end


request = Request.new
# p request.path
# p request.verb
# p request.headers
# p request.params
# p request.querystring
# p request.version
