require 'calabash-android/calabash_steps'
Then /^I press image view number (\d+)$/ do |index|
 tap_when_element_exists("android.widget.ImageView index:#{index.to_i-1}")
end
Then /^I press image view with id "([^\"]*)" number (\d+)$/ do |id, index|
 tap_when_element_exists("android.widget.ImageView id:#{id} index:#{index.to_i-1}")
end
Then /^I set screen to portrait$/ do
    perform_action('set_activity_orientation', 'portrait')
end
Then /^I set screen to landscape$/ do
    perform_action('set_activity_orientation', 'landscape')
end
Then /^I hide keyboard$/ do
    hide_soft_keyboard()
end
