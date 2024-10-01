# @param {String} ransom_note
# @param {String} magazine
# @return {Boolean}
def can_construct(ransom_note, magazine)
  dict =
    magazine
    .chars
    .each_with_object(Hash.new(0)) do |c, d|
      d[c] += 1
    end

  ransom_note.chars.each do |c|
    return false if (dict[c]).zero?

    dict[c] -= 1
  end

  true
end
