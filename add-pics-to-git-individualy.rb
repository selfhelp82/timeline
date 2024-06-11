#!/usr/bin/env ruby

require 'pry'

# get home directory from the enviroment
home = ENV['HOME']

# join Home ENV with the downloads directory
address = File.join(home, "Pictures/2-MASTERS/Timelines")

# returns an Array of file paths
def get_files(location)
  Dir.glob("#{location}/**").select { |e| File.file? e }
end

# exclude unwanted files
valid = [".png",".jpeg", '.rb']

# get name from file path and use system git to commit each file
get_files(address).each do |file|

  extension = File.extname(file)
  if valid.include?(extension)
    f = File.basename(file)
    name = f.split('.')[0]
    system("git add #{file}")

    if extension == valid[2]
      system("git commit -m 'added #{name} ruby script'")
    else
      system("git commit -m 'added #{name} picture'")
    end
  end

end
