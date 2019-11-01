

import Foundation

struct Mixer {
    let identifier: Int
    let name: String
    let detail: String
    let location: String
    let thumbnail: String
    let attendeeRating: Int
}

// MARK: - Support for loading data from plist

extension Mixer {
    
    static func loadAllMixers() -> [Mixer] {
        return loadMixers(from: "Mixers")
    }
    
    fileprivate static func loadMixers(from plistName: String) -> [Mixer] {
        guard
            let path = Bundle.main.path(forResource: plistName, ofType: "plist"),
            let dictArray = NSArray(contentsOfFile: path) as? [[String : AnyObject]]
            else {
                fatalError("An error occurred while reading \(plistName).plist")
        }
        
        var mixers = [Mixer]()
        
        for dict in dictArray {
            guard
                let identifier = dict["identifier"] as? Int,
                let name = dict["name"] as? String,
                let detail = dict["detail"] as? String,
                let location = dict["location"] as? String,
                let thumbnail = dict["thumbnail"] as? String,
                let attendeeRating = dict["attendeeRating"] as? Int
                else {
                    fatalError("Error parsing dict \(dict)")
            }
            
            let mixer = Mixer(
                identifier: identifier,
                name: name,
                detail: detail,
                location: location,
                thumbnail: thumbnail,
                attendeeRating: attendeeRating
            )
            
            mixers.append(mixer)
        }
        
        return mixers
    }
}
