//
//  ViewController.swift
//  StudentManagementSystemCoreData
//
//  Created by srk on 15/07/21.
//  Copyright © 2021 Nikunj. All rights reserved.
//

import UIKit

class StudentLoginVC: UIViewController {
    
    private var studArray = [Student]()
    
    
    private let label :UILabel = {
        let label = UILabel()
        let font : UIFont = UIFont.boldSystemFont(ofSize: 30)
        label.font = .boldSystemFont(ofSize: 22)
        label.text = "VNSGU"
        label.textAlignment = .center
        label.font = font
        label.textColor = .black
        return label
    }()
    
    private let username : UITextField = {
        
        let textView = UITextField()
        textView.placeholder = "Enter Username"
        textView.textAlignment = .center
        textView.backgroundColor = #colorLiteral(red: 0.9216642833, green: 0.9216642833, blue: 0.9216642833, alpha: 1)
        textView.layer.cornerRadius = 20
        return textView
    }()
    
    private let password : UITextField = {
        
        let textView = UITextField()
        textView.placeholder = "Enter Password"
        textView.textAlignment = .center
        textView.backgroundColor = #colorLiteral(red: 0.9216642833, green: 0.9216642833, blue: 0.9216642833, alpha: 1)
        textView.layer.cornerRadius = 20
        textView.isSecureTextEntry = true
        return textView
    }()
    
    private let vcbutton : UIButton = {
        let vc_button = UIButton()
        vc_button.setTitle("Login", for: .normal)
        vc_button.backgroundColor = UIColor.lightGray
        vc_button.setTitleColor(.black, for: .normal)
        vc_button.addTarget(self, action: #selector(redirect), for: .touchUpInside)
        vc_button.layer.cornerRadius = 20
        return vc_button
    } ()
    
    @objc func redirect()
    {
        let stdcnt = studArray.count
        
        if(username.text == "Admin" && password.text == "Admin")
        {
            let vc = AdminVC()
            navigationController?.pushViewController(vc, animated: true)
        }
        else
        {
            for i in 0..<stdcnt
            {
                if (username.text! == studArray[i].spid!) && (password.text! == studArray[i].pwd!)
                {
                    let vc = StudentVC()
                    
                    UserDefaults.standard.setValue(username.text, forKey: "spid")
                    UserDefaults.standard.setValue(studArray[i].name, forKey: "name")
                    UserDefaults.standard.setValue(studArray[i].div, forKey: "div")
                    navigationController?.pushViewController(vc, animated: true)
                    break
                }
                else
                {
                    let alert = UIAlertController(title: "Please Enter Correct Credentials", message: "Incorrect Username Or Password", preferredStyle: .alert)
                    
                    alert.addAction(UIAlertAction(title: "Close", style: .cancel))
                    DispatchQueue.main.async {
                        self.present(alert, animated: true) {
                            self.username.text = ""
                            self.password.text = ""
                            
                        }
                    }
                }
            }
            /*let vc = StudentVC()
             navigationController?.pushViewController(vc, animated: true)*/
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Student Management System"
        view.addSubview(label)
        view.addSubview(username)
        view.addSubview(password)
        view.addSubview(vcbutton)
        
        studArray = CoreDataHandler.shared.fetch()
        
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        label.frame = CGRect(x: 20, y: 180, width: view.width - 40, height: 40)
        username.frame = CGRect(x: 20, y: label.bottom + 20, width: view.width - 40, height: 40)
        password.frame = CGRect(x: 20, y: username.bottom + 20, width: view.width - 40, height: 40)
        vcbutton.frame = CGRect(x: 20, y: password.bottom + 20, width: view.width - 40, height: 40)
        
        
    }
    
    
}

