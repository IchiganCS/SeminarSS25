# Church list function: ((Int * Int), ((Int * Int), Int) -> (Int * Int)) -> (Int * Int)
# This doesn't yet quite work. When the state type is a simple int, it works, but that is too restrictive for many operations.
# We need to design the function so that it enables many use cases, but i guess the grammer (refer to parser.mly) is too restrictive to enable
# nested tuples as a return value for lambdas (tuples are not a `simple_ty` which is required for arrow functions).
# This was fixed by replacing it with `ty` manually.

def listEmpty(): ((Int * Int), ((Int * Int), Int) -> (Int * Int)) -> (Int * Int)
{
    fun(state: (Int * Int), folder: ((Int * Int), Int) -> (Int * Int)): (Int * Int) { state }
}

def listAppend(item: Int, list: ((Int * Int), ((Int * Int), Int) -> (Int * Int)) -> (Int * Int)): ((Int * Int), ((Int * Int), Int) -> (Int * Int)) -> (Int * Int)
{
    fun(state: (Int * Int), folder: ((Int * Int), Int) -> (Int * Int)): (Int * Int) { folder(list(state, folder), item) }
}
def listPrepend(item: Int, list: ((Int * Int), ((Int * Int), Int) -> (Int * Int)) -> (Int * Int)): ((Int * Int), ((Int * Int), Int) -> (Int * Int)) -> (Int * Int)
{
    fun(state: (Int * Int), folder: ((Int * Int), Int) -> (Int * Int)): (Int * Int) { list(folder(state, item), folder) }
}

def listLength(list: ((Int * Int), ((Int * Int), Int) -> (Int * Int)) -> (Int * Int)): Int
{
    let (length, unused) =
        list((0, 0), fun(state: (Int * Int), newVal: Int): (Int * Int) { let (val1, val2) = state in (val1 + 1, 0) })
    in length
}


def listAccess(index: Int, list: ((Int * Int), ((Int * Int), Int) -> (Int * Int)) -> (Int * Int)): (Int + String)
{
    let (idx, item): (Int * Int) =
        list((index, 0 - 1), fun(state: (Int * Int), newVal: Int): (Int * Int) { 
            let (idx, val) = state in         
            if (idx == 0) { 
                (0, newVal)
            }
            else {
                (idx - 1, val)
            }
        })
    in 
    if (idx <= 0) 
    {
        let return: (Int + String) = inl(item) in return
    }
    else 
    {
        let return: (Int + String) = inr("Not found") in return        
    }
}

let list = listAppend(3, listAppend(2, listEmpty())) in
print(intToString(listLength(list)));

let found: (Int + String) = listAccess(2, list) in
case found of {
      inl(x): Int -> print(intToString(x))
    | inr(x): String -> print("not found")
};

print("notihg")



