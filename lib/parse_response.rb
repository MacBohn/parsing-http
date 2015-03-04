class Response
  def  initialize
    @response_200 = File.read("data/response_200.txt").split("\n")
    @response_301 = File.read("data/response_301.txt")
  end

  def status
    status = @response_200[0].split(" ")
    status[1]
  end

  def headers
    data = @response_200
    headers = {}
    1.upto(7) do |i|
      input = data[i].split(": ")
      headers[input[0].to_sym] = input[1]
    end
    headers
  end

  def body
      data = @response_301.split("<body bgcolor=\"white\">\n")
      body = data[1].split("\n</body>")
      body[0]
  end

  def httpversion
    version = @response_200[0].split(" ")
    version[0]
  end


end
response = Response.new
# p response.body
p response.httpversion
# p response.status
# p response.headers
