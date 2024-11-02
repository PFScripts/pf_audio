fx_version 'cerulean'
games {'rdr3', 'gta5'}
use_experimental_fxv2_oal 'yes'
lua54 'yes'

author 'pf_scripts'
description 'Simple API for playing simple audio data files!'
repository 'https://github.com/PFScripts/pf_audio'
version '1.0.0'

client_scripts {'client/*.lua'}
server_scripts {'server/*.lua'}

files {'**.awc', '**.dat54.rel'}

-- [Arrest Audios] --

data_file 'AUDIO_WAVEPACK' 'audios/arrest_audios/audiodirectory'
data_file 'AUDIO_SOUNDDATA' 'audios/arrest_audios/data/arrest_sounds.dat'

-- [Elevator Audios] --

data_file 'AUDIO_WAVEPACK' 'audios/elevator_audios/audiodirectory'
data_file 'AUDIO_SOUNDDATA' 'audios/elevator_audios/data/elevator_sounds.dat'