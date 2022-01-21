//
//  AdviceRequest.swift
//  AdviceApp
//
//  Created by Camila Ribeiro Rodrigues on 17/01/22.
//

import Foundation

enum AdviceRequest: RequestModel {
	
	case fetchAllRequests
	case saveAdvices
	
	var params: APIParams {
		return nil
	}
	
	var headers: APIHeaders {
		return nil
	}
	
	var method: String {
		switch self {
		case .fetchAllRequests: return "GET"
		case .saveAdvices: return "PUT"
		}
	}
	
	var endPoint: String {
		switch self {
		case .fetchAllRequests: return "advice"
		case .saveAdvices: return "save/advice"
		}
	}
}
