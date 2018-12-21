Config = {}
Config.Locale = 'en'

Config.Units = {
    mph = {
        multiplier = 2.236936,
        display = 'mph'
    },
    kph = {
        multiplier = 3.6,
        display = 'km/h'
    }
}

Config.SpeedUnit = Config.Units.mph
Config.DefaultLimit = 50
Config.DefaultAllowedSecondsBelowSpeed = 5