//
//  TMRightCommand.swift
//  CommandModelTest
//
//  Created by kunge on 2018/6/26.
//  Copyright © 2018年 kunge. All rights reserved.
//

import Cocoa

class TMRightCommand: TMCommandProtocol {
    private var tm:TetrisMachine
    init(tm:TetrisMachine) {
        self.tm = tm
    }
    func execute() {
        self.tm.toRight()
    }
}
