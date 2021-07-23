//
//  IPFinderNetwork.swift
//  IPFinder
//
//  Created by Angelos Staboulis on 24/7/21.
//

import Foundation
import Alamofire
import SwiftyJSON
class IPFinderNetwork{
    var ipArray = [IPModel]()
    static let shared = IPFinderNetwork()
    private init(){
        
    }
    func fetchIPDetails(completion:@escaping ([IPModel])->()){
        let urlMain = URL(string: "https://ipapi.co/json/")
        let urlRequest = URLRequest(url: urlMain!)
        AF.request(urlRequest).responseJSON { (dataResponse) in
            let json = JSON(dataResponse.value!)
            let model = IPModel(id:"ip", ip: json["ip"].stringValue, version:  json["version"].stringValue, city: json["city"].stringValue, region:  json["region"].stringValue, region_code: json["region_code"].stringValue, country:  json["country"].stringValue, country_name:  json["country_name"].stringValue, country_code: json["country_code"].stringValue, country_code_iso3: json["country_code_iso3"].stringValue, country_capital:  json["country_capital"].stringValue, country_tld:    json["country_tld"].stringValue, continent_code:json["continent_code"].stringValue, in_eu: json["in_eu"].boolValue, postal: json["postal"].stringValue, latitude: json["latitude"].doubleValue, longitude:  json["longtitude"].doubleValue, timezone:   json["timezone"].stringValue, utc_offset: json["utc_offset"].stringValue, country_calling_code: json["country_calling_code"].stringValue, currency:json["currency"].stringValue, currency_name:json["currency_name"].stringValue, languages:  json["languages"].stringValue, country_area: json["country_area"].stringValue, country_population:  json["country_population"].stringValue, asn:  json["asn"].stringValue, org: json["org"].stringValue)
            self.ipArray.append(model)
            completion(self.ipArray)
    
        }
    }
}
