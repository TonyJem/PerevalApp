import Foundation

class MountainPassModel {
    private var title: String?
    private var date = ""
//    private var currentUser: User?
//    private var category = ""
//    private var isMarkedWithStar = false
//    private var isNotSureSelected = false
//    private var isEstimatedSelected = false
    
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
}
