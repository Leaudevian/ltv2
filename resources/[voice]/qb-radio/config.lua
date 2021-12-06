Config = {}

Config.RestrictedChannels = 10 -- channels that are encrypted (EMS, Fire and police can be included there) if we give eg 10, channels from 1 - 10 will be encrypted

Config.MaxFrequency = 500

Config.messages = {
  ['not_on_radio'] = 'Vous n\'êtes pas connecté à cette fréquence',
  ['on_radio'] = 'Vous êtes déjà sur cette fréquence',
  ['joined_to_radio'] = 'Votre connecté à: <b>',
  ['restricted_channel_error'] = 'Vous ne pouvez pas rejoindre cette fréquence!',
  ['invalid_radio'] = 'Cette fréquence n\'est pas disponible.',
  ['you_on_radio'] = 'Vous êtes déjà connecté sur cette fréquence',
  ['you_leave'] = 'Vous avez quitté la fréquence.'
}