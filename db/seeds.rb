User.delete_all

users = [
  {username: 'alice',
   email: 'alice@alice.com',
   phone_number: "18001234567",
   password: 'alice'},

  {username: 'david',
   email: 'david@david.com',
   phone_number: "18001234567",
   password: 'david'},

  {username: 'george',
   email: 'george@george.com',
   phone_number: "18001234567",
   password: 'george'},

  {username: 'gregor',
   email: 'gregor@gregor.com',
   phone_number: "18001234567",
   password: 'gregor'}
]

User.create!(users)
