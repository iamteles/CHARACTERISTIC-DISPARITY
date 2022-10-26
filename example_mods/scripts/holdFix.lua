local holding = {}

local function hold(char, id, sustain)
    holding[char] = sustain and
                        not getPropertyFromGroup('notes', id, 'noAnimation') and
                        not stringEndsWith(
                            getPropertyFromGroup('notes', id,
                                                 'animation.curAnim.name'),
                            'end')
end

function onUpdatePost()
    for char, holds in pairs(holding) do
        if holds and
            stringStartsWith(getProperty(char .. '.animation.curAnim.name'),
                             'sing') and
            not stringEndsWith(getProperty(char .. '.animation.curAnim.name'),
                               'miss') and
            getProperty(char .. '.animation.curAnim.frames.length') > 2 and
            getProperty(char .. '.animation.curAnim.curFrame') > 1 then
            setProperty(char .. '.animation.curAnim.curFrame', 0)
        end
    end
end

function goodNoteHit(id, direction, noteType, isSustainNote)
    hold(getPropertyFromGroup('notes', id, 'gfNote') and 'gf' or 'boyfriend',
         id, isSustainNote)
end

function opponentNoteHit(id, direction, noteType, isSustainNote)
    hold(getPropertyFromGroup('notes', id, 'gfNote') and 'gf' or 'dad', id,
         isSustainNote)
end

function noteMissPress() holding.boyfriend = false end

function noteMiss() holding.boyfriend = false end
