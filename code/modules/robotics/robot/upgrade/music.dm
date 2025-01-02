/obj/item/roboupgrade/music
    name = "sound synthesizer upgrade"
    desc = "An upgrade to a cyborg's vocal synthesizer that allows it to replicate the sounds of various instruments."
    // icon_state = "" // uhh how do i sprite
    active = 1

    var/list/instruments = null

    New()
        ..()
        instruments = list(
            new /obj/item/instrument/large/piano(src),
            new /obj/item/instrument/saxophone(src),
            new /obj/item/instrument/guitar(src),
            new /obj/item/instrument/electricguitar(src),
            new /obj/item/instrument/bass(src),
            new /obj/item/instrument/trumpet(src),
            new /obj/item/instrument/fiddle(src),
            new /obj/item/instrument/banjo(src),
        )

    upgrade_activate(var/mob/living/silicon/robot/user as mob)
        if (..())
            return
        var/obj/item/instrument/instrument = tgui_input_list(user, "Instrument", "Sound Synthesizer Upgrade", instruments)
        instrument.ui_interact(user)

    upgrade_deactivate(var/mob/living/silicon/robot/user as mob)
        if (..())
            return
        for (var/obj/item/instrument/instrument in instruments)
            tgui_process.close_uis(instrument)
