p 'Word challenge - Made by Eduardo Prauze'
p "Generating files 'sequences.txt' and 'words.txt'. Please wait..."
require 'certified'
require 'open-uri'
words = open('https://dl.dropboxusercontent.com/u/14065136/dictionary.txt').read.downcase.split(' ')
duplicated_sequences = []
open('sequences.txt', 'a') { |f|
  f.puts "sequences"
  f.puts ""
}
open('words.txt', 'a') { |f|
  f.puts "words"
  f.puts ""
}
words.each do |word|
  unless word.length < 4
    quantity_of_sequences = word.length - 4
    for i in 0..quantity_of_sequences
      final_index = i + 3
      current_sequence = word[i..final_index]
      unless duplicated_sequences.include? current_sequence
          if words.any? { |s| s.include?(current_sequence) unless s == word }
            duplicated_sequences << current_sequence
          else
            open('sequences.txt', 'a') { |f|
              f.puts word[i..final_index]
            }
            open('words.txt', 'a') { |f|
              f.puts word
            }
          end
      end
    end
  end
end
p 'Done.'
