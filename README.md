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


## Sprint 2 Issues Completed
- [X] Make Today Trending Stock screen dynamic
  @annaswaheed
  @manuelcastroFau

- [X] investigate how the visualization of price data as graph
  @annaswaheed

- [X] create a user profile in swift UI
  @Velo23


- [X] write the library for the Yahoo API to get the stock info
  @annaswaheed
  @manuelcastroFau
  
  ## Sprint 1 Issues Completed

- [X] Login Page UI.
  @manuelcastroFau


- [X] User should be able to login
  @manuelcastroFau


- [X] create the List of stocks UI
  @annaswaheed
  @manuelcastroFau

- [X] Connect the application to the back4apps
@manuelcastroFau

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

* HD Video Demonstration Interactive Prototype
  * https://youtu.be/Lsw9ShST6VA

## Schema 
[This section will be completed in Unit 9]
### Models
[Add table of models]

We will use in back4app the following table to storage user profile and login values
| Property  | Type     | Description                                         
| --------  | -------- | --------------------------------------------------- |                     
| objectID |  String       | Unique ID of each Object                   |
| firstName    | String | First Name of the user         |
| LastName  | String     | Last Name of the user |
| Username  |  String       | Username of each user                         |
| Password    | String | password to validate the user    |
| Email   | Number   | user email address    |
| Phone   | Number   | user phone number  |
| Photo   | Binary Data   | profile image of the user    |

## Networking

*List of network requests by screen

  ### Sig in/ Sign Up screen
 - Create or authenticate the user using back4app

### Stocks List
	-(Read/GET) Get Stock info from our predefined list
	Using Stock Info API

```
import Foundation 
let headers = [ "content-type": "application/x-www-form-urlencoded", "X-RapidAPI-Key": "bd48fac225msh942df97a253a250p1c5cd8jsna7f3db3ff35f", "X-RapidAPI-Host": "yahoo-finance97.p.rapidapi.com" ] 
let postData = NSMutableData(data: "symbol=AAPL".data(using: String.Encoding.utf8)!) 

let request = NSMutableURLRequest(url: NSURL(string: "https://yahoo-finance97.p.rapidapi.com/stock-info")! as URL, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0) 
request.httpMethod = "POST" 
request.allHTTPHeaderFields = headers 
request.httpBody = postData as Data 
let session = URLSession.shared let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in 
	if (error != nil) { 
		print(error) 
		} else { 
			let httpResponse = response as? HTTPURLResponse print(httpResponse) 
			} }) 
dataTask.resume()
```
##### Profile Screen
	-(POST/GET) Get and set User data from back4app

### Single Stock.
   * (Read/GET) this screen will show user the stats of the stock (stock info) and the price of the stock.   
   * Using Price by Period API
   ```
   swift
   1.  ```
    import Foundation
    
    let headers = [
        "content-type": "application/x-www-form-urlencoded",
        "X-RapidAPI-Key": "bd48fac225msh942df97a253a250p1c5cd8jsna7f3db3ff35f",
        "X-RapidAPI-Host": "yahoo-finance97.p.rapidapi.com"
    ]
    
    let postData = NSMutableData(data: "symbol=AAPL".data(using: String.Encoding.utf8)!)
    postData.append("&period=7d".data(using: String.Encoding.utf8)!)
    
    let request = NSMutableURLRequest(url: NSURL(string: "https://yahoo-finance97.p.rapidapi.com/price")! as URL,
                                            cachePolicy: .useProtocolCachePolicy,
                                        timeoutInterval: 10.0)
    request.httpMethod = "POST"
    request.allHTTPHeaderFields = headers
    request.httpBody = postData as Data
    
    let session = URLSession.shared
    let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
        if (error != nil) {
            print(error)
        } else {
            let httpResponse = response as? HTTPURLResponse
            print(httpResponse)
        }
    })
    
    dataTask.resume()
    ```
   ```
    

### News 
   * (Read/GET) This screen will show recent news of the stock so the user can stay up to date.   
   * Using NEWS API call

```
swift
1.  ```
    import Foundation
    
    let headers = [
        "content-type": "application/x-www-form-urlencoded",
        "X-RapidAPI-Key": "bd48fac225msh942df97a253a250p1c5cd8jsna7f3db3ff35f",
        "X-RapidAPI-Host": "yahoo-finance97.p.rapidapi.com"
    ]
    
    let postData = NSMutableData(data: "symbol=AAPL".data(using: String.Encoding.utf8)!)
    
    let request = NSMutableURLRequest(url: NSURL(string: "https://yahoo-finance97.p.rapidapi.com/news")! as URL,
                                            cachePolicy: .useProtocolCachePolicy,
                                        timeoutInterval: 10.0)
    request.httpMethod = "POST"
    request.allHTTPHeaderFields = headers
    request.httpBody = postData as Data
    
    let session = URLSession.shared
    let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
        if (error != nil) {
            print(error)
        } else {
            let httpResponse = response as? HTTPURLResponse
            print(httpResponse)
        }
    })
    
    dataTask.resume()
    ```
```

  
    
- [OPTIONAL: List endpoints if using existing API such as Yelp]
### Yahoo Finance API
- Base URL - [https://yahoo-finance97.p.rapidapi.com/](https://yahoo-finance97.p.rapidapi.com/ "https://yahoo-finance97.p.rapidapi.com/")

   HTTP Verb | Endpoint | Description
   ----------|----------|------------
    `GET`    | /stock-info | get Stocks basic stats and information
    `GET`    | /price | Get Stock price by period of time
    `GET`    | /news |  Show recent news of the stock from a specific stocks
