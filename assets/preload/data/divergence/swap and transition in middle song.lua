function onSongStart()
        noteTweenX("Notemove1", 0, 730, 1, "circOut")
        noteTweenX("Notemove2", 1, 845, 1, "circOut")
        noteTweenX("Notemove3", 2, 955, 1, "circOut")
        noteTweenX("Notemove4", 3, 1065, 1, "circOut")
    
        noteTweenAlpha("Notealpha1", 0, 0.5, 1, "circOut")
        noteTweenAlpha("Notealpha2", 1, 0.5, 1, "circOut")
        noteTweenAlpha("Notealpha3", 2, 0.5, 1, "circOut")
        noteTweenAlpha("Notealpha4", 3, 0.5, 1, "circOut")
    
        noteTweenX("Notemove5", 4, 95, 1, "circOut")
        noteTweenX("Notemove6", 5, 205, 1, "circOut")
        noteTweenX("Notemove7", 6, 315, 1, "circOut")
        noteTweenX("Notemove8", 7, 425, 1, "circOut")
    
        noteTweenAngle("Noterotate1", 0, 360, 1, "circOut")
        noteTweenAngle("Noterotate2", 1, 360, 1, "circOut")
        noteTweenAngle("Noterotate3", 2, 360, 1, "circOut")
        noteTweenAngle("Noterotate4", 3, 360, 1, "circOut")
        
        noteTweenAngle("Noterotate5", 4, -360, 1, "circOut")
        noteTweenAngle("Noterotate6", 5, -360, 1, "circOut")
        noteTweenAngle("Noterotate7", 6, -360, 1, "circOut")
        noteTweenAngle("Noterotate8", 7, -360, 1, "circOut")
end

function onStepHit()
    if curStep == 1440 then
        noteTweenX("Notemovemiddle1", 0, 405, 1, "circOut")
        noteTweenX("Notemovemiddle2", 1, 520, 1, "circOut")
        noteTweenX("Notemovemiddle3", 2, 635, 1, "circOut")
        noteTweenX("Notemovemiddle4", 3, 750, 1, "circOut")
    
        noteTweenX("Notemovemiddle5", 4, 405, 1, "circOut")
        noteTweenX("Notemovemiddle6", 5, 520, 1, "circOut")
        noteTweenX("Notemovemiddle7", 6, 635, 1, "circOut")
        noteTweenX("Notemovemiddle8", 7, 750, 1, "circOut")
    
        noteTweenAlpha("Notealpha1", 0, 0.05, 1, "circOut")
        noteTweenAlpha("Notealpha2", 1, 0.05, 1, "circOut")
        noteTweenAlpha("Notealpha3", 2, 0.05, 1, "circOut")
        noteTweenAlpha("Notealpha4", 3, 0.05, 1, "circOut")
    end
end