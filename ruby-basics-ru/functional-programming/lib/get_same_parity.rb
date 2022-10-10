# frozen_string_literal: true

# BEGIN
def get_same_parity(list)
  list.select { |el| (list.first.odd? && el.odd?) || (list.first.even? && el.even?) }
end
# END
