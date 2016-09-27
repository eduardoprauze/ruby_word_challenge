require_relative '../word_challenge_methods'

describe WordChallenge do

  let(:sequences) { 'sequences.txt' }
  let(:words) { 'words.txt' }
  let(:sequences_content) { "sequences\n\nrrow\nrows\ncarr\nrrot\nrots\ngive\n" }
  let(:words_content) { "words\n\narrows\narrows\ncarrots\ncarrots\ncarrots\ngive\n" }

  it "should initialize sequences and words files" do
    WordChallenge.initialize_files
    expect(File).to exist(sequences)
    expect(File).to exist(words)
  end

  it "should find unique sequences and update the files" do
    words_arr = ["arrows", "carrots", "give", "me"]
    WordChallenge.find_unique_sequences(words_arr)
    expect(File.read(words)).to include(words_content)
    expect(File.read(sequences)).to include(sequences_content)
  end

end
