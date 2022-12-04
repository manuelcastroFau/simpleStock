//
//  YahooAPI.swift
//  simpleStock
//
//  Created by Annas Waheed on 11/18/22.
//

import Foundation


struct NewsJSON: Codable {
    let data: [Datum]
    let message: String
    let status: Int
}
struct Datum: Codable {
    let link: String
    let providerPublishTime: Int
    let publisher: String
    let relatedTickers: [String]
    let thumbnail: Thumbnail?
    let title, type, uuid: String
}
struct Thumbnail: Codable {
    let resolutions: [Resolution]
}
struct Resolution: Codable {
    let height: Int
    let tag: Tag
    let url: String
    let width: Int
}
enum Tag: String, Codable {
    case original = "original"
    case the140X140 = "140x140"
}




///////hgggg

struct ninfo: Decodable{
    let title : String
    let link  : String
    
    
    init(){
        title = ""
        link = ""
    }
}




struct news:Decodable{
    let data : [ninfo]
}

struct info: Decodable{
    let address1 : String
    let longName : String
    let logo_url : String
    let website: String
    let recommendationKey: String
    let currentPrice: Double
    let fiftyTwoWeekHigh: Double
    let fiftyTwoWeekLow: Double
    let averageVolume: Double
    let dayHigh: Double
    let dayLow: Double
    //let dividendYield: Double
    let netIncomeToCommon:Double
    let open: Double
    let marketCap: Double
    
    init() {
        address1 = ""
        currentPrice = 0
        longName = ""
        logo_url = ""
        website = ""
        recommendationKey = ""
        fiftyTwoWeekHigh = 0
        fiftyTwoWeekLow = 0
        averageVolume = 0
        dayHigh = 0
        dayLow = 0
        //dividendYield = 0
        netIncomeToCommon = 0
        open = 0
        marketCap = 0
    }
}
struct StockInfo: Decodable {
    let data: info
    init(){
        data = info()
    }
}
struct Message: Decodable {
  var username: String
  var message: String
}
enum RequestError: Error {
  case invalidURL
  case missingData
}


class YahooAPI{
    
//    func Getnews(company: String) -> String{
//
//
//        var ret: String = ""
//        var semaphore = DispatchSemaphore (value: 0)
//
//        var parameters = "symbol="
//        parameters = parameters + company
//        let postData =  parameters.data(using: .utf8)
//
//        var request = URLRequest(url: URL(string: "https://yahoo-finance97.p.rapidapi.com/news")!,timeoutInterval: Double.infinity)
//        request.addValue("yahoo-finance97.p.rapidapi.com", forHTTPHeaderField: "X-RapidAPI-Host")
//        request.addValue("bd48fac225msh942df97a253a250p1c5cd8jsna7f3db3ff35f", forHTTPHeaderField: "X-RapidAPI-Key")
//        request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
//
//        request.httpMethod = "POST"
//        request.httpBody = postData
//
//        let task = URLSession.shared.dataTask(with: request) { data, response, error in
//            guard let data = data else {
//                print(String(describing: error))
//                semaphore.signal()
//                return
//            }
//            ret = String(data: data, encoding: .utf8)!
//            print(String(data: data, encoding: .utf8)!)
//            semaphore.signal()
//
//        }
//
//        task.resume()
//        semaphore.wait()
//
//        return ret
//
//    }
//
//
//    func GetStockInfo(stock:String) -> String {
//        var ret: String = ""
//        var semaphore = DispatchSemaphore (value: 0)
//
//        var parameters = "symbol="
//        parameters = parameters + stock
//        let postData =  parameters.data(using: .utf8)
//
//        var request = URLRequest(url: URL(string: "https://yahoo-finance97.p.rapidapi.com/stock-info")!,timeoutInterval: Double.infinity)
//        request.addValue("yahoo-finance97.p.rapidapi.com", forHTTPHeaderField: "X-RapidAPI-Host")
//        request.addValue("bd48fac225msh942df97a253a250p1c5cd8jsna7f3db3ff35f", forHTTPHeaderField: "X-RapidAPI-Key")
//        request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
//
//        request.httpMethod = "POST"
//        request.httpBody = postData
//
//        let task = URLSession.shared.dataTask(with: request) { data, response, error in
//            guard let data = data else {
//                print(String(describing: error))
//                semaphore.signal()
//                return
//            }
//            ret = String(data: data, encoding: .utf8)!
//            print(String(data: data, encoding: .utf8)!)
//            semaphore.signal()
//
//        }
//
//        task.resume()
//        semaphore.wait()
//
//        return ret
//    }
    
    
  ///  Version 2.00
//    struct info: Decodable{
//        let address1 : String
//        let currentPrice: Double
//        init() {
//            address1 = ""
//            currentPrice = 0
//        }
//    }
//    struct StockInfo: Decodable {
//        let data: info
//        init(){
//            data = info()
//        }
//    }
//    struct Message: Decodable {
//      var username: String
//      var message: String
//    }
//    enum RequestError: Error {
//      case invalidURL
//      case missingData
//    }
//    //Function Defination
//    func performHTTPRequest(ticker: String) async throws -> StockInfo{
//        let headers = [
//            "content-type": "application/x-www-form-urlencoded",
//            "X-RapidAPI-Key": "bd48fac225msh942df97a253a250p1c5cd8jsna7f3db3ff35f",
//            "X-RapidAPI-Host": "yahoo-finance97.p.rapidapi.com"
//        ]
//        let queryticker = "symbol=" + ticker
//        let postData = NSMutableData(data: queryticker.data(using: String.Encoding.utf8)!)
//        let request = NSMutableURLRequest(url: NSURL(string: "https://yahoo-finance97.p.rapidapi.com/stock-info")! as URL,
//                                          cachePolicy: .useProtocolCachePolicy,
//                                          timeoutInterval: 10.0)
//        request.httpMethod = "POST"
//        request.allHTTPHeaderFields = headers
//        request.httpBody = postData as Data
//        let url = request as URLRequest
//        guard let (data, response) = try? await URLSession.shared.data(for: url) else {throw RequestError.invalidURL}
//        guard (response as? HTTPURLResponse)?.statusCode == 200 else {throw RequestError.invalidURL}
//        let decoder = JSONDecoder()
//        guard let jsonResponse = try? decoder.decode(StockInfo.self, from: data) else {throw RequestError.missingData}
//        return jsonResponse
//    }
//    
//    

    
    func GetStockInfo(stock:String) -> Data{
            var ret: Data = Data()
            var semaphore = DispatchSemaphore (value: 0)
            var parameters = "symbol="
            parameters = parameters + stock
            let postData =  parameters.data(using: .utf8)
            var request = URLRequest(url: URL(string: "https://yahoo-finance97.p.rapidapi.com/stock-info")!,timeoutInterval: Double.infinity)
            request.addValue("yahoo-finance97.p.rapidapi.com", forHTTPHeaderField: "X-RapidAPI-Host")
            request.addValue("bd48fac225msh942df97a253a250p1c5cd8jsna7f3db3ff35f", forHTTPHeaderField: "X-RapidAPI-Key")
            request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
            request.httpMethod = "POST"
            request.httpBody = postData
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
              guard let data = data else {
                print(String(describing: error))
                semaphore.signal()
                return
              }
              ret = data
              print(String(data: data, encoding: .utf8)!)
              semaphore.signal()
            }
            task.resume()
            semaphore.wait()
            return ret
        }
    
    
    
    
    func GetNews(stock: String) -> Data{
        
        var ret: Data = Data()
        var semaphore = DispatchSemaphore (value: 0)
        let headers = [
            "content-type": "application/x-www-form-urlencoded",
            "X-RapidAPI-Key": "bd48fac225msh942df97a253a250p1c5cd8jsna7f3db3ff35f",
            "X-RapidAPI-Host": "yahoo-finance97.p.rapidapi.com"
        ]
        
        let postData = NSMutableData(data: "symbol=\(stock)".data(using: String.Encoding.utf8)!)
        
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
                //print(String(data: data!, encoding: String.Encoding.utf8))
                ret = data!
                //print(httpResponse)
                semaphore.signal()
            }
        })
        
        dataTask.resume()
        
        semaphore.wait()
        return ret
    }

}






