def encrypt (str, n)
  dict = (('a'..'z').to_a.prepend(" ").zip((0..27).to_a.rotate(n))).to_h
  return str.chars.map { |char| dict[char] }.join
end