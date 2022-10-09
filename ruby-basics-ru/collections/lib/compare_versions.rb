# frozen_string_literal: true

# BEGIN
def compare_versions(first_version, second_version)
  first_major, first_minor = first_version.split('.').map(&:to_i)
  second_major, second_minor = second_version.split('.').map(&:to_i)

  return first_major <=> second_major unless (first_major <=> second_major).zero?
  return first_minor <=> second_minor unless (first_minor <=> second_minor).zero?

  0
end
# END
