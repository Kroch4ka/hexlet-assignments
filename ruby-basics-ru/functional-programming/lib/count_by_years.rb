# frozen_string_literal: true

# BEGIN
def count_by_years(users)
  men = users.filter { |user| user[:gender] == 'male' }

  men.each_with_object({}) do |user, accum|
    year, * = user[:birthday].split('-').map(&:to_i)
    accum[year.to_s] ||= 0
    accum[year.to_s] += 1
  end
end
# END
