interface It { Msg(Int), Msg2(Bool) }

def addTwoNumbers(x: It?): Int {
    guard x : Msg . Msg2 {
        receive Msg(int) from y ->
            guard y : Msg2 {
                receive Msg2(bool) from z -> 
                    guard z : 1 {
                        free -> ()
                    }
            }
    };
    5
}


let mb = new[It] in
mb ! Msg2(true);
mb ! Msg(3);
spawn { let asf = addTwoNumbers(mb) in () }