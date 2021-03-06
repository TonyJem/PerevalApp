import Foundation

class APIService {
    
    func testPostMountainPass() {
        
        let coordinates = Coords(latitude: "45.3842",
                                 longitude: "7.1525",
                                 height: "1200")
        
        let level = Level(winter: "",
                          summer: "1A",
                          autumn: "1A",
                          spring: "")
        
        let image1 = Image(url: "http://...1",
                           title: "Подъём. Фото №1")
        let image2 = Image(url: "http://...2",
                           title: "Подъём. Фото №2")
        let image3 = Image(url: "http://...3",
                           title: "Подъём. Фото №3")
        
        let images = [image1, image2, image3]
        
        let user = User(id: 0,
                        email: "email@example.com",
                        phone: "8-987-654-43-21",
                        fam: "testSchwarzenegger",
                        name: "Arnold")
        
        let newMountainPass = MountainPass(beautyTitle: "пер.",
                                           title: "MonkeyHereTest",
                                           otherTitles: "Триев",
                                           connect: "",
                                           addTime: "2021-09-22 13:18:13",
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
    
    func postRequestWith(mountainPass: MountainPass) {
        
        let url = URL(string: "https://pereval2602.herokuapp.com/api/v1/pereval/")
        guard let requestUrl = url else {
            print("🔴 Can't create requestUrl")
            return
        }
        
        var request = URLRequest(url: requestUrl)
        request.httpMethod = "POST"
        
        // Set HTTP Request Header
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        guard let jsonData = try? JSONEncoder().encode(mountainPass) else {
            print("🔴 Can't create jsonData")
            return
        }
        
        request.httpBody = jsonData
        
        let session = URLSession.shared
        
        
        session.dataTask(with: request) { (data, response, error) in
            
            if let response = response {
                print("🟢 Response: \(response)")
            }
            
            guard let data = data else {
                print("🔴 Can't create ResponseData")
                return
            }
            
            do {
                let mountainPass = try JSONDecoder().decode(MountainPass.self, from: data)
                print("🟢🟢🟢 Response data:\n \(mountainPass)")
                
            } catch {
                print("🔴 Error: \(error)")
            }
        }.resume()
    }
}
