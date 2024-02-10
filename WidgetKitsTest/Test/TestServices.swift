//
//  TestServices.swift
//  WidgetKitsTest
//
//  Created by Mohammad Afshar on 05/02/2024.
//

import Foundation

struct TestServices {
    func getTestData() async {
        do {
            let (rawData, _) = try await URLSession.shared.data(from: URL(string: "https://hamrahplus23.bankmellat.ir/mcpn/config")!)
            print(String(data: rawData, encoding: .utf8) ?? "")
            let data = try JSONDecoder().decode([Response].self, from: rawData)
            
            print("type is : \(type(of: data))")
            print(data)
        } catch {
            print("\n\n error \(error)")
        }
    }
}

enum Response: Decodable {
    case configCardPayment(ConfigCardPaymentDTO)
    case bankList(BankListDTO)
    
    enum CodingKeys: CodingKey {
        case configCardPayment
        case bankList
    }
    
    enum ConfigCardPaymentCodingKeys: CodingKey {
    }
    
    enum BankListCodingKeys: CodingKey {
    }
    
    struct ConfigCardPaymentDTO: Decodable {
        let configId: Int
        let configItems: [ConfigItem]
    }
    
    struct ConfigItem: Decodable {
        let a: String
        let b: String
        let c: String
        let d: String
        let e: String
        let f: String
        let g: Int
        let h: String
        let i: Bool
    }
    
    struct BankListDTO: Decodable {
        let bankList: [String]
    }
    
    init(from decoder: Decoder) throws {
        let container = try? decoder.singleValueContainer()
        if let configCardPayment = try? container?.decode(ConfigCardPaymentDTO.self) {
            self = .configCardPayment(configCardPayment)
        } else if let bankList = try? container?.decode(BankListDTO.self) {
            self = .bankList(bankList)
        } else {
            throw DecodingError.typeMismatch(Response.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: ""))
        }
    }
    
    /*
    init(from2 decoder2: Decoder) throws {
        let container = try decoder2.container(keyedBy: CodingKeys.self)
        var allKeys = ArraySlice(container.allKeys)
        guard let onlyKey = allKeys.popFirst(), allKeys.isEmpty else {
            throw DecodingError.typeMismatch(Response.self, DecodingError.Context.init(codingPath: container.codingPath, debugDescription: "Invalid number of keys found, expected one.", underlyingError: nil))
        }
        switch onlyKey {
            case .configCardPayment:
                let nestedContainer = try container.nestedContainer(keyedBy: Response.ConfigCardPaymentCodingKeys.self, forKey: .configCardPayment)
                self = Response.configCardPayment(<#Response.ConfigCardPaymentDTO#>)
            case .bankList:
                let nestedContainer = try container.nestedContainer(keyedBy: Response.BankListCodingKeys.self, forKey: .bankList)
                self = Response.bankList(<#Response.BankListDTO#>)
        }
    }
     */
}

/*
 [
   {
     "type": "book",
     "title": "The Hitchhiker's Guide to the Galaxy",
     "author": "Douglas Adams",
     "year": 1979
   },
   {
     "type": "movie",
     "title": "The Matrix",
     "director": "The Wachowskis",
     "year": 1999
   },
   {
     "type": "song",
     "title": "Bohemian Rhapsody",
     "artist": "Queen",
     "year": 1975
   }
 ]

 // A custom enum that represents different types of media
 enum Media: Decodable {
   case book(title: String, author: String, year: Int)
   case movie(title: String, director: String, year: Int)
   case song(title: String, artist: String, year: Int)
   
   // A custom initializer that takes a decoder as an argument
   init(from decoder: Decoder) throws {
     // Get a single value container from the decoder
     let container = try decoder.singleValueContainer()
     // Decode a dictionary from the container
     let dict = try container.decode([String: Any].self)
     // Decode the type from the dictionary
     guard let type = dict["type"] as? String else {
       throw DecodingError.dataCorruptedError(in: container, debugDescription: "Missing type")
     }
     // Switch on the type and decode the corresponding properties
     switch type {
     case "book":
       guard let title = dict["title"] as? String,
             let author = dict["author"] as? String,
             let year = dict["year"] as? Int else {
         throw DecodingError.dataCorruptedError(in: container, debugDescription: "Invalid book properties")
       }
       self = .book(title: title, author: author, year: year)
     case "movie":
       guard let title = dict["title"] as? String,
             let director = dict["director"] as? String,
             let year = dict["year"] as? Int else {
         throw DecodingError.dataCorruptedError(in: container, debugDescription: "Invalid movie properties")
       }
       self = .movie(title: title, director: director, year: year)
     case "song":
       guard let title = dict["title"] as? String,
             let artist = dict["artist"] as? String,
             let year = dict["year"] as? Int else {
         throw DecodingError.dataCorruptedError(in: container, debugDescription: "Invalid song properties")
       }
       self = .song(title: title, artist: artist, year: year)
     default:
       throw DecodingError.dataCorruptedError(in: container, debugDescription: "Unknown type \(type)")
     }
   }
 }

 // A JSON string that contains an array of different types of media
 let json = "[{\"type\": \"book\",\"title\": \"The Hitchhiker's Guide to the Galaxy\",\"author\": \"Douglas Adams\",\"year\": 1979},{\"type\": \"movie\",\"title\": \"The Matrix\",\"director\": \"The Wachowskis\",\"year\": 1999},{\"type\": \"song\",\"title\": \"Bohemian Rhapsody\",\"artist\": \"Queen\",\"year\": 1975}]"

 // Decode the JSON string to an array of Media objects
 let media = try JSONDecoder().decode([Media].self, from: json.data(using: .utf8)!)

 // Print the media objects
 print(media)

 */

/*
 // A custom type that represents a weather report
 struct Weather: Decodable {
     let temperature: Double
     let humidity: Double
     let windSpeed: Double
     
     // A custom initializer that takes a decoder as an argument
     init(from decoder: Decoder) throws {
         // Get a single value container from the decoder
         let container = try decoder.singleValueContainer()
         // Decode a dictionary from the container
         let dict = try container.decode([String: Any].self)
         // Access the values using the keys
         self.temperature = dict["temperature"] as? Double ?? 0.0
         self.humidity = dict["humidity"] as? Double ?? 0.0
         self.windSpeed = dict["windSpeed"] as? Double ?? 0.0
     }
 }

 // A JSON string that contains a weather report
 let json = "{\"temperature\": 25.0, \"humidity\": 0.6, \"windSpeed\": 5.0}"

 // Decode the JSON string to a Weather object
 let weather = try JSONDecoder().decode(Weather.self, from: json.data(using: .utf8)!)

 // Print the weather object
 print(weather)

*/

/*
 [
   {
     "type": "number",
     "value": 42
   },
   {
     "type": "string",
     "value": "Hello"
   },
   {
     "type": "boolean",
     "value": true
   }
 ]

 enum Data: Decodable {
   case number(Int)
   case string(String)
   case boolean(Bool)
   
   init(from decoder: Decoder) throws {
     let container = try decoder.singleValueContainer()
     let dict = try container.decode([String: Any].self)
     guard let type = dict["type"] as? String else {
       throw DecodingError.dataCorruptedError(in: container, debugDescription: "Missing type")
     }
     switch type {
     case "number":
       guard let value = dict["value"] as? Int else {
         throw DecodingError.dataCorruptedError(in: container, debugDescription: "Invalid number value")
       }
       self = .number(value)
     case "string":
       guard let value = dict["value"] as? String else {
         throw DecodingError.dataCorruptedError(in: container, debugDescription: "Invalid string value")
       }
       self = .string(value)
     case "boolean":
       guard let value = dict["value"] as? Bool else {
         throw DecodingError.dataCorruptedError(in: container, debugDescription: "Invalid boolean value")
       }
       self = .boolean(value)
     default:
       throw DecodingError.dataCorruptedError(in: container, debugDescription: "Unknown type \(type)")
     }
   }
 }

 */
