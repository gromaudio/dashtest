require 'calabash-android/calabash_steps'

Then /^I scroll until I see the "([^\"]*)" text$/ do |text|
  count=query("ListView",:getCount).first.to_i
    var=0
    count.times {
        query("ListView",{:smoothScrollToPosition=>var})
        var+=1
        #puts "#{count} #{var}"
        #break if id found  
        break if element_exists("* marked:'#{text}'")
        #fail if all rows are checked
        fail("#{text} is missing") if var==count
    }
end    

Then /^I check Radio playing$/ do 
	a = query("* id:'currenttime'")
	start = a[0]['text'].gsub(':','').to_i
	sleep 8
	a = query("* id:'currenttime'")
	final = a[0]['text'].gsub(':','').to_i
	if final <= start
		raise "Timer is not working"
	end
end

Then /^I check Radio pause$/ do 
	a = query("* id:'currenttime'")
	start = a[0]['text'].gsub(':','').to_i
	sleep 5
	a = query("* id:'currenttime'")
	final = a[0]['text'].gsub(':','').to_i
	if final != start
		raise "Timer is not working"
	end
end

Then /^I check Music playing$/ do 
	a = query("* id:'currenttime'")
	start = a[0]['text'].gsub(':','').to_i
	sleep 4
	a = query("* id:'currenttime'")
	final = a[0]['text'].gsub(':','').to_i
	if final <= start
		raise "Timer is not working"
	end
end

Then /^I check Music pause$/ do 
	a = query("* id:'currenttime'")
	start = a[0]['text'].gsub(':','').to_i
	sleep 4
	a = query("* id:'currenttime'")
	final = a[0]['text'].gsub(':','').to_i
	if final != start
		raise "Timer is not working"
	end
end

Then /^I rotate device to portrait$/ do 
	perform_action('set_activity_orientation', 'portrait')
end

Then /^I rotate device to landscape$/ do 
	perform_action('set_activity_orientation', 'landscape')
end

Then /^I swipe to right$/ do
    perform_action('drag', 75, 25, 50, 50, 2)
end

Then /^I swipe to left$/ do
    perform_action('drag', 35, 75, 50, 50, 3)
end

Then /^I swipe to down$/ do
	perform_action('drag', 50, 50, 25, 75, 3)
end

Then /^I swipe to up$/ do
	perform_action('drag', 50, 50, 75, 25, 2)
end

Then /^I swipe to Exit$/ do
	perform_action('drag', 10, 10, 85, 25, 5)
end

Then /^I get text for item number (\d+)$/ do |index|
	a=query("android.widget.ListView index:0 android.widget.TextView index:#{index.to_i-1}")
	#@item_text = a[0]['text'] 
	@item_text = a[0]['text'].gsub("'"){"\\'"}
	puts "\tDebug: text for item # #{index} is #{@item_text}"
	if @item_text.empty?
		raise "#{index} does not have text"
	end
end

Then /^I see item number text$/ do
	puts "\tDebug: text in item_text variable is #{@item_text}"
	if @item_text.empty?
		raise "Item text var is empty"
	end
	wait_for_text(@item_text, timeout: 15)
end

Then /^I do not see item number text$/ do
	puts "\tDebug: text in item_text variable is #{@item_text}"
	if @item_text.empty?
		raise "Item text var is empty"
	end
	wait_for_text_to_disappear(@item_text, timeout: 15)
end

Then /^I press previously added element$/ do
	tap_when_element_exists("* marked:'#{@item_text}'")
end	

Then /^I long press previously added element$/ do
	long_press_when_element_exists("* marked:'#{@item_text}'")
end

Then /^I scroll to "([^\"]*)" text$/ do |name|
    wait_poll(:until_exists => "* text:'#{name}'", :timeout => 60) do
    scroll_down
    end
end

Then /^I scroll up to "([^\"]*)" text$/ do |name|
    wait_poll(:until_exists => "* text:'#{name}'", :timeout => 60) do
    scroll_up
    end
end

Then /^I scroll up to "([^\"]*)"$/ do |name|
    wait_poll(:until_exists => "* {text CONTAINS[c] '#{name}'}", :timeout => 60) do
    scroll_up
    end
end

Then /^I scroll down to "([^\"]*)" text$/ do |name|
    wait_poll(:until_exists => "* {text CONTAINS[c] '#{name}'}", :timeout => 60) do
    scroll_down
    end
end

Then /^I restart application$/ do
	start_test_server_in_background
end	

Then /^I enter credentials$/ do
	enter_text("WebView css:'input[type=\"text\"]'", "xehiyoux")
	enter_text("WebView css:'input[type=\"Password\"]'", "Gr0m$potify")
end

Then /^I enter username$/ do
	cmd = "#{default_device.adb_command} shell input text 'xehiyoux'"
	system(cmd)
end

Then /^I enter password$/ do
	cmd = "#{default_device.adb_command} shell input text 'Gr0m\\$potify'"
	system(cmd)
end

Then /^I verify checkboxes$/ do
	checkboxes = query("* id:'checkbox'")
	checkbox_count = checkboxes.count
	checkboxes.each_with_index do |checkbox, index|
		touch("* id:'#{checkbox['id']}' index:#{index}")
	end
	checkboxes = query("* checked:true")
	if checkbox_count != checkboxes.count
		raise "Not all checkboxes were checked"
	end
end

Then /^I uncheck all checkboxes$/ do
	checkboxes = query("* checked:true")
	checkboxes.each_with_index do |checkbox, index|
		touch("* id:'#{checkbox['id']}' index:#{index}")
	end
end

Then /^I check weather widget time$/ do
	phone_time = query("* id:'time'")[0]['text']
	a = Time.now().to_s.split(" ")[1].split(":")
	system_time = a[0]+":"+a[1]
	phone_time == system_time	
end	


Then /^I check player playing$/ do 
	a = query("* id:'position_time'")
	start = a[0]['text'].gsub(':','').to_i
	sleep 2
	a = query("* id:'position_time'")
	final = a[0]['text'].gsub(':','').to_i
	if final <= start
		raise "Timer is not working"
	end
end

Then /^I check player pause$/ do 
	a = query("* id:'position_time'")
	start = a[0]['text'].gsub(':','').to_i
	sleep 2
	a = query("* id:'position_time'")
	final = a[0]['text'].gsub(':','').to_i
	if final != start
		raise "Timer is not working"
	end
end

Then /^I enter text "([^\"]*)"$/ do |text|
  perform_action('keyboard_enter_text', text)
end

Then /^I full scroll down$/ do
	perform_action('drag', 50, 50, 60, -300, 20)
end

Then /^I swipe to next board$/ do
	pan_left
end	

Then /^I wait for start$/ do
count = 0
start = 0
  while (start < 2 &&  count < 50) do
    a = query("* id:'currenttime'")
    start = a[0]['text'].gsub(':','').to_i
    puts start
    count += 1 
    sleep 1
  end 
  if start < 2
		raise "Timer is not working"
  end
end

Then /^I wait for loading "([^\"]*)"$/ do |text|
  wait_for_text(text, timeout: 30)
end

Then /^I start emulator server$/ do
  require 'open3'
  $i, $oe, $t = Open3.popen2e('python -u features/step_definitions/python/serial_android.py')
end

Then /^I start emulator command "([^\"]*)"$/ do |text|
  $i.puts text
end

Then /^I see emulator output "([^\"]*)"$/ do |text|
  #output = $oe.gets
  #puts 'Debug: ' + output
  15.times do
    puts $oe.gets
  end
end

Then /^I see text "([^\"]*)" in emulator output$/ do |text|
  emulator_output = ''
  15.times do
    emulator_output = emulator_output + $oe.gets			
  end
  unless emulator_output.include? text
	fail "Expected text not found in emulator output:\n '#{emulator_output}'"
  end
end  


Then /^I stop emulator server$/ do
  	$i.close_write
  	puts "Server exit code #{@pyaudio_wait_thr}"
end


Then /^I use_new_scroll to "([^\"]*)" text$/ do |name|
    wait_poll(:until_exists => "* text:'#{name}'", :timeout => 60) do
    perform_action('drag', 50, 50, 70, 50, 10)
    end
end


Then /^I use_new_scroll until I see the "([^\"]*)" text$/ do |text|
  q = query("TextView text:'#{text}'")
  while q.empty?
    perform_action('drag', 50, 50, 70, 50, 10)
    q = query("TextView text:'#{text}'")
  end 
end


Then /^I use_new_scroll down to "([^\"]*)" text$/ do |name|
    wait_poll(:until_exists => "* {text CONTAINS[c] '#{name}'}", :timeout => 60) do
    perform_action('drag', 50, 50, 70, 50, 10)
    end
end

Then /^I check timer$/ do 
	a = query("* id:'currenttime'")
	@time_position = a[0]['text'].gsub(':','').to_i
	print @time_position
end

Then /^I check play position$/ do 
	a = query("* id:'currenttime'")
	current_position = a[0]['text'].gsub(':','').to_i
	print current_position
	if !(@time_position .. @time_position+8).include? current_position
		fail "Save position incorrect:\n #{[@time_position .. @time_position+8]}"
  	end
end

Then /^I check pause position$/ do 
	a = query("* id:'currenttime'")
	current_position = a[0]['text'].gsub(':','').to_i
	print current_position
	if !(@time_position-5 .. @time_position).include? current_position
		fail "Save position incorrect:\n #{(@time_position-5 .. @time_position)}"
  	end
end

# Press commands

Then /^I press image view number (\d+)$/ do |index|
 tap_when_element_exists("android.widget.ListView index:0 android.widget.TextView index:#{index.to_i-1}")
end

Then /^I press element number (\d+)$/ do |index|
 tap_when_element_exists("android.support.v7.widget.AppCompatTextView id:'descr' index:#{index.to_i-1}")
end  

Then /^I press on folder$/ do
  tap_when_element_exists("android.support.v7.widget.AppCompatTextView id:'descr'")
end

Then /^I long press element number (\d+)$/ do |index|
 long_press_when_element_exists("android.support.v7.widget.AppCompatTextView id:'descr' index:#{index.to_i-1}")
end

Then /^I long press image view number (\d+)$/ do |index|
 long_press_when_element_exists("android.widget.ListView index:0 android.widget.TextView index:#{index.to_i-1}")
end

Then /^I long press "([^\"]*)" and select item number (\d+)$/ do |text, index|
end

Then /^I click back button$/ do
	cmd = "#{default_device.adb_command} shell input keyevent 4"
	system(cmd)
end

Then /^I press image view with id "([^\"]*)" number (\d+)$/ do |id, index|
 tap_when_element_exists("android.widget.ImageView id:#{id} index:#{index.to_i-1}")
end

Then /^I press item with name "([^\"]*)"$/ do |name|
	exit_code = system "./features/step_definitions/click-by-text.py #{ENV['ADB_DEVICE_ARG']}"+" '"+name+"'"
	if !exit_code
		p exit_code
		raise "Item #{name} is not found on a screen"
	end
end

Then /^I login to GMusic$/ do
	exit_code = system "python ./features/step_definitions/Gmusic_login.py #{ENV['ADB_DEVICE_ARG']}"
	if !exit_code
		p exit_code
		raise "Item is not found on a screen"
	end
end

Then /^I click CANCEL button$/ do
	exit_code = system "python ./features/step_definitions/Cancel_button.py #{ENV['ADB_DEVICE_ARG']}"
	if !exit_code
		p exit_code
		raise "Item is not found on a screen"
	end
end


Then /^I press permission "([^\"]*)"$/ do |name|
	exit_code = system "./features/step_definitions/click-by-text2.py #{ENV['ADB_DEVICE_ARG']}"+" '"+name+"'"
	if !exit_code
		p exit_code
		raise "Item #{name} is not found on a screen"
	end
end

Then /^I long touch left_button$/ do 
	long_press_when_element_exists("* id:'shuffle'")
end

Then /^I touch icon number (\d+)$/ do |index|
	touch("android.support.v7.widget.AppCompatImageView id:'imageView' index:#{index.to_i-1}")
end 

Then /^I touch left_button$/ do 
	touch("* id:'shuffle'")
end

Then /^I tap on Log in to Spotify$/ do
	touch("webView xpath:'//A[contains(text(),\"Log in to Spotify\")]'")
end

Then /^I press enter button$/ do
	press_enter_button
end

Then /^I press Okay button$/ do
	touch("webView xpath:'//BUTTON[contains(text(),\"Okay\")]'")
end	

Then /^I press Login button$/ do
	touch("webView xpath:'//BUTTON[contains(text(),\"Log In\")]'")
end	

Then /^I touch password field$/ do
	touch("WebView css:'input[type=\"Password\"]'")
end

Then /^I touch username field$/ do
	touch("WebView css:'input[name=\"username\"]'")
end

Then /^I long touch the "([^\"]*)" text$/ do |text|
	long_press_when_element_exists("* {text CONTAINS[c] '#{text}'}")
end

Then /^I tap on cover$/ do
	perform_action('click_on_screen', 35, 50)
end

Then /^I click on screen (\d+)% from the left and (\d+)% from the top$/ do |x, y|
  perform_action('click_on_screen', x, y)
end

Then /^I press icon "([^\"]*)" with text "([^\"]*)"$/ do |identifier,text|
  tap_when_element_exists("* id:'#{identifier}' text:'#{text}'")
end

Then /^I check "([^\"]*)" status "([^\"]*)"$/ do |identifier,status|
  query("* id:'#{identifier}' contentDescription:'#{status}'")
end