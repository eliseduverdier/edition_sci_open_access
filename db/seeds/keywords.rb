Keyword.create([
  { paper_id: (Paper.where(uuid: 'LIN001').take).id, keyword: 'linguitics' },
  { paper_id: (Paper.where(uuid: 'LIN001').take).id, keyword: 'universal grammar' },
  { paper_id: (Paper.where(uuid: 'LIN001').take).id, keyword: 'syntax' },

  { paper_id: (Paper.where(uuid: 'LIN002').take).id, keyword: 'syxtax' },
  { paper_id: (Paper.where(uuid: 'LIN002').take).id, keyword: 'sanskrit' },
])
