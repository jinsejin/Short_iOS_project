//
//  APICaller.swift
//  Short iOS
//
//  Created by 진세진 on 2023/11/24.
//

import UIKit

struct URLLink {
    let urlLink = "http://3.35.236.83/pard/all"
}

final class APIcaller{
    
    static let shared = APIcaller()
    
    // MARK: - Create _ 데이터를 서버에 추가하는 함수
    func makePostRequest(with imgUrl: String, name: String, age: Int, part: String) {
        guard let url = URL(string: "http://3.35.236.83/pard/join") else {
            print("🚨 Invalid URL")
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let body:[String: AnyHashable] = [
            "name": name,
            "age": age,
            "part": part,
            "imgURL": imgUrl
        ]
        request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: .fragmentsAllowed)
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data = data, error == nil else {
                print("🚨 Error: \(error?.localizedDescription ?? "Unknown error")")
                return
            }
            do {
                let _ = try JSONSerialization.jsonObject(with: data, options: .allowFragments)//responds
            } catch {
                print("🚨 ", error)
            }
        }
        task.resume()
    }
    // MARK: - Update _ 특정 데이터에 대한 값을 서버에 수정하는 함수
    func makeUpdateRequest(with idName: String, name: String, age: Int, part: String, imgUrl: String) {
        guard let encodedName = idName.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) else {
            print("Encoding failed")
            return
        }

        let urlString = "http://3.35.236.83/pard/update/\(encodedName)"

        guard let url = URL(string: urlString) else {
            print("🚨 Invalid URL")
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "PATCH"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let body: [String: Any] = [
            "name": name,
            "age": age,
            "part": part,
            "imgURL": imgUrl
        ]

        request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: .fragmentsAllowed)

        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data = data, error == nil else {
                print("🚨 \(error?.localizedDescription ?? "Unknown error")")
                return
            }
            do {
                let _ = try JSONSerialization.jsonObject(with: data, options: .allowFragments)//responds
            } catch {
                print("🚨 ", error)
            }
        }
        task.resume()
    }
    // MARK: - deleteRequest
    func deleteRequest(name: String) {
        let urlString = "http://3.35.236.83/pard/delete/\(name)".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        
        guard let url = URL(string: urlString!) else {
            print("🚨 Invalid URL")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "DELETE"

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("🚨 Error: \(error.localizedDescription)")
            } else if let data = data {
                do {
                    let _ = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
                } catch {
                    print("🚨 Error during JSON serialization: \(error.localizedDescription)")
                }
            }
        }
        task.resume()
    }
    // MARK: - uploadImage - imageurl Upload하는 것
    func uploadImage(image: UIImage, name: String ) {
        var _ : String?
        
        guard let imageData = image.jpegData(compressionQuality: 0.5) else {
            print("Failed to convert image to data")
            return
        }
        
        let url = URL(string: "http://3.35.236.83/image")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"

        let boundary = UUID().uuidString
        request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")

        var body = Data()
        body.append("\r\n--\(boundary)\r\n".data(using: .utf8)!)
        body.append("Content-Disposition: form-data; name=\"image\"; filename=\"\(name).jpg\"\r\n".data(using: .utf8)!)
        body.append("Content-Type: image/jpeg\r\n\r\n".data(using: .utf8)!)
        body.append(imageData)
        body.append("\r\n--\(boundary)--\r\n".data(using: .utf8)!)
        request.httpBody = body

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error uploading image: \(error)")
                return
            }
            guard let data = data, let _ = response, let imageURLString = String(data: data, encoding: .utf8) else{
                print("🚨 Invalid response format. Expected a string.")
                return
            }
            
            print("✅ Image uploaded successfully. Image URL: \(imageURLString)")
            _ = imageURLString
        }
        task.resume()
    }
    
}

