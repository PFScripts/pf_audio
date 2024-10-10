-- [Functions] --

---@param src number
---@param audio PlayAudio
local function playAudio(src, audio)
  TriggerClientEvent('pf_audio:client:playAudio', src, audio)
end

---@param audio PlayAudioFromCoords
local function playAudioFromCoords(audio)
  TriggerClientEvent('pf_audio:client:playAudioFromCoords', -1, audio)
end

---@param audio PlayAudioFromEntity
local function playAudioFromEntity(audio)
  audio.entity = NetworkGetNetworkIdFromEntity(audio.entity)
  TriggerClientEvent('pf_audio:client:playAudioFromEntity', -1, audio)
end

-- [Exports] --

exports('PlayAudio', playAudio)

exports('PlayAudioFromCoords', playAudioFromCoords)

exports('PlayAudioFromEntity', playAudioFromEntity)