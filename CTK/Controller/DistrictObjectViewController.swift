//
//  ObjectsViewController.swift
//  CTK
//
//  Created by Temirlan Merekeyev on 2/3/19.
//  Copyright © 2019 Temirlan Merekeyev. All rights reserved.
//

import UIKit
import Moya

enum ObjectType {
    case audit
    case district
    case history
}

class DistrictObjectViewController: UIViewController {
    
    
    var id : Int?
    @IBOutlet weak var tableView: UITableView!
    private var provider = MoyaProvider<MainService>()
    var districtObjects = [DistrictObject]()
    var objects = [Object]()
    var type = ObjectType.district
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        guard let id = id else {return}
        loadData(id: id)
    }
    
    
    private func setup() {
        tableView.backgroundColor = UIColor.groupTableViewBackground
        tableView.delegate = self
        tableView.dataSource = self
        switch type {
        case .audit:
            tableView.register(UINib(nibName: "DistrictObjectTableViewCell", bundle: nil), forCellReuseIdentifier: "DistrictObjectTableViewCell")
        case .district:
            tableView.register(UINib(nibName: "ObjectTableViewCell", bundle: nil), forCellReuseIdentifier: "ObjectTableViewCell")
        case .history:
            tableView.register(UINib(nibName: "HistoryTableViewCell", bundle: nil), forCellReuseIdentifier: "HistoryTableViewCell")
        }
        self.navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.8666666667, green: 0.1176470588, blue: 0.1607843137, alpha: 1)
        self.navigationController?.title = "Объекты"
        self.navigationController?.navigationBar.tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }
    
    private func loadData(id: Int) {
        switch type {
        case .history:
            provider.request(.history(id)) { [weak self](result) in
                guard let strongSelf = self else {return}
                switch result{
                case .success(let response):
                    do{
                        guard let jsons = try response.mapJSON() as? [[String : Any]] else {return}
                        jsons.map({strongSelf.objects.append(Object(JSON: $0)!)})
                        strongSelf.tableView.reloadData()
                    }catch{
                        print("error")
                    }
                    
                case .failure(let error):
                    print("Error \(error.localizedDescription)")
                }
            }
        default:
            provider.request(.districtObjects(id)) { [weak self](result) in
                guard let strongSelf = self else {return}
                switch result{
                case .success(let response):
                    do{
                        guard let jsons = try response.mapJSON() as? [[String : Any]] else {return}
                        jsons.map({strongSelf.districtObjects.append(DistrictObject(JSON: $0)!)})
                        strongSelf.tableView.reloadData()
                    }catch{
                        print("error")
                    }
                    
                case .failure(let error):
                    print("Error \(error.localizedDescription)")
                }
            }
        }
        
    }

}

extension DistrictObjectViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch type{
        case .history:
            return objects.count
        default:
            return districtObjects.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch type {
        case .district:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ObjectTableViewCell", for: indexPath) as? ObjectTableViewCell else {fatalError()}
            cell.districtObject = districtObjects[indexPath.row]
            cell.historyClicked = { [weak self] in
                guard let strongSelf = self, let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DistrictObjectViewController") as? DistrictObjectViewController else {return}
                vc.type = .history
                vc.id   = strongSelf.districtObjects[indexPath.row].id
                strongSelf.navigationController?.pushViewController(vc, animated: true)
            }
            return cell
        case .audit:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "DistrictObjectTableViewCell", for: indexPath) as? DistrictObjectTableViewCell else {fatalError()}
            cell.districtObject = districtObjects[indexPath.row]
            return cell
            
        case .history:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "HistoryTableViewCell", for: indexPath) as? HistoryTableViewCell else {fatalError()}
            cell.object = objects[indexPath.row]
            return cell
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableView.deselectRow(at: indexPath, animated: true)
        
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}
