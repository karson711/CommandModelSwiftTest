//
//  main.swift
//  CommandModelTest
//
//  Created by kunge on 2018/6/26.
//  Copyright © 2018年 kunge. All rights reserved.
//

import Foundation

print("Hello, World!")

let tm = TetrisMachine()
let left = TMLeftCommand(tm: tm)
let right = TMRightCommand(tm: tm)
let transform = TMTransfromCommand(tm: tm)
let manager = TetrisMachineManager(tm: tm, left: left, right: right, transform: transform)
manager.toLeft()
manager.toRight()
manager.toTransform()
manager.undo()

