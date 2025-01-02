/obj/item/roboupgrade/music
    name = "Sound Synthesizer Upgrade"
    desc = "An upgrade to a cyborg's vocal synthesizer that allows it to replicate the sounds of various instruments."
    icon_state = "bike_horn" // uhh how do i sprite
    active = 1

    // var/list/choices = list("Piano", "Saxophone", "Guitar", "Electric Guitar", "Bass", "Trumpet", "Fiddle", "Banjo")
    var/list/instruments = null

    New()
        ..()
        instruments = list(
            "Piano" = new /obj/item/instrument/large/piano(src),
            "Saxophone" = new /obj/item/instrument/saxophone(src),
            "Guitar" = new /obj/item/instrument/guitar(src),
            "Electric Guitar" = new /obj/item/instrument/electricguitar(src),
            "Bass" = new /obj/item/instrument/bass(src),
            "Trumpet" = new /obj/item/instrument/trumpet(src),
            "Fiddle" = new /obj/item/instrument/fiddle(src),
            "Banjo" = new /obj/item/instrument/banjo(src),
        )

    upgrade_activate(var/mob/living/silicon/robot/user as mob)
        if (..())
            return
        var/instrument = tgui_input_list(user, "Instrument", "Sound Synthesizer Upgrade", instruments)
        instrument.just_gimmie_ui(user)