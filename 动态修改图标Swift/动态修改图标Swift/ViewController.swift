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
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()

    /**
     * 测试
     */
    func alert() {
        let alert = UIAlertController.init(title: "测试", message: "message", preferredStyle: .alert);
        alert.addAction(UIAlertAction.init(title: "确定", style: .default, handler: nil));
        self.present(alert, animated: true, completion: nil);
    }
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = String(indexPath.row+1)
       return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
//        changeAPPIcon(iconName: "appicon"+String(indexPath.row+1))
        
        /**
         * 测试别种情况alert；
         */
        alert()
    }
    
    
}



