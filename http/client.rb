require 'socket'

server = TCPSocket.new('0.0.0.0', 3000)

server.puts("GET /hello HTTP/1.1\r\n\r\n\r\n")

server.close
