local IsRunningRedM<const> = GetGameName() == 'redm' and true or false

-- [Functions] --

local function requestAudio(audioBank)
  local timeout = 1000
  local scriptAudioBank = string.format('audiodirectory/%s', audioBank)
  while not RequestScriptAudioBank(scriptAudioBank, false) do
    if timeout == 0 then return false end
    timeout -= 1
    Wait(0)
  end
  return GetSoundId()
end

local function releaseAudio(audioId, audioBank)
  ReleaseSoundId(audioId)
  ReleaseNamedScriptAudioBank(audioBank)
end

---@param audio PlayAudio
local function playAudio(audio)
  if not audio.bank or not audio.name or not audio.soundset then return end
  local audioId = requestAudio(audio.bank)
  if not audioId then return end
  if IsRunningRedM then
    PlaySoundFrontendWithSoundId(audioId, audio.name, audio.soundset, false)
  else
    PlaySoundFrontend(audioId, audio.name, audio.soundset, false)
  end
  releaseAudio(audioId, audio.bank)
end

---@param audio PlayAudioFromCoords
local function playAudioFromCoords(audio)
  if not audio.bank or not audio.name or not audio.soundset or not audio.coords or not audio.range then return end
  local audioId = requestAudio(audio.bank)
  if not audioId then return end
  if IsRunningRedM then
    PlaySoundFromPositionWithId(audioId, audio.name, audio.coords.x, audio.coords.y, audio.coords.z, audio.soundset, false, audio.range, false)
  else
    PlaySoundFromCoord(audioId, audio.name, audio.coords.x, audio.coords.y, audio.coords.z, audio.soundset, false, audio.range, false)
  end
  releaseAudio(audioId, audio.bank)
end

---@param audio PlayAudioFromEntity
local function playAudioFromEntity(audio)
  if not audio.bank or not audio.name or not audio.soundset or not audio.entity then return end
  if not DoesEntityExist(audio.entity) then return end
  local audioId = requestAudio(audio.bank)
  if not audioId then return end
  if IsRunningRedM then
    PlaySoundFromEntityWithSet(audioId, audio.name, audio.entity, audio.soundset, false, false)
  else
    PlaySoundFromEntity(audioId, audio.name, audio.entity, audio.soundset, false, false)
  end
  releaseAudio(audioId, audio.bank)
end

-- [Exports] --

exports('PlayAudio', playAudio)

exports('PlayAudioFromCoords', playAudioFromCoords)

exports('PlayAudioFromEntity', playAudioFromEntity)

-- [Events] --

RegisterNetEvent('pf_audio:client:playAudio', playAudio)

RegisterNetEvent('pf_audio:client:playAudioFromCoords', playAudioFromCoords)

---@param audio PlayAudioFromEntity
RegisterNetEvent('pf_audio:client:playAudioFromEntity', function(audio)
  if not NetworkDoesNetworkIdExist(audio.entity) then return end
  audio.entity = NetworkGetEntityFromNetworkId(audio.entity)
  playAudioFromEntity(audio)
end)