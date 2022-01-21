//
//  ServiceLayerProtocol.swift
//  AdviceApp
//
//  Created by Camila Ribeiro Rodrigues on 17/01/22.
//

import Foundation

protocol ServiceLayerProtocol {
	func sendRequest<T: Codable>(type: T.Type, requestModel: RequestModel, completion: @escaping (Result<T, ErrorModel>) -> Void)
}
