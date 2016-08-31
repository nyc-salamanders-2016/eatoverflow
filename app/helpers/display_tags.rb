def display_tags(tag_array)
  string_array= []
  tag_array.each do |tag|
    string_array << tag.name
  end
  string = string_array.join(' ')
end
