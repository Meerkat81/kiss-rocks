module KissCaller
	require 'rufus-scheduler'
	puts "asdfafd"
	scheduler = Rufus::Scheduler.new

	scheduler.every '3s' do
  		puts 'Hello... Rufus'
	end
end
