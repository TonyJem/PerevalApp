import Foundation

class MountainPassModel {
    // MARK: - Properties
    private var title: String?
    private var date = ""
    private var category: String?
    
    var isMarkedWithStar = false
    var isNotSureSelected = false
    var isEstimatedSelected = false
    
    private var coordinates = Coords(latitude: "",  // format example latitude: "N 55 36.4999" or S
                             longitude: "",         // format example longitude: "E 37 18.2332" or W
                             height: "")            // format example height: "1800"
    
    // MARK: - Public Methods
    func setTitle(_ text: String?) {
        title = text
    }
    
    func getTitle() -> String {
        guard let title = title else {
            return ""
        }
        return title
    }
    
    func setDate(_ dateSting: String) {
        date = dateSting
    }
    
    func getDate() -> String {
        return date
    }
    
    func setCategory(_ value: String) {
        
        var newCategory = value
        
        if newCategory.last == "*" {
            newCategory.removeLast()
        }
        
        guard !newCategory.isEmpty,
              newCategory != category else {
            category = nil
            return
        }
        
        category = newCategory
    }
    
    func getCategory() -> String? {
        return category
    }
    
    func setCoordinates(_ coords: Coords) {
        coordinates = coords
    }
    
    func getCoordinates() -> Coords {
        return coordinates
    }
}
