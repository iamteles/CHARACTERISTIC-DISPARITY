function onSongStart()
    setPropertyFromGroup('opponentStrums', 0, 'x', defaultPlayerStrumX0);
    setPropertyFromGroup('opponentStrums', 1, 'x', defaultPlayerStrumX1);
    setPropertyFromGroup('opponentStrums', 2, 'x', defaultPlayerStrumX2);
    setPropertyFromGroup('opponentStrums', 3, 'x', defaultPlayerStrumX3);
    setPropertyFromGroup('playerStrums', 0, 'x', defaultOpponentStrumX0);
    setPropertyFromGroup('playerStrums', 1, 'x', defaultOpponentStrumX1);
    setPropertyFromGroup('playerStrums', 2, 'x', defaultOpponentStrumX2);
    setPropertyFromGroup('playerStrums', 3, 'x', defaultOpponentStrumX3);
end

function onStepHit()

if curStep == 8 then
    noteTweenAlpha("Notealpha1", 0, 0.5, 1, "circOut")
    noteTweenAlpha("Notealpha2", 1, 0.5, 1, "circOut")
    noteTweenAlpha("Notealpha3", 2, 0.5, 1, "circOut")
    noteTweenAlpha("Notealpha4", 3, 0.5, 1, "circOut")
end
if curStep == 1440 then
    noteTweenX("Notemovemiddle1", 0, 405, 1, "circOut")
    noteTweenX("Notemovemiddle2", 1, 520, 1, "circOut")
    noteTweenX("Notemovemiddle3", 2, 635, 1, "circOut")
    noteTweenX("Notemovemiddle4", 3, 750, 1, "circOut")

    noteTweenX("Notemovemiddle5", 4, 405, 1, "circOut")
    noteTweenX("Notemovemiddle6", 5, 520, 1, "circOut")
    noteTweenX("Notemovemiddle7", 6, 635, 1, "circOut")
    noteTweenX("Notemovemiddle8", 7, 750, 1, "circOut")

    noteTweenAlpha("Notealpha1", 0, 0.14, 1, "circOut")
    noteTweenAlpha("Notealpha2", 1, 0.14, 1, "circOut")
    noteTweenAlpha("Notealpha3", 2, 0.14, 1, "circOut")
    noteTweenAlpha("Notealpha4", 3, 0.14, 1, "circOut")
end
end