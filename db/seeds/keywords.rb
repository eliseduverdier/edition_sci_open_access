Keyword.create([
  { paper: Paper.where(uuid: 'LIN001').take, keyword: 'linguitics' },
  { paper: Paper.where(uuid: 'LIN001').take, keyword: 'universal grammar' },
  { paper: Paper.where(uuid: 'LIN001').take, keyword: 'syntax' },

  { paper: Paper.where(uuid: 'LIN002').take, keyword: 'syxtax' },
  { paper: Paper.where(uuid: 'LIN002').take, keyword: 'sanskrit' },
])
