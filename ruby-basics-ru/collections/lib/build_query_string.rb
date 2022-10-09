# frozen_string_literal: true

# BEGIN
def build_query_string(params = {})
  params.keys.sort.map do |key|
    "#{key}=#{params[key]}"
  end.join('&')
end
# END
