#!/usr/bin/ruby
filename=ARGV.join(" ")

usage = "Usage: pretty <filename>"

if filename.strip.empty?
  puts "No file specified"
  puts usage
  exit 1
end

if !File.exist? filename
  puts "Didn't find a file at #{filename}"
  puts usage
  exit 1
end

contents=File.read(filename)
contents=contents.force_encoding('UTF-8').encode('UTF-16', :invalid => :replace, :replace => '').encode('UTF-8')
contents=contents.chars.select{|i| i.valid_encoding?}.join

xml = ""
if contents.include? "<?xml" 
  contents = contents.split("<?xml")[1]
  xml = "<?xml"
end

plist = ""
if contents.include? "</plist>"
  contents = contents.split("</plist>")[0]
  plist = "</plist>"
end

#Valid: [\u0009\u000a\u000d\u0020-\uD7FF\uE000-\uFFFD]
forbidden_strings = ["\u0019", "\u0018", "\u0017", "\u0016", "\u0015", "\u0014", "\u0013", "\u0012", "\u0011", "\u0010", 
                     "\u001F", "\u0008", "\u0007", "\u0006", "\u0005", "\u0004", "\u0003", "\u0002", "\u0001", "\u0000",
                     "\u00C7", "\u00CB", "'"]

string_strings = ["strin g"]
slash_strings = ["j/string", "U/string"]

forbidden_strings.each do |st|
  contents = contents.gsub(st, "")
end

string_strings.each do |st|
  contents = contents.gsub(st, "string")
end

slash_strings.each do |st|
  contents = contents.gsub(st, "/string")
end

File.delete filename
File.write(filename, xml + contents + plist)
contents=`xmllint -format '#{filename}'`

if !contents.empty?
  File.delete filename
  File.write(filename, contents)
  new_filename = filename.gsub("mobileconfig", "xml")
  `mv '#{filename}' '#{new_filename}'`
else
  puts "There was an error with formatting."
  `open '#{filename}'`
end