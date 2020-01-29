//
//  ViewController.swift
//  noidaApp
//
//  Created by R Shantha Kumar on 1/25/20.
//  Copyright © 2020 R Shantha Kumar. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    
    @IBOutlet weak var tablevieqw3: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return churche.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tablevieqw3.dequeueReusableCell(withIdentifier: "abcdf") as! TableViewCell23
        
        
        cell.id.text = ids[indexPath.row]
        cell.diascrptityon.text = discriptionz[indexPath.row]
        cell.address.text = address[indexPath.row]
        cell.id.numberOfLines = 0
        cell.diascrptityon.numberOfLines = 0
        cell.address.numberOfLines = 0
        cell.imageview34.image = churchImages56[indexPath.row]
       
        
        cell.heightAnchor.constraint(equalToConstant: 577).isActive = true
        cell.widthAnchor.constraint(lessThanOrEqualToConstant: 414).isActive = true
        return cell
    }
    

    var data567:[String:Any]!
    
    
    var churche = [String]()
    var ids = [String]()
    var address = [String]()
    var discriptionz = [String]()
    
    var churchImages56 = [UIImage]()
 
    override func viewDidLoad() {
        super.viewDidLoad()
       
//        Alamofire.request(.POST, "http://appwebprojects.com/TestAPI/api/testApi", parameters: ["IdQuiz":"102","IdUser":"iOSclient","User":"iOSClient","List":list ], encoding: .JSON)
//            .response { request, response, data, error in
//            let dataString = NSString(data: data!, encoding:NSUTF8StringEncoding)
//                println(dataString)
//        }
        
        tablevieqw3.delegate = self
        tablevieqw3.dataSource = self
        var nib = UINib(nibName: "TableViewCell23", bundle: nil)
        
        tablevieqw3.register(nib, forCellReuseIdentifier: "abcdf")
        
        
        callAPI()
       fetching()
  
        
        
        

    }
    
    func fetching(){
        
        data567 = callAPI()
        

        
        let churchDAta = data567["data"] as! [[String:Any]]
        
        for i in churchDAta
        {
            
        
            let churchName = i["title"] as! String
            
            churche.append(churchName)
            
            let id = i["id"] as! String
            
            ids.append("\(id)")
            
            var addresst = i["address"] as! String
            
            address.append(addresst)
            
            var discrptiong = i["description"] as! String
            discriptionz.append(discrptiong)
            
         var churchIMageStrig = i["logo"] as! String
            
            
            
            do {
                var churchURL = URL(string: churchIMageStrig)
                let churchData = try Data(contentsOf: churchURL!)
                
                let churchImages = UIImage(data: churchData)
                
                churchImages56.append(churchImages!)
                
            }
            catch{
                
                
            }
            
            print(id)
        }
        




        }

    
    
var url = "http://appwebprojects.com/TestAPI/api/testApi"
    
//    func data(){
//
//
//
//
//
//
//       var urlRequst = URLRequest(url: URL(string:"http://appwebprojects.com/TestAPI/api/testApi")!)
//
//        let session = URLSession.init(configuration: URLSessionConfiguration.default)
//
//
////        urlRequst?.addValue("application/json", forHTTPHeaderField:"APPKEY:V0XpSCOFVXiEd2nAuMPdbQc/rDdRDPdkbPSV5EU4eEHnM9eMttFh1F7EzaCRMQhmopme3CF5g4WHXVdt3og9kS")
//
//
//        urlRequst.setValue("V0XpSCOFVXiEd2nAuMPdbQc/rDdRDPdkbPSV5EU4eEHnM9eMttFh1F7EzaCRMQhmopme3CF5g4WHXVdt3og9kS", forHTTPHeaderField: "APPKEY")
//        urlRequst.setValue("api", forHTTPHeaderField: "Access-Control-Allow-Origin")
//        urlRequst.setValue("application/json", forHTTPHeaderField: "Content-Type")
//        var   dataTask = session.dataTask(with: urlRequst){ (data,respoms,error) in
//            if(error == nil){
//                           let convertedData = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
//
//                       print(convertedData)
//                       }
//                       else{
//                           print("Sfdsf")
//
//                       }
//            }
//
//
//
//
//
//
//        dataTask.resume()
//    }

    
    func callAPI() -> [String:Any] {
            
            
        var responses:[String:Any]!
        
            var request = URLRequest(url: URL(string: url)!)
            request.setValue("api", forHTTPHeaderField: "Access-Control-Allow-Origin")
            request.setValue("V0XpSCOFVXiEd2nAuMPdbQc/rDdRDPdkbPSV5EU4eEHnM9eMttFh1F7EzaCRMQhmopme3CF5g4WHXVdt3og9kS", forHTTPHeaderField: "APPKEY")
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let DataTask = URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) in
      
            do {
                     responses = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments) as! [String:Any]
                
                print(responses)
                
                } catch {
                    print("nopt getting")
                }
            })
            DataTask.resume()
        
        while responses == nil {
            
        }
        return responses!
        }
    }
    
    
    


