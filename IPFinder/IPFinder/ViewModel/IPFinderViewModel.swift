//
//  IPFinderViewModel.swift
//  IPFinder
//
//  Created by Angelos Staboulis on 24/7/21.
//

import Foundation

class IPFinderViewModel{
    var apishared:IPFinderNetwork!
    init(){
        apishared = IPFinderNetwork.shared
    }
    func fetchIPDetails(completion:@escaping ([IPModel])->()){
        apishared.fetchIPDetails { (array) in
            completion(array)
        }
    
        
    }
}
