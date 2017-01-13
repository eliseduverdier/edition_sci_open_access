class Paper < ApplicationRecord
  belongs_to :category


  def get_authors
      list = Array.new()
      authors = Author.where(paper_id: self[:id])
      authors.each do |author|
          list.push(Person.where(id: author.id).take)
      end
      return list
  end

end
