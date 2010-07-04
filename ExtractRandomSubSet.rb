#!/usr/local/bin/ruby -w

# LOGIC

def read_file
  @file ||= IO.readlines(ARGV[0])
end

def count_lines
  @origin_size ||= read_file.length
end

def generate_subset
  if ARGV[3] == "no_header"
    @subset = []
  else
    @subset = [@file[0]]
  end
  
  generate_indices
  
  @subset_indices.each do |index| 
    @subset << @file[index]
  end
  
end

def generate_indices
  @subset_indices ||= []
  
  while @subset_indices.length < @subset_size
    new_index = rand(count_lines - 1) + 1
    
    @subset_indices << new_index unless @subset_indices.include?(new_index)
  end
end

def display_or_save_subset
  display_subset unless save_subset
end

def save_subset
  if !ARGV[2].nil?
    File.open(ARGV[2], "w") do |file|
      file.puts @subset
    end
    
    display_saved
    
    true
  else
    false
  end
end

def extract
  # EXTRACT -- extract number of lines from file_read and save to file_destination
  @subset_size = Integer(ARGV[1])
  
  if @subset_size < count_lines
    display_extracting
    generate_subset
    display_or_save_subset
  else
    display_cannot_extract
  end
end


# COMMUNICATION

def display_length
  puts "#{ARGV[0]} is #{count_lines} lines long."
end

def display_extracting
  puts "About to extract #{@subset_size} lines from #{ARGV[0]}."
end

def display_cannot_extract
  puts "Can't extract #{@subset_size} lines from #{ARGV[0]} as there are only #{count_lines} lines."
end

def display_saved
  puts "Saved subset to #{ARGV[2]}"
end

def display_subset
  puts "##### BEGIN #####"
  puts @subset
  puts "###### END ######"
end

def display_signature
  puts "RcsvExtract extracts a random subset of CSV data"
  puts "\nWritten by Julian Schrader\nmail@julianschrader.com -- http://julianschrader.com\n\n"
  puts "Please provide arguments (file_origin OR file_origin number [file_destination] [no_header])."
  puts "See README for a HowTo: http://github.com/schrader/RcsvExtract"
end


# RUN

display_length if ARGV.size > 0

extract if ARGV.size > 1

if ARGV.size == 0
  display_signature
end