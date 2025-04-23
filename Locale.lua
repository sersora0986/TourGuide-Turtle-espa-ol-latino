local localized
local loc = GetLocale()

-----------------------
--      Engrish      --
-----------------------

local engrish = {
	PART_GSUB = "%s%(Part %d+%)",
	PART_FIND = "(.+)%s%(Part %d+%)",

	-- Mapping.lua
	COORD_MATCH = "%(([%d.]+),%s?([%d.]+)%)",
}

if loc == "esES" then localized = {
	PART_GSUB = "%s%(Parte %d+%)",
	PART_FIND = "(.+)%s%(Parte %d+%)",

	["(.*) is now your home."] = "(.*) es ahora tu hogar.",
	["Quest accepted: (.*)"] = "Misión aceptada: (.*)",
	["^You .*Hitem:(%d+).*(%[.+%])"] = "^Has .*Hitem:(%d+).*(%[.+%])",
	["|cffff4500This quest is not listed in your current guide"] = "|cffff4500Esta misión no está en tu guía actual",
	["This panel lets you choose a guide to load. Upon completion the next guide will load automatically. Completed guides can be reset by shift-clicking."] = "Este panel te permite elegir una guía. Al completarla, se cargará la siguiente automáticamente. Puedes reiniciar guías completadas con Shift+Click.",
	["These settings are saved on a per-char basis."] = "Estas configuraciones se guardan por personaje.",
	["Guides"] = "Guías",
	["Tour Guide - Guides"] = "Tour Guide - Guías",
	["TOURGUIDE_GUIDES"] = "Guías",
	["Options"] = "Opciones",
	["Config"] = "Configuración",
	["|cff%02x%02x%02x%d%% complete"] = "|cff%02x%02x%02x%d%% completado",
	["No Guide Loaded"] = "Ninguna guía cargada",
	["Accept quest"] = "Aceptar misión",
	["Complete quest"] = "Completar misión",
	["Turn in quest"] = "Entregar misión",
	["Kill mob"] = "Matar enemigo",
	["Run to"] = "Corre hacia",
	["Fly to"] = "Vuela a",
	["Set hearth"] = "Establecer hogar",
	["Use hearth"] = "Usar piedra de hogar",
	["Note"] = "Nota",
	["Use item"] = "Usar objeto",
	["Buy item"] = "Comprar objeto",
	["Boat to"] = "Barco a",
	["Get flight point"] = "Obtener punto de vuelo",
	["Tour Guide - Help"] = "Tour Guide - Ayuda",
	["Confused? GOOD! Okey, fine... here's a few hints."] = "¿Confundido? ¡BIEN! Bueno... aquí tienes algunos consejos.",
	["Automatically track quests"] = "Rastreo automático de misiones",
	["Automatically toggle the default quest tracker for current 'complete quest' objectives."] = "Activa automáticamente el rastreo para objetivos de 'misión completada'.",
	["Show status frame"] = "Mostrar marco de estado",
	["Display the status frame with current quest objective."] = "Muestra el marco con el objetivo de misión actual.",
	["Map note coords"] = "Mostrar coordenadas del mapa",
	["Map coordinates found in tooltip notes (requires TomTom)."] = "Muestra coordenadas encontradas en notas (requiere TomTom).",
	["Automatically map questgivers"] = "Mostrar automáticamente los emisores de misión",
	["Automatically map questgivers for accept and turnin objectives (requires LightHeaded and TomTom)."] = "Muestra automáticamente emisores de misión para aceptar y entregar (requiere LightHeaded y TomTom).",
	["Always map coords from notes"] = "Siempre usar coordenadas del mapa",
	["Map note coords even when LightHeaded provides coords."] = "Usar coordenadas de notas incluso si LightHeaded provee otras.",
	["Help"] = "Ayuda",
	["Hide minimap icon"] = "Ocultar icono del minimapa",
} end

-- Metatable majicks... makes localized table fallback to engrish, or fallback to the index requested.
-- This ensures we ALWAYS get a value back, even if it's the index we requested originally
TOURGUIDE_LOCALE = localized and setmetatable(localized, {__index = function(t,i) return engrish[i] or i end})
	or setmetatable(engrish, {__index = function(t,i) return i end})
