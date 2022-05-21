import Foundation

class APIService {
    
    func postMountainPass(title: String,
                          date: String,
                          user: User,
                          coordinates: Coords,
                          category: String,
                          images: [Image]) {
        
        let level = Level(winter: "",
                          summer: category,
                          autumn: category,
                          spring: "")
        
        let newMountainPass = MountainPass(beautyTitle: "пер.",
                                           title: title,
                                           otherTitles: "",
                                           connect: "",
                                           addTime: date,
                                           user: user,
                                           coords: coordinates,
                                           type: "pass",
                                           level: level,
                                           images: images)
        
        let url = URL(string: "https://pereval2602.herokuapp.com/api/v1/pereval/")
        guard let requestUrl = url else { return }
        
        var request = URLRequest(url: requestUrl)
        request.httpMethod = "POST"
        
        // Set HTTP Request Header
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        guard let jsonData = try? JSONEncoder().encode(newMountainPass) else { return }
        
        request.httpBody = jsonData
        
        let session = URLSession.shared
        
        
        session.dataTask(with: request) { (data, response, error) in
            
            if let response = response {
                print("🟢 Response: \(response)")
            }
            
            guard let data = data else {return}
            
            do {
                let mountainPass = try JSONDecoder().decode(MountainPass.self, from: data)
                print("🟢🟢🟢 Response data:\n \(mountainPass)")
                
            } catch {
                print("🔴 Error: \(error)")
            }
        }.resume()
    }

}



