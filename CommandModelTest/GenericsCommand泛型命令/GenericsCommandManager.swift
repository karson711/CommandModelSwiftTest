//
//  GenericsCommandManager.swift
//  CommandModelTest
//
//  Created by kunge on 2018/7/2.
//  Copyright © 2018年 kunge. All rights reserved.
//

import Foundation


class GenericsCommandManager:NSObject {
    //特点一：持有接收者引用
    private var reciver:TetrisMachine
    //特点二：存储我们的命令
    private var commands = Array<CommandProtocol>()
    
    init(reciver:TetrisMachine) {
        self.reciver = reciver
    }
    
    //私有方法
    //闭包语法（逃逸闭包）
    //block类似
    private func addCommand(method:@escaping(TetrisMachine)->()->(Void)) {
        self.commands.append(GenericsCommand(reciver: self.reciver, block: { (tm) in
            method(tm)()
        }))
    }
    
    func toLeft() {
        self.addCommand(method: TetrisMachine.toLeft)
        self.reciver.toLeft()
    }
    func toRight() {
        self.addCommand(method: TetrisMachine.toRight)
        self.reciver.toLeft()
    }
    func toTransform() {
        self.addCommand(method: TetrisMachine.toTransform)
        self.reciver.toLeft()
    }
    //撤销
    func undo() {
        print("撤销.....")
        if self.commands.count > 0 {
            self.commands.removeLast().execute()
        }
    }
    //撤销所有
    //整个框架设计35节课，技术大增
    func undoAll() {
        WrapperCommand(commands: self.commands).execute()
        self.commands.removeAll()
    }
    
}
