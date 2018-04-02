//
//  StreamManager.swift
//  Camera Streams
//
//  Created by Adam Lowther on 3/28/18.
//  Copyright © 2018 Lowther. All rights reserved.
//

import Foundation

@objc class StreamManager: NSObject {
    private var streamList:[String]
    @objc lazy var savedStreams:[String] = {
        return self.streamList
    }()
    
    override init() {
        streamList = STREAMLIST
    }
    
    public func addRTSP(stream:String) {
        streamList.append("rtsp://\(stream)")
    }
    
    public func removeRTSP(stream:String) {
        let streamName = "rtsp://\(stream)"
        if let index = streamList.index(of: streamName) {
            streamList.remove(at: index)
        }
    }
}
