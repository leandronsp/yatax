require 'socket'

socket = TCPServer.new(3000)
puts 'Server created. Waiting for connections...'

# Wait
client = socket.accept

puts 'Connection arrived'

# Read from socket
request = client.gets

puts "Request ==> #{request}"

# Write on socket
client.puts('Yo, client!')

# Close the client connection
client.close

# Close the socket
socket.close
