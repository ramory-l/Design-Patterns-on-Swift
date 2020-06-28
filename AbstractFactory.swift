import Foundation

/* Реализация паттерна проектирования "Абстрактная фабрика" */

// Протоколы

protocol Chair {
    var name: String { get }
    var type: String { get }
}

protocol Sofa {
    var name: String { get }
    var type: String { get }
}

protocol Table {
    var name: String { get }
    var type: String { get }
}

// Мебель для спальни (отдельная группа)

class ChairBedroom: Chair {
    var name: String = "Стул"
    var type: String = "Стул для спальни"
}

class CoffeTableBedroom: Table {
    var name: String = "Стол"
    var type: String = "Стол для спальни"
}

class SofaBedroom: Sofa {
    var name: String = "Диван"
    var type: String = "Диван для спальни"
}

// Мебель для кухни (отдельная группа)

class ChairKitchen: Chair {
    var name: String = "Стул"
    var type: String = "Стул для кухни"
}

class CoffeTableKitchen: Table {
    var name: String = "Стол"
    var type: String = "Стол для кухни"
}

class SofaKitchen: Sofa {
    var name: String = "Диван"
    var type: String = "Диван для кухни"
}

// Абстрактная фабрика

protocol AbstractFactory {
    func createChair() -> Chair
    func createSofa() -> Sofa
    func createTable() -> Table
}

// Фабрики для создания типовых объектов

class BedroomFactory: AbstractFactory {
    func createChair() -> Chair {
        print("Стул для спальни создан")
        return ChairBedroom()
    }
    
    func createSofa() -> Sofa {
        print("Диван для спальни создан")
        return SofaBedroom()
    }
    
    func createTable() -> Table {
        print("Стол для спальни создан")
        return CoffeTableBedroom()
    }
}

class KitchenFactory: AbstractFactory {
    func createChair() -> Chair {
        print("Стул для кухни создан")
        return ChairKitchen()
    }
    
    func createSofa() -> Sofa {
        print("Диван для кухни создан")
        return SofaKitchen()
    }
    
    func createTable() -> Table {
        print("Стол для кухни создан")
        return CoffeTableKitchen()
    }
}

// Используем Абстрактную фабрику

var chair: Chair?
var table: Table?
var sofa: Sofa?

func orderFurnitureForKitchen() {
    chair = KitchenFactory().createChair()
    table = KitchenFactory().createTable()
    sofa = KitchenFactory().createSofa()
}

func orderFurnitureForBedroom() {
    chair = BedroomFactory().createChair()
    table = BedroomFactory().createTable()
    sofa = BedroomFactory().createSofa()
}

orderFurnitureForBedroom()
orderFurnitureForKitchen()
