# frozen_string_literal: true

# BEGIN
def anagramm_filter(target_word, anagram_list)
  get_ascii_sum = ->(word) { word.chars.map(&:ord).inject(&:+) }
  ascii_target_sum = get_ascii_sum.call(target_word)
  anagram_list.filter { |anagram_word| get_ascii_sum.call(anagram_word) == ascii_target_sum }
end
# END
