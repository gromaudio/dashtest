require 'calabash-android/calabash_steps'
Then /^I press image view number (\d+)$/ do |index|
 tap_when_element_exists("android.widget.ImageView index:#{index.to_i-1}")
end

Then /^I long press image view number (\d+)$/ do |index|
 tap_when_element_exists("android.support.v7.widget.AppCompatTextView index:#{index.to_i-1}")
end

Then /^I long press "([^\"]*)" and select item number (\d+)$/ do |text, index|
end

Then /^I press back button$/ do
	Device.press_back_button
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

Then /^I drag from (\d+):(\d+) to (\d+):(\d+) moving with (\d+) steps$/ do |from_x, from_y, to_x, to_y, steps|
  perform_action('drag', from_x, to_x, from_y, to_y, steps)
end

Then /^I long touch the "([^\"]*)" text$/ do |text|
	long_press_when_element_exists("* {text CONTAINS[c] '#{text}'}")
end

Then /^I check Radio playing$/ do 
	a = query("* id:'currenttime'")
	start = a[0]['text'].gsub(':','').to_i
	sleep 1
	a = query("* id:'currenttime'")
	final = a[0]['text'].gsub(':','').to_i
	if final <= start
		raise "Timer is not working"
	end
end

Then /^I check Radio pause$/ do 
	a = query("* id:'currenttime'")
	start = a[0]['text'].gsub(':','').to_i
	sleep 1
	a = query("* id:'currenttime'")
	final = a[0]['text'].gsub(':','').to_i
	if final != start
		raise "Timer is not working"
	end
end

Then /^I get text for item number (\d+)$/ do |index|
	tap_when_element_exists("android.widget.ImageView index:#{index.to_i-1}")
	a=query("android.widget.ListView index:0 android.widget.TextView index:#{index.to_i-1}")
	@item_text = a[0]['text']
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
	wait_for_text(@item_text, timeout: 10)
end
