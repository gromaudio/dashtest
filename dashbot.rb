#! /home/tolik/.rvm/rubies/ruby-2.1.2/bin/ruby
require 'active_support'
require 'slack-ruby-client'


Slack.configure do |config|
  config.token = 'xoxb-66876465587-t278i97dYremj7P2wxyqoMxQ'
end

client = Slack::RealTime::Client.new

client.on :message do |data|
  case data.text
	  when 'dashbot hi' then
	    client.web_client.chat_postMessage channel: data.channel, text: "Hi <@#{data.user}>!"
	  when 'dashbot -purpose' then
	  	client.web_client.chat_postMessage channel: data.channel, text: "Hi <@#{data.user}>! I will do calabash automation tests for you. Run 'dashbot -help' to get help on my commands"
	  when 'dashbot -help' then
	  	client.web_client.chat_postMessage channel: data.channel, text: "Hi <@#{data.user}>! This is what I can do for you: \n
	  	\t'dashbot update build' - will download latest build from alpha and update test environment.
	  	\t'dashbot test' - to start all available tests "
	  when 'dashbot test' then
	  	client.web_client.chat_postMessage channel: data.channel, text: "<@#{data.user}> Starting test!"
	  	file_name = "TestResults"+Time.now.to_s.gsub(' ','-')+'.txt'
	  	result = system "/home/tolik/calabash-test-android/start_test.sh > #{file_name}"
	  	status = "Failed"
	  	result ? status = "Passed" : "Failed"
	  	client.web_client.chat_postMessage channel: data.channel, text: status
  end
end

client.start!
