Room.destroy_all
User.destroy_all

puts "Seeding"
shay = User.create(username:"Shay", email:"shay@rooms.com", password:"test")
bailey = User.create(username:"Bailey", email:"bailey@rooms.com", password:"test")

room1 =  Room.create(seller_id: User.first.id, image:"https://cdn.decoist.com/wp-content/upload
s/2020/02/Beautiful-small-white-living-room-blends-monochromatic-beauty-with-modernity-53868.jpg", category:"Living Room", city:"Austin", state:"Texas", description:"Modern living room with neautral colors", price:1250.50, items:["One tan couch 120inches long and 42 inches deep", "one small wood coffee table 85in by 18in", "two white accent chairs", "black lamp", "wooden/glass end table", "2 decorative plants", "2 white decorative vases"], seller: shay)

room2 = Room.create(seller_id: User.first.id, image:"https://secure.img1-cg.wfcdn.com/im/42664946/resize-h445%5Ecompr-r85/1404/140491911/Sia+L-Shaped+Desk.jpg", category:"Office", city:"Leander", state:"Texas", description:"Home office with wall decor and wooden desk", price:999, items:["One wooded dest (6ft by 2ft)","one black desk lamp(height 16inches)", "shelf decor includes: 2 small statues", "7 decorative books", "a small clock", "2 glass triangle bookends" "*No office chair included."], seller: shay)

room3 = Room.create(seller_id: User.last.id, image:"https://i.pinimg.com/originals/88/14/bd/8814bd138994d012bf0f2234b56a4d76.jpg", category:"Bedroom", city:"Leander", state:"Texas", description:"Cute baby girl themed bedroom, with wall mirror bedding, nightstand, wall decor", price:1400, items:["1 Queen sized bed, and bedding from PotteryBarn.", "3 decorative wall flowers", "gold wall mirror", "white dress (140 in by 18 in)", "3 throw pillows", "one small white lamp."], seller: bailey, )

comment1 = Comment.create(content:"This room is exactly what I am looking for!", room: room1, user: bailey)

puts"Done Seeding!"