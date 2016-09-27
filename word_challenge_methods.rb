require 'certified'
require 'open-uri'

class WordChallenge

  def self.initialize_files
    open('sequences.txt', 'w') { |f|
      f.puts "sequences"
      f.puts ""
    }
    open('words.txt', 'w') { |f|
      f.puts "words"
      f.puts ""
    }
  end

  def self.update_file(file, key)
      if file == "sequences"
        open('sequences.txt', 'a') { |f|
          f.puts key
        }
      elsif file == "words"
        open('words.txt', 'a') { |f|
          f.puts key
        }
      end
  end

  def self.find_unique_sequences(words)
    duplicated_sequences = []
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
                update_file("sequences", word[i..final_index] )
                update_file("words", word)
              end
          end
        end
      end
    end
  end

end
