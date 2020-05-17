import Foundation

/* Реализация паттерна проектирования "Шаблон делегирования" */

protocol RouterDelegate {
    var messages: [String: [String]] { get set }
    func save(message: String, from user: String, sentTo anotherUser: String)
}

protocol UserProtocol {
    var name: String { get set }
    var age: Int { get set }
    
    var delegate: RouterDelegate? { get set }
    
    init(name: String, age: Int, delegate: RouterDelegate?)
}

class Router: RouterDelegate {
    var messages = [String: [String]]()
    func save(message: String, from user: String, sentTo anotherUser: String) {
        let fullMessage = "Message to \(anotherUser): \(message)"
        if messages[user] != nil {
            messages[user]?.append(fullMessage)
        } else {
            messages[user] = [fullMessage]
        }
    }
}

class User: UserProtocol {
    var name: String
    var age: Int
    
    var delegate: RouterDelegate?
    
    func send(message: String, to user: String) {
        delegate?.save(message: message, from: name, sentTo: user)
        print("Message sent!")
    }
    
    required init(name: String, age: Int, delegate: RouterDelegate?) {
        self.name = name
        self.age = age
        self.delegate = delegate
    }
}

let routerDelegate = Router()

let user = User(name: "Mikhail", age: 22, delegate: routerDelegate)

user.send(message: "Мама, привет, как дела?", to: "Ирина")
user.send(message: "Давай, я тебя уже жду!", to: "Элина")
user.send(message: "У меня тоже неплохо", to: "Ирина")

print(routerDelegate.messages)
