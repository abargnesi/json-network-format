require 'json'
require 'json-schema'

schema_errors = JSON::Validator.fully_validate_schema('schema.json')
unless schema_errors.empty?
  puts "Schema is invalid."
  schema_errors.each {|err| puts err}
  exit 1
end

JSON::Validator.fully_validate_schema('schema.json').each { |x| puts x }
json_data = (STDIN.tty?) ? File.read(ARGV[0]) : STDIN.read
if json_data
  puts JSON::Validator.validate_json('schema.json', json_data)
end
