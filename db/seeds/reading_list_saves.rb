ReadingListSave.create([
  { # ZED
    paper: Paper.where(uuid: 'PHY001').take,
    reading_list: ReadingList.where(name: 'Zed’s reading list').take
  }, {
    paper: Paper.where(uuid: 'PHY002').take,
    reading_list: ReadingList.where(name: 'Zed’s reading list').take
  }, {
    paper: Paper.where(uuid: 'LIN001').take,
    reading_list: ReadingList.where(name: 'Zed’s reading list').take
  }, { # ELISE ADMIN
    paper: Paper.where(uuid: 'PHY001').take,
    reading_list: ReadingList.where(name: 'Elise’s reading list').take
  }, {
    paper: Paper.where(uuid: 'PHY002').take,
    reading_list: ReadingList.where(name: 'Elise’s reading list').take
  }, { # CHOMSKY ADMIN
    paper: Paper.where(uuid: 'LIN001').take,
    reading_list: ReadingList.where(name: 'Noam’s reading list').take
  }, {
    paper: Paper.where(uuid: 'LIN002').take,
    reading_list: ReadingList.where(name: 'Noam’s reading list').take
  }, {
    paper: Paper.where(uuid: 'LIN003').take,
    reading_list: ReadingList.where(name: 'Noam’s reading list').take
  }
])
