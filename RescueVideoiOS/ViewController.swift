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

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let button1 = UIButton(type: .system)
        button1.titleLabel!.lineBreakMode = NSLineBreakMode.byWordWrapping
        button1.titleLabel!.numberOfLines = 2
        button1.titleLabel!.textAlignment = NSTextAlignment.center
        button1.setTitle("おとな\n成人", for: .normal)
        button1.addTarget(self, action: #selector(self.playMovieFromProjectBundle), for: .touchUpInside)
        
        // Documentディレクトリから動画を読み込む場合
        // button.addTarget(self.plyaMovieFromLocalFile), for: /touchUpInside)
        
        button1.sizeToFit()
        button1.layer.position = CGPoint(x: self.view.frame.width/2, y:200)
        self.view.addSubview(button1)
        
        let button2 = UIButton(type: .system)
        button2.titleLabel!.lineBreakMode = NSLineBreakMode.byWordWrapping
        button2.titleLabel!.numberOfLines = 2
        button2.titleLabel!.textAlignment = NSTextAlignment.center
        button2.setTitle("こども\n小児(1〜15歳)", for: .normal)
        button2.addTarget(self, action: #selector(self.playMovieFromProjectBundle2), for: .touchUpInside)
        button2.sizeToFit()
        button2.layer.position = CGPoint(x: self.view.frame.width/2, y:300)
        self.view.addSubview(button2)
        
        let button3 = UIButton(type: .system)
        button3.titleLabel!.lineBreakMode = NSLineBreakMode.byWordWrapping
        button3.titleLabel!.numberOfLines = 2
        button3.titleLabel!.textAlignment = NSTextAlignment.center
        button3.setTitle("あかちゃん\n乳児(1歳未満)", for: .normal)
        button3.addTarget(self, action: #selector(self.playMovieFromProjectBundle3), for: .touchUpInside)
        button3.sizeToFit()
        button3.layer.position = CGPoint(x: self.view.frame.width/2, y:400)
        self.view.addSubview(button3)
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

