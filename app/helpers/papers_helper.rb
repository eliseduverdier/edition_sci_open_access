module PapersHelper

    # Get the authors of a paper
    def get_authors(paper_id)
        list = Array.new()
        authors = Author.where(paper_id: paper_id)
        authors.each do |author|
            list.push(Person.where(id: author.id).take)
        end
        return list
    end

    # Get the list of possible paper types
    def get_paper_types
        ['research article', 'thesis', 'letter', 'clinical case study', 'clinical trial', 'opinion', 'other']
        # + 'book review', 'Trade publication articles' (med), 'Technical Reports'
    end


    def get_hash_status
      {
       -1 => 'pending - not reviewed',
        0 => 'pending - being reviewed',
        1 => 'pending - reviewed',
        2 => 'published', # accepted
        3 => 'refused',
      }
    end

end
