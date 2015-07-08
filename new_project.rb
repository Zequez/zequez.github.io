print "Tag: "
tag = gets.strip
date = Time.now

number = Dir['data/projects/*'].map{ |path| path.slice(/(?<=\/)\d+(?=-[^\/]+$)/).to_i }.sort.last + 1
padded_number = number.to_s.rjust(2, '0')

file_name = "#{padded_number}-#{tag}.yml"
file_path = "data/projects/#{file_name}"

project = <<PROJECT
tag: #{tag}
name: 
year: 
pic: false
updated: #{date.strftime('%Y-%m-%d')}

factsheet:
  "Website": 
  "Github": 
  "Time Invested": 
  "Skills Set": 
  "Profits": 
  "Release Date": 
  "Current Status": 

description: |
  
PROJECT


File.write(file_path, project)
`sublime #{file_path}`