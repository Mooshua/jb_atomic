//  By Mooshua

from <- Entities.FindByName(null, "lj_vscript_from")
to <- Entities.FindByName(null, "lj_vscript_to")
fromdest <- Entities.FindByName(null, "lj_vscript_dest_from")
todest <- Entities.FindByName(null, "lj_vscript_dest_to")

function OnTouch() {

    printl("TOUCHED")
    printl(activator)

    //  !activator is the toucher
    local position = activator.GetOrigin().y

    local X = position
    local A = from.GetOrigin().y
    local B = to.GetOrigin().y
    local C = fromdest.GetOrigin().y
    local D = todest.GetOrigin().y

    local new_position = (X - A) / (B - A) * (D - C) + C
    local fromdestorigin = fromdest.GetOrigin()

    activator.SetOrigin(Vector(fromdestorigin.x, new_position, fromdestorigin.z))

}


printl("EXECUTED")