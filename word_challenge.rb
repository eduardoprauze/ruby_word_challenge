require 'certified'
require 'open-uri'
require_relative 'word_challenge_methods'

p 'Word challenge - Made by Eduardo Prauze'
p "Generating files 'sequences.txt' and 'words.txt'. Please wait..."
WordChallenge.initialize_files
words = open('https://dl.dropboxusercontent.com/u/14065136/dictionary.txt').read.downcase.split(' ')
WordChallenge.find_unique_sequences(words)
p 'Done.'
