notification :terminal_notifier

guard :rspec, cmd: 'rspec', failed_mode: :focus, notification: true do
  watch(%r{^spec/.+_spec\.rb$})
  watch(%r{^lib/(.+)\.rb$})          { |m| "spec/lib/#{m[1]}_spec.rb" }
  watch('spec/spec_helper.rb')       { 'spec' }
  watch(%r{^spec/support/(.+)\.rb$}) { 'spec' }
end
