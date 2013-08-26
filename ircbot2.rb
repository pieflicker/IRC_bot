require "socket"

puts "where do you want to conect to?"
puts "chat.freenode.net [fn]"
#puts "irc.station51.net (not working yet) [51]"
connect_to=gets.chomp.downcase!
#if connect_to == "fn" 

server = "chat.freenode.net"
port = "6667"
nick = "PieBot"
channel = "#bitmaker"
greeting_prefix = "privmsg #bitmaker :"
greetings = ["search"]


irc_server = TCPSocket.open(server, port)

irc_server.puts "USER bhellobot 0 * BHelloBot"
irc_server.puts "NICK #{nick}"
irc_server.puts "JOIN #{channel}"
#irc_server.puts "PRIVMSG #{channel} :Hello from IRB Bot"

# Hello, Bot!
until irc_server.eof? do
  msg = irc_server.gets.downcase
  puts msg

  wasGreeted = false
  greetings.each do |g|
    
       wasGreeted = true if msg.include? g
end

 
  x = [msg.to_s.split(" ")]
  #x.to_s.gsub("]","")
  
  answer = x.to_s.gsub!(/.*?(?=search)/im, "")
  answer2 = answer.to_s.gsub(/search/, " ")
  answer3= answer2.to_s.gsub!(" ", "+")
  


  if msg.include? greeting_prefix and wasGreeted
  	response = "www.lmgtfy.com/?q=#{answer3}" 
  	irc_server.puts "PRIVMSG #{channel} #{response}" + " "
  end
end

