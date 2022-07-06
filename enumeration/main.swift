//
//  enumerationApp.swift
//  enumeration
//
//  Created by MacBook Air on 2022/07/04.
//

import Foundation

enum SomeEnumeration { // enum 키워드를 사용하여 열거형을 정의합니다.

// enumeration definition goes here

}

enum CompassPoint { // 다음은 네 가지 방향을 갖는 CompassPoint 열거형 선언입니다.

case north

case south

case east

case west

}

enum Planet { // 여러 case를 콤마로 부분하여 한 줄에 적을 수 있습니다.

case mercury, venus, earth, mars, jupiter, saturn, uranus, neptune

}

var directionToHead = CompassPoint.west // 각 열고횽 정의는 완전 새로운 형을 정의한다. Swift의 다른 형과 마찬가지로 형의 이름은
// 대문자로 같이 시작해야 한다.

directionToHead = .east

directionToHead = .south

switch directionToHead { // 각 열거형 값을 switch 문에서 매칭할 수 있다. switch문은 반드시 열거형의 모든 경우(case)를 완전히 포함해야 한다.

case .north:

print("Lots of planets have a north")

case .south:

print("Watch out for penguins")

case .east:

print("Where the sun rises")

case .west:

print("Where the skies are blue")

}

let somePlanet = Planet.earth // 열겨형의 모든 경우를 완전히 포함하지 않았을 경우 기본 default case 를 제공하여 처리되지 않는
// case를 피할 수 있다.
switch somePlanet {
case .earth:
print("Mostly harmless")
default:
print("Not a safe place for humans")
}

enum Barcode { // 바코드를 열거형으로 정의하기
    case upc(Int, Int, Int, Int)
    case qrCode(String)
}

var productBarcode = Barcode.upc(8, 85909, 51226, 3) // 위와 같은 형이지만, 다른 형태의 값을 갖는 case를 만들 수 있다

productBarcode = .qrCode("ABCDEFG")

enum ASCIIControlCharacter: Character { // case에 raw 값을 지정할 수 있다.
    case tab = "\t"
    case lineFeed = "\n"
    case carriageReturn = "\r"
}

// raw값은 Character 말고도 String, Integer, Float, String 등의 형을 사용할 수도 있다.

enum planet: Int {
    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
} // mercury에 1을 명시적으로 할당하였고 다음 venus는 2, 그리고 이후 1이 증가하는 값을 raw 값으로 갖게 된다.

enum compassPoint: String {
    case north, south, east, west
} // compassPoint.south는 암시적으로 "south"를 raw 값으로 가진다.

let earthsOrder = planet.earth.rawValue
// earthsOrder is 3
let sunsetDirection = compassPoint.west.rawValue
// sunsetDirection is "west".
// raw 값은 rawValue 프로퍼티를 사용하여 접근할 수 있다.

let possiblaPlanet = planet(rawValue: 7)
// raw 값을 7로 갖는 열거형 변수의 초기 값으로 지정한다. 해당 값은 Uranus이다.

let positionToFind = 11
if let somePlanet = planet(rawValue: positionToFind) {
    switch somePlanet {
    case .earth:
        print("Mostly harmless")
    default:
        print("Not a safe place for humans")
    }
} else {
    print("There isn't a planet at position \(positionToFind)")
} // Prints "There isn't a planet at position 11"
// 만약 열거형에 지정된 raw 값이 없는 값으로 초기자를 지정하면 그 값은 nil이 된다.

enum ArithmeticExpression {
    case number(Int)
    indirect case addition(ArithmeticExpression, ArithmeticExpression)
    indirect case multiplication(ArithmeticExpression, ArithmeticExpression)
}
// 재귀 열거자는 다른 열거 인스터스를 관계 값으로 갖는 열거형이다. 재귀 열거자 case는 앞에 indirect 키워드를 붙여서 표시한다
// 만약 관계값을 가지는 모든 열거형 case에 indirect 표시를 하고 싶으면 enum 키워드 앞에 indirect 표시를 하면 된다

let five = ArithmeticExpression.number(5)
let four = ArithmeticExpression.number(4)
let sum = ArithmeticExpression.addition(five, four)
let product = ArithmeticExpression.multiplication(sum, ArithmeticExpression.number(2))
print(product)

// 위의 예제는 (5 + 4) * 2를 재귀 열거자로 표현한 것이다.

func evaluate(_ expression: ArithmeticExpression) -> Int {
    switch expression {
    case let .number(value):
        return value
    case let .addition(left, right):
        return evaluate(left) + evaluate(right)
    case let .multiplication(left, right):
        return evaluate(left) * evaluate(right)
    }
}

// 위 재귀 열거자를 처리하는 함수이다.

print(evaluate(product))
