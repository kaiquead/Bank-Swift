//
//  REST.swift
//  ListaDeCompras
//
//  Created by Kaique Alves on 27/01/20.
//  Copyright © 2020 Kaique Alves. All rights reserved.
//

import Foundation

enum BankError{
    case url
    case taskError(error: Error)
    case noResponse
    case noData
    case responseStatusCode(Code: Int)
    case invalidJSON
}


class REST{
    

    private static let basePath = "https://simple-bank.herokuapp.com/bank"
    private static let basePathLogin = "https://simple-bank.herokuapp.com/auth"
    
    private static let configuration: URLSessionConfiguration = {
        let config = URLSessionConfiguration.default
        config.httpAdditionalHeaders = ["Content-Type": "application/json"] //ja entende que é um json
        config.timeoutIntervalForRequest = 30.0 //tempo maximo de espera para uma requisicao
        config.httpMaximumConnectionsPerHost = 5 //maximo de conexoes simultaneas da sessao
        return config
    }()

    private static let session = URLSession(configuration: configuration)          //poderia usar o URLSession.shared
    
    class func loadBank(onComplete: @escaping ([Bank])->Void, onError: @escaping(BankError) ->Void){
        guard let url = URL(string: basePath) else {
            onError(.url)
            return}
        let dataTask = session.dataTask(with: url) { (data: Data?, response: URLResponse?, error: Error?) in
            if error == nil{
                guard let response = response  as? HTTPURLResponse else {
                    onError(.noResponse)
                    return}
                if response.statusCode == 200{
                    guard let data = data else {return}
                    do{
                        //let banks = try JSONDecoder().decode([Bank].self, from: data)
                        let banks = try JSONDecoder().decode([Bank].self, from: data)
                        onComplete(banks)
                        for bank in banks{
                            print (bank.account, bank.owner, bank.password, bank.value)
                        }
                    } catch{
                        print(error.localizedDescription)
                        onError(.invalidJSON)
                    }
                }else{
                    print ("Algum status inválido pelo servidor")
                    onError(.responseStatusCode(Code: response.statusCode))
                }
            }
            else{
                onError(.taskError(error: error!))
            }
        }
        dataTask.resume()
    }
    
    class func login (bank: Bank, onComplete: @escaping (Bool)->Void){
        guard let url = URL(string: basePathLogin) else {
        onComplete(false)
        return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        guard let json = try? JSONEncoder().encode(bank) else {
            onComplete(false)
            return
        }
        
        request.httpBody = json
        let dataTask = session.dataTask(with: request) { (data, response, error) in
            if error == nil{
                guard let response = response as? HTTPURLResponse,  let _ = data else{
                    onComplete(false)
                    return
                }
                if(response.statusCode==200){
                    print (response.statusCode)
                    onComplete(true)
                }
                else{
                    print (response.statusCode)
                    onComplete(false)
                }
                
            } else{
                onComplete(false)
            }
        }
        dataTask.resume()
    }
    
}

