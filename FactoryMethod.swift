import Foundation

/* Реализация паттерна проектирования "Фабричный метод" */

// Начало группы

protocol Exercise {
    var name: String { get }
    var type: String { get }
    
    func start()
    func stop()
}

class Squarts: Exercise {
    var name = "Приседания"
    var type = "Упраженения на ноги"
    
    func start() {
        print("Начинаем приседания")
    }
    
    func stop() {
        print("Заканчиваем приседания")
    }
}

class Jumping: Exercise {
    var name = "Прыжки"
    var type = "Упраженения для ног"
    
    func start() {
        print("Начинаем прыжки")
    }
    
    func stop() {
        print("Заканчиваем прыжки")
    }
}

// Конец группы

enum Exercises {
    case squarts, jumping
}

class FactoryExercises {
    static let defaultFactory = FactoryExercises()
    
    func createExercise(name: Exercises) -> Exercise {
        switch name {
        case .squarts:
            return Squarts()
        case .jumping:
            return Jumping()
        }
    }
}

var exerciseArray = [Exercise]()

func createExercise(name: Exercises) {
    let newExercise = FactoryExercises.defaultFactory.createExercise(name: name)
    exerciseArray.append(newExercise)
}

createExercise(name: .jumping)

func runExercises() {
    for ex in exerciseArray {
        ex.start()
        // Set timer here
        ex.stop()
    }
}

runExercises()
