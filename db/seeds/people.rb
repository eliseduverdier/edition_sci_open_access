Person.create([
  # RESEARCHERS
  {
    firstname: 'Albert',
    lastname: 'Einstein',
    status: 'researcher',
    email: 'einstein@test-princeton.edu',
    password: '123456789', password_confirmation: '123456789',
    activated: true, activated_at: Time.zone.now
  }, {
    firstname: 'Noam',
    lastname: 'Chomsky',
    status: 'researcher',
    email: 'noamchomsky@test-mit.edu',
    password: '123456789', password_confirmation: '123456789',
    activated: true, activated_at: Time.zone.now
  }, {
    firstname: 'Damien',
    lastname: 'Minenna',
    status: 'researcher',
    email: 'd.minenna@test-amu.edu',
    password: '123456789', password_confirmation: '123456789',
    activated: true, activated_at: Time.zone.now
  }, {
    firstname: 'Isaac',
    lastname: 'Newton',
    status: 'researcher',
    email: 'newton@test.edu',
    password: '123456789', password_confirmation: '123456789',
    activated: true, activated_at: Time.zone.now
  }, {
    firstname: 'Paul',
    lastname: 'Erdos', # 'Erdős',
    status: 'researcher',
    email: 'erdos@test.edu',
    password: '123456789', password_confirmation: '123456789',
    activated: true, activated_at: Time.zone.now
  },

  # READERS
   {
    firstname: 'Nicolas',
    lastname: 'Bourbaki',
    status: 'reader',
    email: 'bourbaki@test-ens.edu',
    password: '123456789', password_confirmation: '123456789',
    activated: true, activated_at: Time.zone.now
  },

  # ADMIN
   {
    firstname: 'Elise',
    lastname: 'Duverdier',
    status: 'admin',
    email: 'elise@test.com',
    password: '123456789', password_confirmation: '123456789',
    activated: true, activated_at: Time.zone.now
  },

  # EDITORS
  {
    firstname: 'Ed',
    lastname: 'Itor',
    status: 'editor',
    email: 'editor@test.com',
    password: '123456789', password_confirmation: '123456789',
    activated: true, activated_at: Time.zone.now
  }, {
    firstname: 'Zed',
    lastname: 'Itor',
    status: 'editor',
    email: 'zeditor@test.com',
    password: '123456789', password_confirmation: '123456789',
    activated: true, activated_at: Time.zone.now
  }
])
