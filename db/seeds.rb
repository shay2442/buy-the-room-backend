Room.destroy_all
User.destroy_all
Image.destroy_all

puts "Seeding"
shay = User.create(username:"Shay", email:"shay@rooms.com", password:"test")
bailey = User.create(username:"Bailey", email:"bailey@rooms.com", password:"test")

room1 =  Room.create(seller_id: User.first.id, image:"https://cdn.decoist.com/wp-content/upload
s/2020/02/Beautiful-small-white-living-room-blends-monochromatic-beauty-with-modernity-53868.jpg", category:"Living Room", city:"Austin", state:"Texas", description:"Modern living room with neautral colors", price:1250.50, items:"One tan couch 120 inches long and 42 inches deep, one small wood coffee table 85in by 18in, two white accent chairs, black lamp, wooden/glass end table, 2 decorative plants, 2 white decorative vases", seller: shay)

room2 = Room.create(seller_id: User.first.id, image:"https://secure.img1-cg.wfcdn.com/im/42664946/resize-h445%5Ecompr-r85/1404/140491911/Sia+L-Shaped+Desk.jpg", category:"Office", city:"Leander", state:"Texas", description:"Home office with wall decor and wooden desk", price:999, items:"One wooded dest (6ft by 2ft),one black desk lamp(height 16inches), shelf decor includes: 2 small statues, 7 decorative books, a small clock, 2 glass triangle bookends *No office chair included.", seller: shay)

room3 = Room.create(seller_id: User.last.id, image:"https://i.pinimg.com/originals/88/14/bd/8814bd138994d012bf0f2234b56a4d76.jpg", category:"Bedroom", city:"Leander", state:"Texas", description:"Cute baby girl themed bedroom, with wall mirror bedding, nightstand, wall decor", price:1400, items:"1 Queen sized bed, and bedding from PotteryBarn, 3 decorative wall flowers, gold wall mirror, white dresser (140 in by 18 in), 3 throw pillows, one small white lamp", seller: bailey)

room4 = Room.create(seller_id: User.last.id, image:"https://i.pinimg.com/736x/9a/c4/5e/9ac45e0f82197bc0e01c0f82da708a0e.jpg", category:"Nursery", city:"Austin", state:"Texas", description:"Baby boy nursery", price:4700, items:"1 white crib, and sheets, white rocking chair, 2 wall pictures of giraffe and elephant, accent rug, changing table", seller: bailey )

comment1 = Comment.create(content:"This room is exactly what I am looking for!", room: room1, user: bailey)

comment2 = Comment.create(content:"I am really intersted in buying this room!", room: room4, user: bailey)


images = ["https://havertys.scene7.com/is/image/Havertys/0-8500-1024?op_sharpen=1&wid=240&hei=160", "https://secure.img1-fg.wfcdn.com/im/35172508/resize-h445%5Ecompr-r85/1810/181037512/Sylas+20.5%2527%2527+Tall+Solid+Wood+Tree+Stump+End+Table.jpg", "https://secure.img1-fg.wfcdn.com/im/05429430/resize-h445%5Ecompr-r85/1388/138877433/Bayswater+84.5%2527%2527+Rolled+Arm+Sofa.jpg", "https://www.livingspaces.com/globalassets/productassets/200000-299999/260000-269999/269000-269999/269200-269299/269247/269247_white_multi-media_accent_chair_signature_01.jpg?w=1911&h=1288&mode=pad", "https://secure.img1-fg.wfcdn.com/im/49142970/resize-h800-w800%5Ecompr-r85/7807/78074786/Easthampton+Solid+Wood+Coffee+Table+with+Storage.jpg"]

images4 = ["https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcQKDGD6iwlhnaxneQOhqAGRwR9P_L63d4Vo_1phSljugeZX_rMd6I2Xr5Nrh5vzjdkZDQWw588KaS8&usqp=CAc", "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcQNYpPWeZYZTkSKHMFXs1oi-L_fgEystP-wnEvB9JUGTkGysMix3YehlmToxQfcdsDNhx1h2YgrQV0&usqp=CAc", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSclA3HXpLAK2HWVbzHEGbXwRL4GO9t-EtjGQ&usqp=CAU", "https://secure.img1-fg.wfcdn.com/im/64626427/resize-h445%5Ecompr-r85/1215/12151412/Armstead+Geometric+Area+Rug+in+Blue/Ivory.jpg", "https://cdn.homedit.com/wp-content/uploads/2014/12/changing-table-rattan-baskets-for-storage.jpg"]

images.each do |image| 
    Image.create(url: image, room_id: room1.id)
end

images4.each do |image| 
    Image.create(url: image, room_id: room4.id)
end

puts"Done Seeding!"