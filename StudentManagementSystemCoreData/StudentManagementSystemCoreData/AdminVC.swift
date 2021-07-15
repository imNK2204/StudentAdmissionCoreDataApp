//
//  AdminVC.swift
//  StudentManagementSystemCoreData
//
//  Created by srk on 15/07/21.
//  Copyright © 2021 Nikunj. All rights reserved.
//

import UIKit

class AdminVC: UIViewController {
    
    private let wlcmlbl:UILabel = {
        
        let myLabel = UILabel()
        myLabel.text = "Welcome"
        myLabel.textAlignment = .center
        myLabel.font = .boldSystemFont(ofSize: 25)
        return myLabel
    }()

    private let StudentDetails : UIButton = {
        let btn = UIButton()
        btn.setTitle("StudentDetails", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.backgroundColor = #colorLiteral(red: 0.9216642833, green: 0.9216642833, blue: 0.9216642833, alpha: 1)
        btn.addTarget(self, action: #selector(StudentDetail), for: .touchUpInside)
        btn.layer.cornerRadius = 20
        
        return btn
    } ()
    
    @objc private func StudentDetail()
    {
        let vc = StudentListVC()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    private let NoticeBoard : UIButton = {
        let btn = UIButton()
        btn.setTitle("NoticeBoard", for: .normal)
        btn.backgroundColor = #colorLiteral(red: 0.9216642833, green: 0.9216642833, blue: 0.9216642833, alpha: 1)
        btn.setTitleColor(.black, for: .normal)
        btn.addTarget(self, action: #selector(NoticeBoards), for: .touchUpInside)
        btn.layer.cornerRadius = 20
        return btn
    } ()
    
    @objc private func NoticeBoards()
    {
        let vc = NoticeBoardVC()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Admin Panel"
        view.addSubview(wlcmlbl)
        view.addSubview(StudentDetails)
        view.addSubview(NoticeBoard)
        view.backgroundColor = UIColor.white
        // Do any additional setup after loading the view.
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        wlcmlbl.frame = CGRect(x: 0, y: 100, width: view.width, height: 80)
        StudentDetails.frame = CGRect(x: 100, y: wlcmlbl.bottom + 20, width: view.width / 2, height: 80)
        NoticeBoard.frame = CGRect(x: 100, y: StudentDetails.bottom + 20, width: view.width / 2, height: 80)
    }
    
}

