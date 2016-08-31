def create_tags(tag_array)
    if !tag_array.empty?
      tag_array.each do |tag|
      new_tag = Tag.find_or_create_by(name: tag)
      @question.tags << new_tag
      end
    end
end
