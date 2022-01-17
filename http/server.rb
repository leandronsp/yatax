require 'socket'

socket = TCPServer.new(3000)
puts 'Listening to the port 3000...'

loop do
  client = socket.accept

  request = ''

  while line = client.gets
    break if line == "\r\n"

    request +=  line
  end

  puts request
  puts "\n\n"

  cookie = {}

  if cookie_match = request.match(/Cookie:\s(.*)=(.*)\r$/)
    cookie[cookie_match[1]] = cookie_match[2]
  end

  counter = cookie.fetch('counter', 0).to_i + 1

  response =
"""
HTTP/1.1 200\r\n
Content-Type: text/html\r\n
Set-Cookie: counter=#{counter}; path=/; HttpOnly\r\n
\r\n
<h1>Counter: #{counter}</h1>
"""

  client.puts(response.strip.gsub(/\n+/, "\n"))

  client.close
end

socket.close
