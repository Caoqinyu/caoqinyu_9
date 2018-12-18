//
//  ViewController.swift
//  caoqinyu_9
//
//  Created by student on 2018/11/24.
//  Copyright © 2018年 2016110302. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        title = "test9"
        self.view.backgroundColor = UIColor.white
        
        let addBtn = UIBarButtonItem(title: "添加", style: .plain, target: self, action: #selector(addView))
        let moveBtn = UIBarButtonItem(title: "移动", style: .plain, target: self, action: #selector(moveViews))
         let clearBtn = UIBarButtonItem(title: "清空", style: .plain, target: self, action: #selector(clearView))
        //添加到导航栏左边
        self.navigationItem.leftBarButtonItem = clearBtn
        //添加到导航栏右边
        self.navigationItem.rightBarButtonItems = [addBtn, moveBtn]

    }
    @objc func addView() {
        let maxWidth: CGFloat = 148
        
        let x = CGFloat(arc4random() % UInt32(self.view.bounds.width))
        let y = CGFloat(arc4random() % UInt32(self.view.bounds.height - 30)) + 30
        let point = CGPoint(x: x, y: y)
        
        let width = CGFloat(arc4random() % UInt32(maxWidth))
        let height = CGFloat(arc4random() % UInt32(maxWidth))
        let size = CGSize(width: width, height: height)
        
        let view = MyView(frame: CGRect(origin: point, size: size))
        self.view.addSubview(view)
    }
    @objc func moveViews() {
        self.view.subviews.map { (view) in
            let x = CGFloat(arc4random() % UInt32(self.view.bounds.width))
            let y = CGFloat(arc4random() % UInt32(self.view.bounds.height - 40)) + 40
            let point = CGPoint(x: x, y: y)
            //转移视图到point生成地方
            UIView.animate(withDuration: 3, animations: {
                view.center = point
            })
        }
    }
    @objc func clearView() {
        self.view.subviews.map { $0.removeFromSuperview() }
    }
}

