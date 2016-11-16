Name: Vivek Sanghvi Jain           ID:   46902769
#Branch Name: Final_Project_Vivek
## Proposed Project

I am trying to build an ecommerce web application. Once a user purchases something, the item price( which is returned by the GenServer), increases by 10% for the next purchase. The point is to encourage users to buy early. 

I have no idea how to do it as of now.

##Proposed Structure


I plan to use the phoenix framework to help me build the web app.  I'll use a GenServer. I'll have a dyanamic object which will have attributes like object id, object name, an image and object price. While purchasing, I'll try to retreive the price using GenServer.
For the 1st person who purchases it, He gets to pay the same price. But, for the next and so on, every person pays 10%higher price then the person before them. (So, I'll figure out a way to update the listed price by the incremented price after every succesful purchase.

The item information will either be stored in a database or a simple *.csv file. I'll try to have a process load the data. (I would like Ajax like functionality of loading data without refresh. Dont know how to do that as of now)

I'll try to have the OAuth built in, so that Users can sign up using Facebook/Twitter.

I have not figured out how, but I would like to save user purchase history data after signing up. And I'll have supervisor monitoring different modules in the application.

I haven't yet decided the supervision structure and the restart strategy, but that will be ready soon(hopefully)
