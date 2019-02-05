//
//  Task.swift
//  Swift Task Example
//
//  Created by Leandro Bartsch Thá on 05/02/19.
//  Copyright © 2019 Leandro Bartsch Thá. All rights reserved.
//

import Foundation

struct Task {
    typealias Closure = (Controller) -> ()
    typealias TaskHandler = (TaskResult) -> ()
    
    private let closure: Closure
    
    init(closure: @escaping Closure) {
        self.closure = closure
    }
    
    func run(handler: @escaping TaskHandler) {
        DispatchQueue.global().async {
            let controller = Controller(queue: .global(), handler: handler)
            self.closure(controller)
        }
    }
    
    func runOnUIThread(handler: @escaping TaskHandler) {
        DispatchQueue.main.async {
            let controller = Controller(queue: .main, handler: handler)
            self.closure(controller)
        }
    }
}

extension Task {
    enum TaskResult: Equatable {
        case success
        case failure
        
        static func == (lhs: Task.TaskResult, rhs: Task.TaskResult) -> Bool {
            switch (lhs, rhs) {
            case (.success, .success):
                return true
            case (.failure, .failure):
                return true
            default:
                return false
            }
        }
    }
}

extension Task {
    struct Controller {
        fileprivate let queue: DispatchQueue
        fileprivate let handler: TaskHandler
        
        init(queue: DispatchQueue, handler: @escaping TaskHandler) {
            self.queue = queue
            self.handler = handler
        }
        
        func finish() {
            handler(.success)
        }
        
        func failure(_ error: Error) {
            handler(.failure)
        }
    }
}
