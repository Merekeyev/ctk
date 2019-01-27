//
//  ObjectViewController.swift
//  CTK
//
//  Created by Temirlan Merekeyev on 1/28/19.
//  Copyright © 2019 Temirlan Merekeyev. All rights reserved.
//

import UIKit
import Moya

class ObjectViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    private var provider = MoyaProvider<MainService>()
    fileprivate var districts = [District]()
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        loadData()
    }
    
    private func setup() {
        
        tableView.backgroundColor = UIColor.groupTableViewBackground
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "DistrictTableViewCell", bundle: nil), forCellReuseIdentifier: "DistrictTableViewCell")
        
        if #available(iOS 11, *) {
            self.navigationController?.navigationBar.prefersLargeTitles = true
        }
        self.navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.8666666667, green: 0.1176470588, blue: 0.1607843137, alpha: 1)
        self.navigationController?.navigationBar.topItem?.title = "Районы"
        self.navigationController?.navigationBar.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
    
    private func loadData(){
        provider.request(.districts) { [weak self](result) in
            guard let strongSelf = self else {return}
            switch result{
            case .success(let response):
                do{
                    guard let jsons = try response.mapJSON() as? [[String : Any]] else {return}
                    jsons.map({strongSelf.districts.append(District(JSON: $0)!)})
                    strongSelf.tableView.reloadData()
                }catch{
                    print("error")
                }
                
            case .failure(let error):
                print("Error")
            }
        }
    }
    
}

extension ObjectViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return districts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "DistrictTableViewCell", for: indexPath) as? DistrictTableViewCell else {fatalError()}
        if districts.count >= indexPath.row{
            cell.district = districts[indexPath.row]
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
