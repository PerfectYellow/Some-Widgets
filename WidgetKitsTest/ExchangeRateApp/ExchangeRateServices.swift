//
//  ExchangeRateServices.swift
//  WidgetKitsTest
//
//  Created by Mohammad Afshar on 02/02/2024.
//
//  "https://api.exchangerate.host/convert?from=USD&to=EUR&amount=1"

import Foundation

enum NetworkError: Error {
    case statusCodeError
}

extension NetworkError: LocalizedError {
    var errorDescription: String? {
        switch self {
            case .statusCodeError:
                NSLocalizedString("", comment: "")
        }
    }
    
    var failureReason: String? {
        switch self {
            case .statusCodeError:
                NSLocalizedString("", comment: "")
        }
    }
    
    var recoverySuggestion: String? {
        switch self {
            case .statusCodeError:
                NSLocalizedString("", comment: "")
        }
    }
}

extension NetworkError: CustomNSError {
    static var errorDomain: String {
        return "network service domain"
    }
    
    var errorCode: Int {
        switch self {
            case .statusCodeError:
                return 403
        }
    }
    
    var errorUserInfo: [String : Any] {
        switch self {
            case .statusCodeError:
                return ["ExchangeRateServices->getCurrentRate->line" : 56]
        }
    }
}

struct ExchangeRateServices {
    
    func getCurrentRate(from: String, to: String, amount: Int) async throws -> ExchangeRate {
        let url = URL(string: "https://api.exchangerate.host/convert?from=\(from)&to=\(to)&amount=\(amount)")!
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            throw NetworkError.statusCodeError
        }
        
        let exchange = try JSONDecoder().decode(ExchangeRate.self, from: data)
        
        return exchange
    }
}

