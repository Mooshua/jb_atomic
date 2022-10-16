// This can be found in hammer's sound picker
//const EXPLOSION_SOUND = "c4.Explode"

// Called after the entity is spawned
function Precache() {
    self.PrecacheModel("ennergy/minecraft/sprites/ender_pearl.vmt")
    self.PrecacheModel("jb_shiver/pearling.mp3")
}

// Every 0.1 seconds this function checks for decoy_projectiles in the map
// When found, it checks if the decoy is standing still
// If true create an env_explosion, trigger it and kill the decoy

function GiveGun(weapon, player) {
    local equipper = Entities.CreateByClassname("game_player_equip")

    // set flags and keyvalues
    equipper.__KeyValueFromInt("spawnflags", 5)
    equipper.__KeyValueFromInt(weapon, 0)

    equipper.ValidateScriptScope()

    EntFireByHandle(equipper, "Use", "", 0, player, null)
    EntFireByHandle(equipper, "Kill", "", 0.1, null, null)
}

function Think() {
    local decoy = null
    while ((decoy = Entities.FindByClassname(decoy, "decoy_projectile")) != null) {

        if (decoy.GetOwner().GetName() != "minecraf") {
            continue;
        }

        if (decoy.GetVelocity().LengthSqr() == 0) {
            local owner = decoy.GetOwner()
            local origin = decoy.GetOrigin()

            //local explosion = Entities.CreateByClassname( "env_explosion" )
            //explosion.__KeyValueFromInt( "iMagnitude", 2000 )
            //explosion.SetOrigin( origin )
            //explosion.SetOwner( owner )

            //EntFireByHandle( explosion, "Explode", "", 0.1, owner, owner )
            //DispatchParticleEffect( "explosion_c4_500", origin, origin )

            decoy.EmitSound("jb_shiver/pearling.mp3")
            owner.SetOrigin(origin)

            EntFireByHandle(owner, "SetHealth", "" + (owner.GetHealth() - 8), 0, decoy, decoy)

            //decoy.EmitSound( EXPLOSION_SOUND )
            decoy.Destroy()


            GiveGun("weapon_decoy", owner)
        }
    }
}