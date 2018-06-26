//
//  TetrisMachineManager.swift
//  CommandModelTest
//
//  Created by kunge on 2018/6/26.
//  Copyright © 2018年 kunge. All rights reserved.
//

import Cocoa

class TetrisMachineManager: NSObject {

    private var commands = Array<TMCommandProtocol>()
    private var tm:TetrisMachine
    private var left:TMLeftCommand
    private var right:TMRightCommand
    private var transform:TMTransfromCommand
    
    init(tm:TetrisMachine,left:TMLeftCommand,right:TMRightCommand,transform:TMTransfromCommand) {
        self.tm = tm
        self.left = left
        self.right = right
        self.transform = transform
    }
    
    func toLeft(){
        self.tm.toLeft()
        self.commands.append(TMLeftCommand(tm: self.tm))
    }
    
    func toRight(){
        self.tm.toRight()
        self.commands.append(TMRightCommand(tm: self.tm))
    }
    
    func toTransform() {
        self.tm.toTransform()
        self.commands.append(TMTransfromCommand(tm: self.tm))
    }
    
    func undo() {
        if self.commands.count > 0 {
            self.commands.removeLast().execute()
        }
    }
}
