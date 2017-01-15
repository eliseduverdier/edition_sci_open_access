module PeopleHelper


    # Format the list of authors
    # Params:
    # +list+::      +Array+ authors
    # +initials+::  +bool+  true: get only the initial of the firstname
    def get_list_name(list, initials: false)
        people = []
        list.each do |person|
            people.push( person.full_name(initials))
        end
        people.join(', ')
    end

    # Get the gravatar for a user
    # Param:
    # +person+:: +Person+
    # +size+::
    def gravatar_for(person, size: 50)
        gravatar_id = Digest::MD5::hexdigest(person.email)
        gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}&d=identicon"
        image_tag(gravatar_url, alt: "#{person.firstname} #{person.lastname}", class: "gravatar")
    end

    def possible_status
        ['undergraduate', 'graduate', 'PhD', 'post doc', '?', 'tenured', 'other:', 'not at the university']
    end
end
