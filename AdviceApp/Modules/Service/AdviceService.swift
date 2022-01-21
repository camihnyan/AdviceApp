//
//  AdviceService.swift
//  AdviceApp
//
//  Created by Camila Ribeiro Rodrigues on 17/01/22.
//

import Foundation

protocol AdviceServicesProtocol {
	func fetchAllAdvices(completion: @escaping (Result<AdviceModel, ErrorModel>) -> Void )
}

class AdviceServices: AdviceServicesProtocol {
	
	private let serviceLayer: ServiceLayerProtocol
	
	init(serviceLayer: ServiceLayerProtocol) {
		self.serviceLayer = serviceLayer
	}
	
	func fetchAllAdvices(completion: @escaping (Result<AdviceModel, ErrorModel>) -> Void) {
		let request = AdviceRequest.fetchAllRequests
		serviceLayer.sendRequest(type: AdviceModel.self, requestModel: request) { result in
			completion(result)
			print(result)
		}
	}
}
