// Value type
struct Student {
    let studentId: String
    let lastName: String
    let firstName: String

    var age: Int
    var isEnrolled: Bool

    func test() {

    }
}

//Reference type
class Place {

    init(name: String, numberOfSeats: Int) {
        self.name = name // self obligatoire car sinon "conflit" de nom
        capacity = numberOfSeats
    }

    let name: String
    var capacity: Int
}

class Classroom: Place {

    init(name: String, numberOfSeats: Int, isBooked: Bool) {
        self.isBooked = isBooked

        super.init(name: name, numberOfSeats: numberOfSeats)
    }

    convenience init() {
        self.init(name: "", numberOfSeats: 0, isBooked: false)
    }

    var isBooked: Bool

    func test() {

    }
}

let student1 = Student(studentId: "", lastName: "Ollagnier", firstName: "Ludovic", age: 35, isEnrolled: true)
var student2 = student1
student2.age = 25

let classroom1 = Classroom(name: "", numberOfSeats: 0, isBooked: false)
var classroom2 = classroom1
classroom2.capacity = 30

student1.age //35
student2.age //25

classroom1.capacity // 30
classroom2.capacity // 30
