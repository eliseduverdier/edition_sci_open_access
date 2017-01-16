module PeopleHelper

    # Get the gravatar for a user
    # Param:
    # +person+:: +Person+
    # +size+::
    def gravatar_for(person, size: 50)
        gravatar_id = Digest::MD5::hexdigest(person.email)
        gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}&d=identicon"
        image_tag(gravatar_url, alt: "#{person.firstname} #{person.lastname}", class: "gravatar")
    end

    # Get possibles values for university status
    def possible_uni_status
        ['undergraduate', 'graduate', 'PhD', 'post doc', '?', 'tenured', 'other:', 'not at the university']
    end

    # Get possibles values for website status
    def possible_website_status
        ['reader', 'author', 'writer', 'editor', 'helper']
    end
end
