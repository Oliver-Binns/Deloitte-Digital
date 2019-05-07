# DD Shop
## A Case Study for Deloitte Digital

### Code Layout
As with most iOS applications, the code is split into three modules:
* DDShop - Application Code
* DDShopTests - Unit Testing
* DDShopUITests - UI Testing

I hope this is pretty self-explanatory.
Within the application code, the code split into Framework and Functional.
Currently Functional contains only UI code, while Framework contains the Models, State and Networking code.

### Design Choices

#### Storyboards vs Code
Initially I was considering using (SnapKit)[http://snapkit.io] for building the UI programmatically.
However, as this is a very short term (solo) project, I have elected to use storyboards to speed up development time.
While storyboards can often cause horrible merge conflicts and I would not recommend using them for larger projects with multiple developers, this was unlikely to be an issue here.

#### Redux

#### Alamofire

### The prioritised list of user stories is as follows: 
1. As a Customer I can view the products and their category, price and availability information. 
2. As a Customer I can add a product to my shopping cart.
3. As a Customer I can remove a product from my shopping cart.
4. As a Customer I can view the total price for the products in my shopping cart.
5. As a Customer I am unable to add Out of Stock  products to the shopping cart.
6. As a Customer I can add a product to my wishlist.
7. As a Customer I can remove a product from my wishlist.
8. As a Customer I can move a product from my wishlist to the shopping cart.
