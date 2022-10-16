value <- 0

function Update() {
    EntFire(self.GetName() + "_txt", "AddOutput", "Message " + value, 0, activator)
}

function InputAdd() {
    value <- value + 1
    Update()
    return true
}

//  Supports divide by 2 only!
function InputDivide() {
    value <- value / 2
    Update()
    return true;
}

function InputSubtract() {
    value <- value - 1
    Update()
    return true
}

function InputGetValue() {
    Update()
    return true
}

function InputSetValue() {
    value <- 0
    Update()
    return true
}

function OnPostSpawn() {
    //self.ConnectOutput("OutValue", "Update")
}