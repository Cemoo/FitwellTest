//
//  BaseViewModel.swift
//  FitwellTest
//
//  Created by Erencan Evren on 8.07.2018.
//  Copyright © 2018 Cemal BAYRI. All rights reserved.
//

import Foundation

class BaseViewModel: getDelegate {
    
    func getIt<T: Decodable>(_ fileName: String, _ object: T, completion: @escaping (T?) -> ()) {
        if let path = Bundle.main.path(forResource: fileName, ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let object = try! JSONDecoder().decode(T.self, from: data)
                completion(object)
            } catch {
                completion(nil)
            }
        }
    }
}
protocol getDelegate {
    func getIt<T: Decodable>(_ fileName: String, _ object: T, completion: @escaping (T?) -> ())
}

extension getDelegate {
    func getThem<T: Decodable>(_ fileName: String, _ object: T, completion: @escaping ([T]?) -> ()) {
        if let path = Bundle.main.path(forResource: fileName, ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let objArray = try! JSONDecoder().decode([T].self, from: data)
                completion(objArray)
            } catch {
                completion(nil)
            }
        }
    }
}

