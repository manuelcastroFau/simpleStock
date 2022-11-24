//
//  YahooAPI.swift
//  simpleStock
//
//  Created by Annas Waheed on 11/18/22.
//

import Foundation

struct info: Decodable{
    let address1 : String
    let currentPrice: Double
    init() {
        address1 = ""
        currentPrice = 0
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
    
    
}






