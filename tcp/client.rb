require 'socket'

server = TCPSocket.new('0.0.0.0', 3000)

# Write to socket
server.puts('Yo, server!')

# Read from socket
response = server.gets

puts "Response: #{response}"

# Close the socket
server.close
