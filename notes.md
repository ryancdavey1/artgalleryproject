Models:
user -> email, password digest (has_many bids)
artwork -> name, (maybe image?), description, value/price, artist_id, category (has_many bids; belongs_to user/artist, category)
bid -> value/price, artwork_id, user_id  (belongs_to artwork)


Functionality:
* Users can filter by art category or search by artwork name
* User can view their bids
* Artwork will display details and any bids made by users
* 


User has many artworks through bids
User(artist) has many produced_artworks, foreign_key artist_id, class_name: artwork

User
- has_many bids
- has_many artworks through bids
- has many produced_artworks, foreign_key artist_id, class_name: artwork

Artwork 
- has many bids
- has many users through bids

Bid
- belongs_to artwork
- belongs_to user
- artwork_id, user_id

_ Set up User model
_ Set up login/signup 