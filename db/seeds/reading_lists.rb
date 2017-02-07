ReadingList.create([
  {
    person_id: Person.where(firstname: 'Zed').pluck(:id),
    name: 'Zed’s reading list',
    visibility: 0, # private
  }
])

ReadingListSaves.create([
  {
    paper: Paper.where(uuid: 'PHY001').take,
    reading_list: ReadingList.where(name: 'Zed’s reading list').take
  }
])
