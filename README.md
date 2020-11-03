# artgalleryproject

artgalleryproject is a web app that allows users to create artworks, complete with a name, description, and price. Users can create a profile by signing up, and then logging in, and have the option to log out. Users can create their own artwork or view artworks created in the web app. Users can also create new bids on artworks, and view the bids that they have currently placed.

## Installation

Use the following command to install the web app:
```bash
git clone git@github.com:ryancdavey1/artgalleryproject.git
```
Once inside the project directory, run the command:

 $ cd artgalleryproject

And then execute:

    $ bundle install

## Usage

Run `rails s` to initiate the artgalleryproject web app.

Navigate to `http://localhost:3000/` in your browser to load the Welcome page

On the Welcome page:
- Select `Signup` to create an account.
  - Enter a name, email, and password.
- Select `Login` to sign in with your username and password.

Once logged in, on the user:
- Select `Create an artwork` to enter new artwork details
  - Enter artwork details and then click to submit to return to the user page
- View created artworks and current bids on artworks
- Select an artwork title in the list to view artowkr details
  - Select Edit to modify the artwork details
  - Select Delete to remove the artwork from database and the list of artworks
  - Select new bid to create a bid for a particular artwork
- Select `Logout` to signout.


## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.
Please make sure to update tests as appropriate.

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).