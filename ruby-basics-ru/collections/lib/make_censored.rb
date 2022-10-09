# frozen_string_literal: true

def make_censored(text, stop_words)
  # BEGIN
  censored_sentence = '$#%!'
  text.split.map do |word|
    stop_words.include?(word) ? censored_sentence : word
  end.join(' ')
  # END
end
