interface It { Msg(Int) }

def useAfterFree(x: It?): Unit {
    guard x : Msg* {
        receive Msg(int) from y ->
            (); useAfterFree(y)
        # free -> ()
        free -> x ! Msg(4) # doesn't work, should be unit type
    }
}

def useAfterFree2(x: It?): Unit {
    let a = x in
    guard a : Msg* {
        receive Msg(int) from y ->
            (); useAfterFree2(y)
        # free -> x ! Msg(4) # doesn't work, should be unit type
        free -> ()
    }
}


def useAfterFree3(x: It?, y: It!): Unit {
    guard x : Msg* {
        receive Msg(int) from z ->
            (); useAfterFree3(z, y)
        free -> y ! Msg(4) # doesn't work, should be unit type
    }
}


let mb = new[It] in
mb ! Msg(3);
useAfterFree(mb);
# useAfterFree3(mb, mb);
()