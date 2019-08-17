--[[
Copyright © Lili, 2019
All rights reserved.
 
Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:
 
    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above copyright
      notice, this list of conditions and the following disclaimer in the
      documentation and/or other materials provided with the distribution.
    * Neither the name of Smeagol nor the
      names of its contributors may be used to endorse or promote products
      derived from this software without specific prior written permission.
 
THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL <your name> BE LIABLE FOR ANY
DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
]]
 
_addon.name = 'Indi-Nope'
_addon.author = 'Lili'
_addon.version = '1.0.0'

--[[
Indi-nope 1.0.0
Hides visual effects from geomancy on players.

Currently does not hide geomancy effect around luopans.

No commands. Load it and it's on, unload and it's off.

Thanks to Leviathan.Comeatmebro, this addon is a port to windower of his Ashita code with the same functionality.
]]

windower.register_event('incoming chunk',function(id,original,modified,injected,blocked)
	if injected or blocked then return end
	
	if id == 0x00D then
		offset = 67 -- 0x043
	elseif id == 0x037 then
		offset = 89 -- 0x059
	else
		return false
	end

	bubble = original:byte(offset)
	if bubble ~= 0 then
		packet = original:sub(1,offset-1)..string.char(0)..original:sub(offset+1)
		return packet
	end
end)