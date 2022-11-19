//
//  YahooAPI.swift
//  simpleStock
//
//  Created by Annas Waheed on 11/18/22.
//

import Foundation
class YahooAPI{
    
    func Getnews(company: String) -> String{
        var ret: String = ""
        var semaphore = DispatchSemaphore (value: 0)

        var parameters = "symbol="
        parameters = parameters + company
        let postData =  parameters.data(using: .utf8)

        var request = URLRequest(url: URL(string: "https://yahoo-finance97.p.rapidapi.com/news")!,timeoutInterval: Double.infinity)
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
         ret = String(data: data, encoding: .utf8)!
         print(String(data: data, encoding: .utf8)!)
          semaphore.signal()
         
        }

        task.resume()
        semaphore.wait()
        
        return ret
        
    }
    
    
    
    
    
    
    
    
    
    func GetStockInfo(stock:String) -> String{
        var ret: String = ""
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
         ret = String(data: data, encoding: .utf8)!
         print(String(data: data, encoding: .utf8)!)
          semaphore.signal()
         
        }

        task.resume()
        semaphore.wait()
        
        return ret
    }
}




