require 'socket'

socket = TCPServer.new(3000)
puts 'Listening to the port 3000...'

loop do
  client = socket.accept

  request = client.gets

  client.puts("HTTP/1.1 200\r\n\r\n\r\nHello!")

  client.close
end

socket.close
