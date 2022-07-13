//
//  P_multipartformdata.swift
//  OpenMarket
//
//  Created by 변재은 on 2022/07/13.
//

import Foundation

func requestIdentify() {
       guard let sendData = imgObservable.value else {
           return
       }
       let boundary = generateBoundaryString()
       let body: [String: String] = ["userName": userName]
       let bodyData = createBody(parameters: body,
                                 boundary: boundary,
                                 data: sendData,
                                 mimeType: "image/jpg",
                                 filename: "identifyImage.jpg")

       service.requestIdentifys(boundary: boundary, bodyData: bodyData) { response in
           switch response {
           case .success(let statusCode):
               print(statusCode)
           case .failed(let err):
               print(err)
           }
       }
   }
   
   private func generateBoundaryString() -> String {
       return "Boundary-\(UUID().uuidString)"
   }
   
   private func createBody(parameters: [String: String],
                           boundary: String,
                           data: Data,
                           mimeType: String,
                           filename: String) -> Data {
       var body = Data()
       let imgDataKey = "img"
       let boundaryPrefix = "--\(boundary)\r\n"
       
       for (key, value) in parameters {
           body.append(boundaryPrefix.data(using: .utf8)!)
           body.append("Content-Disposition: form-data; name=\"\(key)\"\r\n\r\n".data(using: .utf8)!)
           body.append("\(value)\r\n".data(using: .utf8)!)
       }
       
       body.append(boundaryPrefix.data(using: .utf8)!)
       body.append("Content-Disposition: form-data; name=\"\(imgDataKey)\"; filename=\"\(filename)\"\r\n".data(using: .utf8)!)
       body.append("Content-Type: \(mimeType)\r\n\r\n".data(using: .utf8)!)
       body.append(data)
       body.append("\r\n".data(using: .utf8)!)
       body.append("--".appending(boundary.appending("--")).data(using: .utf8)!)
       
       return body as Data
   }
