//
//  ViewController.swift
//  CusutomContainer
//
//  Created by rintaro.yamasaki on 2016/09/04.
//  Copyright © 2016年 rintaro.yamasaki. All rights reserved.
//問題点は、addsubView後の画面切り替え時に、viewDidLodeメソッドを通過しない。

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var Container: UIView!
    
    @IBOutlet weak var firstBtn: UIButton!
    @IBOutlet weak var secondBtn: UIButton!
    
    var firstView: UIViewController!
    var secondView: UIViewController!
    var childViewController: UIViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //インスタンス生成
        firstView = self.storyboard?.instantiateViewControllerWithIdentifier("firstView")
        firstView.view.frame = Container.bounds
        secondView = self.storyboard?.instantiateViewControllerWithIdentifier("secondView")
        secondView.view.frame = Container.bounds
        
        //子ビューに追加
        addChildViewController(firstView)
        
        Container.addSubview(firstView.view)
        
        firstView.didMoveToParentViewController(self)
        
        childViewController = firstView
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //first_btnタップ時
    @IBAction func tap_first(sender: AnyObject) {
        
        if childViewController == secondView{
            
            //子ビューの削除
            childViewController.willMoveToParentViewController(nil)
            childViewController.view.removeFromSuperview()
            childViewController.removeFromParentViewController()
            
            //親子関係を結ぶ
            addChildViewController(firstView)
            
            //親子関係のchildViewをaddする
            Container.addSubview(firstView.view)
            
            //親子関係の完了
            secondView.didMoveToParentViewController(self)
            
            childViewController = firstView
            
        }
    }
    //second_btnタップ時
    @IBAction func tap_second(sender: AnyObject) {
        
        if childViewController == firstView{
            
            //子ビューの削除
            childViewController.willMoveToParentViewController(nil)
            childViewController.view.removeFromSuperview()
            childViewController.removeFromParentViewController()
            
            //親子関係を結ぶ
            addChildViewController(secondView)
            
            //親子関係のchildViewをaddする
            Container.addSubview(secondView.view)
            
            //親子関係の完了
            secondView.didMoveToParentViewController(self)
            
            childViewController = secondView
        
        }
    }
}

