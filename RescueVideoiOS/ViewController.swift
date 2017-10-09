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
        
        let button = UIButton(type: .system)
        button.setTitle("Play", for: .normal)
        button.addTarget(self, action: #selector(self.playMovieFromProjectBundle), for: .touchUpInside)
        
        // Documentディレクトリから動画を読み込む場合
        // button.addTarget(self.plyaMovieFromLocalFile), for: /touchUpInside)
        
        button.sizeToFit()
        button.center = self.view.center
        self.view.addSubview(button)
    }
    
    //アプリ内に組み込んだ動画ファイルを再生
    func playMovieFromProjectBundle(){
        
        if let bundlePath = Bundle.main.path(forResource: "nekohiroi", ofType: "mp4"){
            
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

