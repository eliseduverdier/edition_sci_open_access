Paper.create([
  {
    paper_type: 'article',
    uuid: 'PHY001',
  	title: 'On the Electrodynamics of Moving Bodies',
    status: 2,
  	abstract: '...',
    html_content: '<p><strong>Pellentesque habitant morbi tristique</strong> senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. <em>Aenean ultricies mi vitae est.</em> Mauris placerat eleifend leo. Quisque sit amet est et sapien ullamcorper pharetra. Vestibulum erat wisi, condimentum sed, <code>commodo vitae</code>, ornare sit amet, wisi. Aenean fermentum, elit eget tincidunt condimentum, eros ipsum rutrum orci, sagittis tempus lacus enim ac dui. <a href="#">Donec non enim</a> in turpis pulvinar facilisis. Ut felis.</p>
    <h2>Header Level 2</h2>
    <ol>
    <li>Lorem ipsum dolor sit amet, consectetuer adipiscing elit.</li>
    <li>Aliquam tincidunt mauris eu risus.</li>
    </ol> ',
  	publication_date: '1905-01-01',
  	pdf_url: '',
    reviews_count: 0,
    need_review: 0,
  	category: Category.where(name: 'mechanics').take
  }, {
    paper_type: 'article',
    uuid: 'LIN001',
  	title: 'Systems of Syntactic Analysis',
    status: 1,
  	abstract: '<p>During the past several decades, linguists have developed and applied widely techniques which enable them, to a considerable extent, to determine and state the structure of natural languages without semantic reference. It is of interest to inquire seriously into the formality of linguistic method and the adequacy of whatever part of it can be made purely formal, and to examine the possibilities of applying it, as has occasionally been suggested, to a wider range of problems. In order to pursue these aims it is first necessary to reconstruct carefully the set of procedures by which the linguist derives the statements of a linguistic grammar from the behaviour of language users, distinguishing clearly between formal and experimental in such a way that grammatical notions, appearing as definienda in a constructional system, will be formally derivable for any language from a fixed sample of linguistic material upon which the primitives of the system are experimentally defined. The present paper will be an attempt to formalize a certain part of the linguist’s generalized syntax language.</p>
    <p> From another point of view, this paper is an attempt to develop an adequate notion of syntactic category within an inscriptional nominalistic framework. The inscriptional approach seems natural for linguistics, particularly in view of the fact that an adequate extension of the results of this paper will have to deal with the problem of homonymity, i.e., with a statement of the conditions under which tokens of the same type must be assigned to different syntactic classes.</p>',
  	publication_date: '1953-01-01',
  	pdf_url: 'https://chomsky.info/wp-content/uploads/195309-.pdf',
    reviews_count: 0,
    need_review: 1,
  	category: Category.where(name: 'linguistics').take
  }, {
    paper_type: 'thesis',
    uuid: 'PHY002',
  	title: 'Description hamiltonienne de l’intéraction ondes-électrons dans un guide d’onde périodique',
    status: 0,
  	abstract: 'L’intéraction entre un faiseau d’électrons et ...',
    html_content: '...............',
  	publication_date: '2016-01-01',
  	pdf_url: '',
    reviews_count: 0,
    need_review: 1,
  	category: Category.where(name: 'physics').take
  }, {
    paper_type: 'letter',
    uuid: 'LIN002',
  	title: 'Letter about linguistics',
    status: 2, # accepted
  	abstract: 'Does opinion letters have abstract ?',
  	html_content: 'Bla blabla bla banana',
  	pdf_url: '',
    reviews_count: 1,
    need_review: 0,
  	category: Category.where(name: 'linguistics').take
  }, {
    paper_type: 'article',
    uuid: 'MAT001',
  	title: 'Algebra article 001',
    status: -1, # pending
  	abstract: 'Very bad paper, pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. <em>Aenean ultricies mi vitae est.</em> ',
  	pdf_url: '',
    reviews_count: 1,
    need_review: 0,
  	category: Category.where(name: 'algebra').take
  }, {
    paper_type: 'opinion',
    uuid: 'MAT_OP001',
  	title: 'Opinions about maths',
    status: -1, # pending
  	abstract: 'In mathematics, a group is an algebraic structure consisting of a set of elements equipped with an operation that combines any two elements to form a third element. The operation satisfies four conditions called the group axioms, namely closure, associativity, identity and invertibility. One of the most familiar examples of a group is the set of integers together with the addition operation, but the abstract formalization of the group axioms, detached as it is from the concrete nature of any particular group and its operation, applies much more widely. It allows entities with highly diverse mathematical origins in abstract algebra and beyond to be handled in a flexible way while retaining their essential structural aspects. The ubiquity of groups in numerous areas within and outside mathematics makes them a central organizing principle of contemporary mathematics.',
    reviews_count: 0,
    need_review: 1,
  	category: Category.where(name: 'groups').take
  },
  {
    paper_type: 'article',
    uuid: 'LIN003',
  	title: 'Topics in the Theory of Generative Grammar',
    status: 2, # accepted
  	abstract: 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean ultrices turpis. Donec tempus quam quis neque. Mauris urna sem, suscipit vitae, dignissim id, ultrices sed, nunc. Aenean id purus. Nam a nunc. Nullam venenatis gravida orci. Mauris sed nulla quis nisi interdum tempor. Duis sem velit, ultrices et, fermentum auctor, rhoncus ut, ligula. Etiam fermentum. Sed fringilla. Quisque dictum quam vel neque. Praesent a lacus vitae turpis consequat semper.',
  	html_content: 'Integer porta. Nulla facilisi. Nam id neque. Suspendisse potenti. Cras gravida. Aenean scelerisque metus eget sem. Pellentesque tempor. Pellentesque condimentum felis a sem. Phasellus nisi metus, tempus sit amet, ultrices ac, porta nec, felis. Sed at turpis vitae velit euismod aliquet. Nam nisl quam, posuere non, volutpat sed, semper vitae, magna. Donec diam eros, tristique sit amet, pretium vel, pellentesque ut, neque. Etiam non neque ac mi vestibulum placerat. Maecenas convallis dui. In hac habitasse platea dictumst. Aliquam vel nibh. Nam malesuada sapien eu nibh. Mauris et pede. Maecenas viverra. Nunc metus. ',
    reviews_count: 0,
    need_review: 1,
  	category: Category.where(name: 'grammar').take
  },
  {
    paper_type: 'article',
    uuid: 'BADLIN001',
  	title: 'Linguistic relativity and etc',
    status: 3, # refused
  	abstract: 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean ultrices turpis. Donec tempus quam quis neque. Mauris urna sem, suscipit vitae, dignissim id, ultrices sed, nunc. Aenean id purus. Nam a nunc. Nullam venenatis gravida orci. Mauris sed nulla quis nisi interdum tempor. Duis sem velit, ultrices et, fermentum auctor, rhoncus ut, ligula. Etiam fermentum. Sed fringilla. Quisque dictum quam vel neque. Praesent a lacus vitae turpis consequat semper.',
  	html_content: 'Integer porta. Nulla facilisi. Nam id neque. Suspendisse potenti. Cras gravida. Aenean scelerisque metus eget sem. Pellentesque tempor. Pellentesque condimentum felis a sem. Phasellus nisi metus, tempus sit amet, ultrices ac, porta nec, felis. Sed at turpis vitae velit euismod aliquet. Nam nisl quam, posuere non, volutpat sed, semper vitae, magna. Donec diam eros, tristique sit amet, pretium vel, pellentesque ut, neque. Etiam non neque ac mi vestibulum placerat. Maecenas convallis dui. In hac habitasse platea dictumst. Aliquam vel nibh. Nam malesuada sapien eu nibh. Mauris et pede. Maecenas viverra. Nunc metus. ',
    reviews_count: 1,
    need_review: 0,
  	category: Category.where(name: 'linguistics').take
  },
  # {
  #   paper_type: '',
  #   uuid: '',
  # 	title: '',
  #   status: 3,
  # 	abstract: '',
  # 	pdf_url: '',
  #   reviews_count: 0,
  #   need_review: 0,
  # 	category: Category.where(name: '_').take
  # },
])
