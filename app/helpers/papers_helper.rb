module PapersHelper

    def get_authors(paper_id)
        list = Array.new()
        authors = Author.where(paper_id: paper_id)
        authors.each do |author|
            list.push(Person.where(id: author.id).take)
        end
        return list
    end


end
