<h1 align='center'>
  Native Audio API
</h1>

<div align="center">
  An easy way for developers to implement native audio on their projects!
</div>

<div align='center'>
  
  ![GitHub License](https://img.shields.io/github/license/PFScripts/pf_audio?label=License&labelColor=%E2%80%8E%E2%80%8E&color=%2330b893)
  <a href='https://discord.gg/QhMmyx8xsE'>
    ![Discord](https://img.shields.io/discord/1279910494425186446?style=flat&logo=discord&logoColor=%2330b893&label=%E2%80%8E%20&labelColor=%E2%80%8E%E2%80%8E&color=%2330b893)
  </a>
</div>

## `Information`

* **FiveM:** Works out of the box.
* **RedM:** WIP (I have no time to test this on RedM atm, but I'm aware that the natives are quite similar but there are more of them, I never checked them out, anyways it should not be too painful to adapt it to RedM).
* **Stop/Pause:** Stop or Pause an audio thats already playing its not supported.
* **Loop:** Looping an audio is not supported.

## `FAQ` 

### `Is this built from scratch?`

Nah I just went through Manason code and adapt it for my own needs and likings, also I wanted to expand this to RedM soo yea, Ill leave the repo of his audio api bellow.

- [**mana_audio**](https://github.com/Manason/mana_audio)

### `How can I add new audio?` 

  **1.** If you never worked with native audio before i advice you to check this FiveM Forum Thread.

  - [**[How-to] Make a SimpleSound using native audio**](https://forum.cfx.re/t/how-to-make-a-simplesound-using-native-audio/5156001)

  **2.** You'll need a tool like the one below or just make everything on your own from scratch 🤓.

  - [**native-audio-tool**](https://github.com/JoeSzymkowiczFiveM/native-audio-tool)

  **3.** After you're done with you're files, create a new folder in audios folder with you're native audio content. The scructure of the audios folder should be as bellow.

  ```
  /audios
    /newAudioFolder1
      /audiodirectory
      /data
    /newAudioFolder2
      /audiodirectory
      /data
    /newAudioFolder3
      /audiodirectory
      /data
  ```

## `Client Features` 

### `PlayAudio`
Plays an audio not located within the 3D world.
```lua
  exports.pf_audio:PlayAudio({
    bank = 'example_audiobank',
    soundset = 'example_soundset'
    name = 'example_audio'
  })
```

### `PlayAudioFromCoords`
Plays an audio from a specific coordinate located within the 3D world.
```lua
  exports.pf_audio:PlayAudioFromCoords({
    bank = 'example_audiobank',
    soundset = 'example_soundset'
    name = 'example_audio',
    coords = vec3(0, 0, 0),
    range = 10
  })
```

### `PlayAudioFromEntity`
Plays an audio from a specific entity located within the 3D world.
```lua
  exports.pf_audio:PlayAudioFromEntity({
    bank = 'example_audiobank',
    soundset = 'example_soundset'
    name = 'example_audio',
    entity = PlayerPedId()
  })
```

## `Server Features` 

### `PlayAudio`
Plays an audio not located within the 3D world for a specific client or to all clients.
```lua
  -- Specify the player source or leave it -1 to play the audio for all the clients.
  exports.pf_audio:PlayAudio(source, {
    bank = 'example_audiobank',
    soundset = 'example_soundset'
    name = 'example_audio'
  })
```

### `PlayAudioFromCoords`
Plays an audio from a specific coordinate located within the 3D world to all clients.
```lua
  exports.pf_audio:PlayAudioFromCoords({
    bank = 'example_audiobank',
    soundset = 'example_soundset'
    name = 'example_audio',
    coords = vec3(0, 0, 0),
    range = 10
  })
```

### `PlayAudioFromEntity`
Plays an audio from a specific entity located within the 3D world to all clients.
```lua
  exports.pf_audio:PlayAudioFromEntity({
    bank = 'example_audiobank',
    soundset = 'example_soundset'
    name = 'example_audio',
    entity = GetPlayerPed(1)
  })
```