require 'calabash-android/calabash_steps'
Then /^I press image view number (\d+)$/ do |index|
 tap_when_element_exists("android.widget.ImageView index:#{index.to_i-1}")
end

Then /^I long press image view number (\d+)$/ do |index|
 tap_when_element_exists("android.support.v7.widget.AppCompatTextView index:#{index.to_i-1}")
end

Then /^I long press "([^\"]*)" and select item number (\d+)$/ do |text, index| step_deprecated
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
  q = query("TextView text:'#{text}'")
  while q.empty?
    scroll_down
    q = query("TextView text:'#{text}'")
  end 
end

Then /^I drag from (\d+):(\d+) to (\d+):(\d+) moving with (\d+) steps$/ do |from_x, from_y, to_x, to_y, steps|
  perform_action('drag', from_x, to_x, from_y, to_y, steps)
end