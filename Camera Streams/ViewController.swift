//
//  ViewController.swift
//  Camera Streams
//
//  Created by Adam Lowther on 2/25/18.
//  Copyright © 2018 Lowther. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var players:[VLCMediaPlayer] = []
    let streamManager:StreamManager = StreamManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Cameras"
        
        setupPlayers()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        for player in players {
            player.play()
        }
        
//        //something isn't working correctly in the simulator, the player's aren't in "playing" mode here
//        var shouldKeepLooping:Bool = true
//        while shouldKeepLooping {
//            for player in players {
//                if !player.isPlaying {
//                    player.play()
//                }
//                else {
//                    shouldKeepLooping = false
//                }
//            }
//        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupPlayers() {
        let streamCount = streamManager.savedStreams.count

        var numberOfHorizontalViews = 2
        let buffer = 2
        
        let mod3 = streamCount % 3
        let mod2 = streamCount % 2
        
        let mod2IsExact = mod2 == 0
        let lessThan3Streams = streamCount < 3
        
        if (!lessThan3Streams && !mod2IsExact) {
            print("using 3")
            numberOfHorizontalViews = 3
        }
        
        let bounds = CGRect(x: 0, y: 0, width: 1920, height: 1080)
        
        var startingXCoord = buffer
        var width = bounds.width - CGFloat((numberOfHorizontalViews+1)*buffer)
        width = width/CGFloat(numberOfHorizontalViews)
        
        var startingYCoord = 0
        
        if let navHeight = self.navigationController?.navigationBar.frame.height {
            startingYCoord = Int(navHeight)
        }
        
        let vStackViewHeight = (Int(bounds.height) - startingYCoord - buffer)
        let height = vStackViewHeight / (streamCount/numberOfHorizontalViews)
        
        let vStackViewWidth = Int(bounds.width) - (buffer*2)
        let verticalStackView:UIStackView = UIStackView.init(frame: CGRect(x:startingXCoord, y: startingYCoord, width: vStackViewWidth, height: vStackViewHeight))
        verticalStackView.axis = .vertical
        self.view.addSubview(verticalStackView)
        var stackview:UIStackView = UIStackView()
        
        startingXCoord = 0
        startingYCoord = 0
        
        for i in 0...streamCount-1 {
            
            if stackview.subviews.count == 0 {
                stackview.frame = CGRect(x: startingXCoord, y: startingYCoord, width: Int(verticalStackView.frame.width), height: height)
                stackview.alignment = .center
                stackview.axis = .horizontal
                verticalStackView.addSubview(stackview)
            }
            
            let view = UIView.init(frame: CGRect(x: CGFloat(startingXCoord), y: CGFloat(0), width: width, height: stackview.frame.height))
            stackview.addSubview(view)
            
            let player = VLCMediaPlayer()
            player.drawable = view
            player.media = VLCMedia.init(url: URL.init(string: streamManager.savedStreams[i])!)
            
            self.players.append(player)
            
            startingXCoord = startingXCoord + buffer + Int(view.frame.width)

            if stackview.subviews.count == numberOfHorizontalViews {
                stackview = UIStackView()
            }
        }
    }
}

