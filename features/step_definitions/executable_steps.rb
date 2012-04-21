def add_newline(filename)
	in_current_dir do
		_mkdir(File.dirname(filename))
		File.open(filename, 'a') { |f| f << "\n" }
	end
end

Given /^a file named "([^"]*)" with "([^"]*)"$/ do |filename, content|
	write_file(filename, content)
end

Given /^I append to "([^"]*)" with "([^"]*)" and a newline$/ do |filename, content|
	steps %{
		Given I append to "#{filename}" with "#{content}"
	}
	add_newline(filename)
end

Given /^a file named "([^"]*)" with "([^"]*)" and a newline$/ do |filename, content|
	steps %{
		Given a file named "#{filename}" with "#{content}"
	}
	add_newline(filename)
end
