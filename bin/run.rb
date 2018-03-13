#!/usr/bin/env ruby

require_relative "../lib/api_communicator.rb"
require_relative "../lib/command_line_interface.rb"

=begin
puts "MMMMMMMMMMMMMMNNNNNNNNNNNNNNNNNNNNNNMMMNNNNNNNMMMMMMNNNNNNNNNNNNMMMMMMMMMMM"
puts "MMMMMMMMMMMMdshhhhhhhhhhhhhhhhhhhhh/mMoyhhhhhohMMMMM/hhhhhhhhhhysdMMMMMMMMM"
puts "MMMMMMMMMMMdoMMMMNmmmmmmmNMMMmmmmmm+mhsMMMyMMM+mMMMM:MMMMyhhhdMMMshMMMMMMMM"
puts "MMMMMMMMMMMdoNMMMsohddddoyMMM:ddddddm+NMMy/hMMm+MMMM:MMMN/hhh/NMMysMMMMMMMM"
puts "MMMMMMMMMMMMmshMMMdsmMMMyyMMM:MMMMMM+mMMd/d/mMMysMMM:MMMMmmmmNMmysNMMMMMMMM"
puts "MMMsyyyyyyyyyyomMMMN/NMMyyMMM:MMMMMyyMMMmdddNMMModMM:MMMModMMMMysyyyyyyyMMM"
puts "MMM/NMMMMMMMMMMMMMMd+MMMyyMMM:MMMMdoMMMyhhhhhhMMN+NM:MMMM:hsdNMMMMMMMMm+MMM"
puts "MMMoyyyyyhhyyyyyyyyhNMMMhshyy/NNNNoshhysNNNNNohhhoyM+yhhh+MMdyyyyyyyyyyoMMM"
puts "MMMm+yyyomNoyyyyoNNoyyy+hMN+yyhhhyoNMMMMmoyyyyyyyyyyhdMMMMMdyyyyyyyyyyssMMM"
puts "MMMModMMm+yyMMMMhoohMMm+MModMMmNMMsyMMMMm+MMMNmmmmNMNysMMMhsNMMMMMMMMMm+MMM"
puts "MMMMN+NMMy+MMMMMMssMMM+mMhsMMM+oMMM+mMMMm+MMMyohhyoMMM+mMMyyMMMMosyyyyyyMMM"
puts "MMMMMdoMMMNMMdyMMNNMMshMm+MMMsyohMMm+MMMm+MMMmhdddmMNhsMMMMysmMMNsyMMMMMMMM"
puts "MMMMMMsyMMMMN++mMMMMdoMM+mMMMhhhhMMMhsMMm+MMMddMMMMmoshhhhhhy+NMMMd+MMMMMMM"
puts "MMMMMMM+mMMM+mm+NMMN+NMsyMMNddddddMMModMm+MMMyoshMMMNNNNNNNNNNMMMMN/MMMMMMM"
puts "MMMMMMMm+hhohMMhohhodMm/hhh+mNNNmyohhy:Nm/hhhoyMdsyhhhhhhhhhhhhhhysNMMMMMMM"
puts "MMMMMMMMNNNNMMMMNNNNMMMNNNNNMMMMMMNNNNNMMNNNNNNMMMNNNNNNNNNNNNNNNNMMMMMMMMM"
=end

def run
  welcome
  character = get_character_from_user
  show_character_movies(character)
end
