#Destroy all instances to prevent duplicates but primary key ids will continue incrementing
ArtDealer.destroy_all
Bid.destroy_all
WorkOfGif.destroy_all

#ArtDealer instances
lei = ArtDealer.create(name: "Lei")
jezebel = ArtDealer.create(name: "Jezebel")
steven = ArtDealer.create(name: "Steven")

#WorkOfGif instances
pennywise = WorkOfGif.create(name: "Pennywise Float", available: true, stolen: false, starting_bid: 7000)
# squidward = WorkOfGif.create(name: "Squidward Dancing", available: true, stolen: true, starting_bid: 20)
# darth_vader = WorkOfGif.create(name: "Darth Vader Choke", available: true, stolen: false, starting_bid: 5000)
# captain_falcon = WorkOfGif.create(name: "Falcon! PAWNNNNNNNNNNCH!")


#Bid instances  amount,  art_dealer_id,  work_of_gif_id,
# Bid.create(amount: 100, art_dealer_id: lei.id, work_of_gif_id: pennywise.id, win: true)
# Bid.create(amount: 100, art_dealer_id: lei.id, work_of_gif_id: baby_yoda.id, win: false)
# Bid.create(amount: 100, art_dealer_id: lei.id, work_of_gif_id: darth_vader.id, win: false)
# Bid.create(amount: 100, art_dealer_id: lei.id, work_of_gif_id: captain_falcon.id, win: true)
