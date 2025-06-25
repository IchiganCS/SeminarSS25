interface It { Login(Int), Access(Bool) }

def loggedOut(x: It?): Unit {
    guard x : Login . Access* {
        receive Login(int) from y ->
            loggedIn(y)
        receive Access(b) from y ->
            (); #access is denied
            loggedOut(y)
    }
}

def loggedIn(x: It?): Unit {
    guard x : Access* {
        receive Access(b) from y ->
            (); #access is allowed
            loggedIn(y)
        free -> ()
    }
}


let mb = new[It] in
mb ! Login(3);
mb ! Access(true);
spawn { let asf = loggedOut(mb) in () }