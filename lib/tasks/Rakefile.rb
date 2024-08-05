require 'json'
require 'rake'

desc 'Read JSON from a file and return a Ruby hash'
task :read_json, [:file_path] do |t, args|
  begin
    file_path = args[:file_path]
    unless file_path
      raise "You must provide a file path. e.g. `rake read_json['/path/to/your/file.json']`"
    end

    file_content = File.read(file_path)
    json_obj = JSON.parse(file_content)


    puts "JSON content parsed to Ruby hash successfully:"
    puts json_obj
  rescue Errno::ENOENT
    puts "File not found at '#{file_path}'"
  rescue JSON::ParserError
    puts "The file at '#{file_path}' does not contain valid JSON data"
  end
end
