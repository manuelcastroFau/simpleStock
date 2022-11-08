Original App Design Project - README Template
===

# simpleStock

## Table of Contents
1. [Overview](#Overview)
1. [Product Spec](#Product-Spec)
1. [Wireframes](#Wireframes)
2. [Schema](#Schema)

## Overview
### Description
[real time stock data to create a financial site/application]

### App Evaluation
[Evaluation of your app across the following attributes]
- **Category:Stock
- **Mobile: The App will be primarily developed for the smartphones so that the user will be able to follow stock market trends and news on the go and track stock prices. depending on the demand we will be looking into expanding and making it compitiable for computers (PC/laptops). in the future we will be adding more features in this app.
- **Story: the users anaylzes prices of specific stocks that the are interested in and can follow the news of the company and see the stats of the stock on the go and make informed decisions for their portfolio.
- **Market: the primiary target group for this app is working class mostly, so the target age group is 20-50 years old.
- **Habit: whenever they need to search for an stock, and stay up to date with current market events or even out of mere curiosity of what is near to sky rocket and what stocks are available.
- **Scope: First we will it, start with basic feature such as tracking the price and news of certain stock, then we plan on to push a feature in the future where the user will have a journel and they can add all their stock purchases from different platfrorms and see it in one place. if there is demand then we will see if we can move in the direction of a brokrage and provide buy and sell features.

## Product Spec

### 1. User Stories (Required and Optional)

**Required Must-have Stories**
* User will be able to sign up. 
* User will be able to login.
* User will have a profile.
* User will have a list of stocks.
* User will be able to see to stock info
* User will be able to follow news of a specific stock.



**Optional Nice-to-have Stories**
* User will be able to see historical prices(1day, 1 week, 1 month , 1 year) of a stock on a chart.
* User will be able to add all their stock purchases from other platforms to this app and track everything in one place
* Users can perform technical analysis on stock prices.
* User can view prices of options price chains.
* User can see get notifications of sudden price changes.
* Comment section under each stock to have discussions from all users and collect market sentiments and show predictions.


**Stock Info**

* Price of the stock. 
* Name of the company. 
* Dividends  
* News. 




### 2. Screen Archetypes
* Sign In 
   * User will be able to validate their account and login
* Sign Up - User signs up for a new Account
   * it will take user to profile creation page where they will add their personal information.
* Stocks List - It will show popular stocks to the user.
   * on this screen they will be able to select the stock of their choice to see more information.
* Profile Screen 
   * Allows user to upload a photo and update their information.
* Stock.
   * this screen will show user the stats of the stock (stock info) and the price of the stock.
* News 
   * this screen will show recent news of the stock so the user can stay up to date


### 3. Navigation

**Tab Navigation** (Tab to Screen)

* [Stocks]
* [List of stocks]
* [News]
* [User]

**Flow Navigation** (Screen to Screen)

* [Login]
   * Forced Log-in -> Account creation if no log in is available -> List Of stocks
* [List of stocks]
   * Pick a stock -> Jumps to stock info show the tab navigation at bottom 
   * User -> takes to user profile. 
   * List of stock -> jumps back to the list of stocks
   * News -> jumps to the news of the stocks
   * Stocks -> takes back to the stock info screen

## Wireframes
[Add picture of your hand sketched wireframes in this section]

 <img src="MicrosoftTeams-image (1).png" alt="Wireframe" style="height: 800px; width:800px;"/>

 * PDF Wireframe Specs
  * https://drive.google.com/file/d/1IFhSu9nqnWOzIRewo118lGlA_oC2PcW4/view?usp=sharing

### [BONUS] Digital Wireframes & Mockups
* Link To the Wireframe PDF

### [BONUS] Interactive Prototype
* Try Out Prototype (Test the Demo)
  * https://manuelcastrofau.github.io/simpleStockWireframe/   

* HD Video Demonstartion Interactive Prototype
  * https://youtu.be/Lsw9ShST6VA

## Schema 
[This section will be completed in Unit 9]
### Models
[Add table of models]

| Property  | Type     | Description                                         
| --------  | -------- | --------------------------------------------------- |                     
| stockinfo |  ?       | will be able to see to stock info                   |
| madeAt    | DateTime | when the news of the company stock was made         |
| journel_  | list     | all their stock purchases from different platfrorms |
| buy_sell  |  ?       | buy and sell features stock                         |
| update    | DateTime | stay up to date with current market events          |
| commCon   | Number   | number of comments that has been posted to stock.   |

### Networking
- [Add list of network requests by screen ]
- [Create basic snippets for each Parse network request]
List of network requests by screen
  Home Feed Screen
    (Create) Create a new login profile
    (Delete) Delete news of a specific stock
    (Delete) Delete Followiing of a stock
Create Post Screen
    (Create/POST) Create a journel 
Profile Screen
    (Read/GET) Query logged in user object
    (Update) Update on user stock news
- [OPTIONAL: List endpoints if using existing API such as Yelp]
