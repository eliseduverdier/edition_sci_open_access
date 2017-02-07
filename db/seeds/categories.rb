Category.create([
  { name: 'physics', parent_category: nil},
  { name: 'linguistics', parent_category: nil},
  { name: 'maths', parent_category: nil},
])
Category.create([
  { name: 'mechanics', parent_category: Category.where(name: 'physics').take},
  { name: 'semantics', parent_category: Category.where(name: 'linguistics').take},
  { name: 'grammar', parent_category: Category.where(name: 'linguistics').take},
  { name: 'algebra', parent_category: Category.where(name: 'maths').take},
])
Category.create([
  { name: 'groups', parent_category: Category.where(name: 'algebra').take},
  { name: 'lexicography', parent_category: Category.where(name: 'semantics').take},
])
