function onHealthChange(creature, attacker, primaryDamage, primaryType, secondaryDamage, secondaryType, origin)
    print("Attacker: " .. attacker:getName())
    print("Victim: " .. creature:getName())

    return primaryDamage, primaryType, secondaryDamage, secondaryType
end
