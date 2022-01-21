//
//  ServiceLayer.swift
//  AdviceApp
//
//  Created by Camila Ribeiro Rodrigues on 17/01/22.
//

import Foundation

import Foundation

class ServiceLayer: ServiceLayerProtocol {
	
	private let urlSession = URLSession.shared
	
	func sendRequest<T: Codable>(type: T.Type, requestModel: RequestModel, completion: @escaping (Result<T, ErrorModel>) -> Void) {
		
		var request = URLRequest(url: requestModel.url)
		request.httpMethod = requestModel.method
		request.allHTTPHeaderFields = requestModel.headers
		
		let task = urlSession.dataTask(with: request) { (data, response, error) in
			
			let response = response as? HTTPURLResponse
			guard response?.statusCode == 200,
				  let data = data,
				  let responseModel = try? JSONDecoder().decode(T.self, from: data)
			else {
				completion(.failure(.genericError))
				return
			}
			
			completion(Result.success(responseModel))
		}
		
		task.resume()
	}
}
