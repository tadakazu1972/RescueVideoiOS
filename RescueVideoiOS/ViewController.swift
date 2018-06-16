//
//  ViewController.swift
//  RescueVideoiOS
//
//  Created by 中道 忠和 on 2017/10/09.
//  Copyright © 2017年 Tadakazu Nakamichi. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class ViewController: UIViewController {
    let lblPress = UILabel(frame: CGRect.zero)
    let button1 = UIButton(frame: CGRect.zero)
    let button2 = UIButton(frame: CGRect.zero)
    let button3 = UIButton(frame: CGRect.zero)
    let imgKyokusyo = UIImageView(frame: CGRect.zero)
    let lblFireDept = UILabel(frame: CGRect.zero)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //背景色
        self.view.backgroundColor = UIColor(red:0.3, green:1.0, blue:0.3, alpha:1.0)
        
        //大丈夫！落ち着いてボタンを押してください。
        lblPress.text="大丈夫！\n落ち着いてボタンを押してください。"
        lblPress.textColor = UIColor.black
        lblPress.font = UIFont.boldSystemFont(ofSize: UIFont.labelFontSize)
        lblPress.lineBreakMode = NSLineBreakMode.byWordWrapping
        lblPress.numberOfLines = 2
        lblPress.textAlignment = NSTextAlignment.center
        lblPress.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(lblPress)
        
        //成人
        button1.titleLabel!.lineBreakMode = NSLineBreakMode.byWordWrapping
        button1.titleLabel!.numberOfLines = 2
        button1.titleLabel!.textAlignment = NSTextAlignment.center
        button1.titleLabel!.font = UIFont.boldSystemFont(ofSize: UIFont.labelFontSize)
        button1.setTitle("おとな\n成　人", for: UIControlState())
        button1.backgroundColor = UIColor.blue
        button1.layer.masksToBounds = true
        button1.layer.cornerRadius = 8.0
        button1.layer.borderColor = UIColor.white.cgColor
        button1.layer.borderWidth = 2.0
        button1.addTarget(self, action: #selector(self.playMovieFromProjectBundle), for: .touchUpInside)
        button1.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(button1)
        
        //小児
        button2.titleLabel!.lineBreakMode = NSLineBreakMode.byWordWrapping
        button2.titleLabel!.numberOfLines = 2
        button2.titleLabel!.textAlignment = NSTextAlignment.center
        button2.titleLabel!.font = UIFont.boldSystemFont(ofSize: UIFont.labelFontSize)
        button2.setTitle("こども\n小　児（1〜15歳）", for: UIControlState())
        button2.backgroundColor = UIColor.blue
        button2.layer.masksToBounds = true
        button2.layer.cornerRadius = 8.0
        button2.layer.borderColor = UIColor.white.cgColor
        button2.layer.borderWidth = 2.0
        button2.addTarget(self, action: #selector(self.playMovieFromProjectBundle2), for: .touchUpInside)
        button2.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(button2)
        
        //乳児
        button3.titleLabel!.lineBreakMode = NSLineBreakMode.byWordWrapping
        button3.titleLabel!.numberOfLines = 2
        button3.titleLabel!.textAlignment = NSTextAlignment.center
        button3.titleLabel!.font = UIFont.boldSystemFont(ofSize: UIFont.labelFontSize)
        button3.setTitle("あかちゃん\n乳　児（1歳未満）", for: UIControlState())
        button3.backgroundColor = UIColor.blue
        button3.layer.masksToBounds = true
        button3.layer.cornerRadius = 8.0
        button3.layer.borderColor = UIColor.white.cgColor
        button3.layer.borderWidth = 2.0
        button3.addTarget(self, action: #selector(self.playMovieFromProjectBundle3), for: .touchUpInside)
        button3.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(button3)
        
        //局章
        imgKyokusyo.image = UIImage(named: "kyokusyo.png")
        imgKyokusyo.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(imgKyokusyo)
        
        //大阪市消防局
        lblFireDept.text="大阪市消防局"
        lblFireDept.textColor = UIColor.black
        lblFireDept.textAlignment = NSTextAlignment.center
        lblFireDept.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(lblFireDept)
    }
    
    //制約ひな型
    func Constraint(_ item: AnyObject, _ attr: NSLayoutAttribute, to: AnyObject?, _ attrTo: NSLayoutAttribute, constant: CGFloat = 0.0, multiplier: CGFloat = 1.0, relate: NSLayoutRelation = .equal, priority: UILayoutPriority = UILayoutPriorityRequired) -> NSLayoutConstraint {
        let ret = NSLayoutConstraint(
            item:       item,
            attribute:  attr,
            relatedBy:  relate,
            toItem:     to,
            attribute:  attrTo,
            multiplier: multiplier,
            constant:   constant
        )
        ret.priority = priority
        return ret
    }
    
    override func viewDidLayoutSubviews(){
        //大丈夫！落ち着いてボタンを押してください。
        self.view.addConstraints([
            Constraint(lblPress, .bottom, to:button1, .top, constant:-20),
            Constraint(lblPress, .centerX, to:self.view, .centerX, constant:8),
            Constraint(lblPress, .width, to:self.view, .width, constant:0, multiplier:0.85),
        ])
        //成人
        self.view.addConstraints([
            Constraint(button1, .centerY, to:self.view, .centerY, constant:20),
            Constraint(button1, .centerX, to:self.view, .centerX, constant:8),
            Constraint(button1, .width, to:self.view, .width, constant:0, multiplier:0.7),
            Constraint(button1, .height, to:self.view, .height, constant:0, multiplier:0.1)
        ])
        //小児
        self.view.addConstraints([
            Constraint(button2, .top, to:button1, .bottom, constant:20),
            Constraint(button2, .centerX, to:self.view, .centerX, constant:8),
            Constraint(button2, .width, to:self.view, .width, constant:0, multiplier:0.7),
            Constraint(button2, .height, to:self.view, .height, constant:0, multiplier:0.1)
        ])
        //乳児
        self.view.addConstraints([
            Constraint(button3, .top, to:button2, .bottom, constant:20),
            Constraint(button3, .centerX, to:self.view, .centerX, constant:8),
            Constraint(button3, .width, to:self.view, .width, constant:0, multiplier:0.7),
            Constraint(button3, .height, to:self.view, .height, constant:0, multiplier:0.1)
        ])
        //局章
        self.view.addConstraints([
            Constraint(imgKyokusyo, .centerY, to:lblFireDept, .centerY, constant: 0),
            Constraint(imgKyokusyo, .trailing, to:lblFireDept, .leading, constant: 24),
            Constraint(imgKyokusyo, .width, to:self.view, .width, constant:0, multiplier:0.1),
            Constraint(imgKyokusyo, .height, to:self.view, .width, constant:0, multiplier:0.1)
        ])
        //大阪市消防局
        self.view.addConstraints([
            Constraint(lblFireDept, .bottom, to:self.view, .bottom, constant:-32),
            Constraint(lblFireDept, .centerX, to:self.view, .centerX, constant:8),
            Constraint(lblFireDept, .width, to:self.view, .width, constant:0, multiplier:0.5)
        ])
    }
    
    //アプリ内に組み込んだ動画ファイルを再生
    func playMovieFromProjectBundle(){
        
        if let bundlePath = Bundle.main.path(forResource: "adult", ofType: "mp4"){
            
            let videoPlayer = AVPlayer(url: URL(fileURLWithPath: bundlePath))
            let playerController = AVPlayerViewController()
            playerController.player = videoPlayer
            self.present(playerController, animated: true, completion: {
                videoPlayer.play()
            })
        } else {
            print("no such file")
        }
    }
    
    //アプリ内に組み込んだ動画ファイルを再生
    func playMovieFromProjectBundle2(){
        
        if let bundlePath = Bundle.main.path(forResource: "child", ofType: "mp4"){
            
            let videoPlayer = AVPlayer(url: URL(fileURLWithPath: bundlePath))
            let playerController = AVPlayerViewController()
            playerController.player = videoPlayer
            self.present(playerController, animated: true, completion: {
                videoPlayer.play()
            })
        } else {
            print("no such file")
        }
    }
    
    //アプリ内に組み込んだ動画ファイルを再生
    func playMovieFromProjectBundle3(){
        
        if let bundlePath = Bundle.main.path(forResource: "baby", ofType: "mp4"){
            
            let videoPlayer = AVPlayer(url: URL(fileURLWithPath: bundlePath))
            let playerController = AVPlayerViewController()
            playerController.player = videoPlayer
            self.present(playerController, animated: true, completion: {
                videoPlayer.play()
            })
        } else {
            print("no such file")
        }
    }
    
    //アプリのDocumentディレクトリにある動画ファイルを再生
    func playMovieFromLocalFile(){
        
        let path = "\(getDocumentDirectory())/filename.mp4"
        
        let videoPlayer = AVPlayer(url: URL(fileURLWithPath: path))
        let playerController = AVPlayerViewController()
        playerController.player = videoPlayer
        self.present(playerController, animated: true, completion: {
            videoPlayer.play()
        })
    }
    
    //Documentディレクトリのパスを取得
    func getDocumentDirectory() -> String {
        return NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true).last!
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

