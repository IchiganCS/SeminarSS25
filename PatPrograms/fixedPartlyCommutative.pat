interface User { Login(Int, Access?) }
interface Access { File(Int) }

def loggedOut(x: User?): Unit {
    guard x : Login {
        receive Login(id, accesses) from y ->
            ();     guard accesses : File* {
        free -> ()
        receive File(id) from z ->
            (); handleAccesses(z)
    }
    }
}
def handleAccesses(x: Access?) : Unit {
    guard x : File* {
        free -> ()
        receive File(id) from y ->
            (); handleAccesses(y)
    }
}

let mb = new[User] in
let accesses = new[Access] in
accesses ! File(15);
accesses ! File(4124);
mb ! Login(3, accesses);
spawn { let asf = loggedOut(mb) in () }