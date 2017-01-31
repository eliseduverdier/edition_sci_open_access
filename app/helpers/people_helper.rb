module PeopleHelper

  # Get the gravatar for a user
  # Param:
  # +person+:: +Person+
  # +size+::
  def gravatar_for(person, size: 50, class_sup: '')
    # gravatar_id = Digest::MD5::hexdigest(person.email)
    # gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}&d=identicon"
    # image_tag(gravatar_url, alt: "#{person.firstname} #{person.lastname}", class: "gravatar #{class_sup}")
  end

  # Get possibles values for university status
  def possible_uni_status
    ['undergraduate', 'graduate', 'PhD', 'post doc', '?', 'tenured', 'other:', 'not at the university']
  end

  # Get possibles values for website status
  def possible_website_status
    ['reader', 'author', 'writer', 'editor', 'helper']
  end


  # different color for status
  def get_person_status_color(status)
    if status == 'admin'
      'black'
    elsif status == 'editor'
       'blue-grey darken-3'
     elsif status == 'author' || status == 'researcher'
       'blue-grey'
     elsif status == 'reader'
       'blue-grey lighten-4'
    else
      'white'
    end
  end

end
