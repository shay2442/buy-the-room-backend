Room.destroy_all
User.destroy_all

puts "Seeding"
shay = User.create(username:"Shay", email:"shay@rooms.com", password:"test")
bailey = User.create(username:"Bailey", email:"bailey@rooms.com", password:"test")

room1 =  Room.create(user_id: User.first.id, image:"https://cdn.decoist.com/wp-content/upload
s/2020/02/Beautiful-small-white-living-room-blends-monochromatic-beauty-with-modernity-53868.jpg", category:"Living Room", city:"Austin", state:"Texas", description:"Modern living room with neau
tral colors", price:1250.50)

room2 =  Room.create(user_id: User.first.id, image:"https://secure.img1-fg.wfcdn.com/im/42664946/resize-h445%5Ecompr-r85/1404/140491911/Sia+L-Shaped+Desk.jpg", category:"Office", city:"Leander", state:"Texas", description:"Home office with wall decor and wooden desk", price:999)

room3 = Room.create(user_id: User.last.id, image:"https://i.pinimg.com/originals/88/14/bd/8814bd138994d012bf0f2234b56a4d76.jpg", category:"Bedroom", city:"Leander", state:"Texas", description:"Cute baby girl themed bedroom, with wall mirror bedding, nightstand, and pinl wall decor", price:1400)

puts"Done Seeding!"