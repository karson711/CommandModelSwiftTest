//
//  BlockCommandInvoke.swift
//  CommandModelTest
//
//  Created by kunge on 2018/7/2.
//  Copyright © 2018年 kunge. All rights reserved.
//

import Foundation

class BlockCommandInvoke:NSObject {
    //特点一：持有接收者引用
    private var reciver:TetrisMachine
    //定义一个闭包(BlockCommand：表示别名)
    typealias BlockCommand = ((TetrisMachine)->Void)
    //特点二：存储我们的命令
    private var commands = Array<CommandProtocol>()
    //特点三：队列（平常写的UI代码都是垃圾代码->优化这些代码->不合理->我会提供一种方案解决冗余问题）
    private var queue = DispatchQueue(label: "Command")
    
    init(reciver:TetrisMachine) {
        self.reciver = reciver
    }
    
    //私有方法
    //闭包语法（逃逸闭包）
    //block类似
    private func addCommand(method:@escaping(TetrisMachine)->()->(Void)) {
        self.queue.sync {
            self.commands.append(GenericsCommand(reciver: self.reciver, block: { (tm) in
                method(tm)()
            }))
        }
    }
    
    //注意：方法也是闭包(特殊)
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
        for command in self.commands {
            command(self.reciver)
        }
        self.commands.removeAll()
    }
    
}
