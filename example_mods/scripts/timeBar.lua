function onUpdatePost()
    if getPropertyFromClass('ClientPrefs', 'timeBarType') == 'Disabled' then
        close(true)
    else
        setProperty('timeBarBG.visible', false)
  
        setProperty('timeBar.x', 445)
        setProperty('timeBar.scale.x', 3.275)
        setProperty('timeBar.y', 710)
        setObjectCamera('timeBar', 'other')
    end
end