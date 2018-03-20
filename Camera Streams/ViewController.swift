//
//  ViewController.swift
//  Camera Streams
//
//  Created by Adam Lowther on 2/25/18.
//  Copyright © 2018 Lowther. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let player = VLCMediaPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        player.drawable = self.view
        player.media = VLCMedia.init(url: URL.init(string: "rtsp://192.168.15.10/user-admin_channel=1_stream=0.sdp")!)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        player.play()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

