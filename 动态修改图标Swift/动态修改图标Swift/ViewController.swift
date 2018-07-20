//
//  ViewController.swift
//  动态修改图标Swift
//
//  Created by guxiangyun on 2018/7/19.
//  Copyright © 2018年 chenran. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        view.addSubview(tableView)
        
        Timer.scheduledTimer(withTimeInterval: 1, repeats: false) { (timer:Timer) in
            self.changeAPPIcon(iconName: "appicon"+String(NSDate().day))
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    fileprivate lazy var tableView :UITableView = {
        var tableView = UITableView(frame: view.frame)
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()
    
    @available(iOS 10.3, *)
    func changeAPPIcon(iconName: String) {
        if !UIApplication.shared.supportsAlternateIcons {
            return
        }
        print("appiconname: ",iconName)
        
        UIApplication.shared.setAlternateIconName(iconName) { (err:Error?) in
            print(err ?? "切换成功")
        }
        
    }
    
}

extension ViewController: UITableViewDelegate,UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 31
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        if cell == nil {
            cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        }
        cell.textLabel?.text = String(indexPath.row+1)
       return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        changeAPPIcon(iconName: "appicon"+String(indexPath.row+1))
    }
    
    
}
