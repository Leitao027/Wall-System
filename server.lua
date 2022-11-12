local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")

vRPclient = Tunnel.getInterface("vRP")
arc = {}
Tunnel.bindInterface("system_wall",arc)
Proxy.addInterface("system_wall",arc)
vRP = Proxy.getInterface("vRP")

local webhookwall = ""

-----------------------------------------------------------------------------------------------------------------------------------------
-- GET USER ID AND STEAMHEX
-----------------------------------------------------------------------------------------------------------------------------------------	
function arc.getId(sourceplayer)
    local sourceplayer = sourceplayer
	if sourceplayer ~= nil and sourceplayer ~= 0 then
		local user_id = vRP.getUserId(sourceplayer)
		if user_id then
			return user_id
		end
	end
end

-----------------------------------------------------------------------------------------------------------------------------------------
-- USER PERMISSION
-----------------------------------------------------------------------------------------------------------------------------------------	
function arc.getPermissao(toogle)
    local source = source
    local user_id = vRP.getUserId(source)
    if vRP.hasPermission(user_id,"Admin") then
        return true
    else
        return false
    end
end

-----------------------------------------------------------------------------------------------------------------------------------------
--LOG DAS LINHAS
-----------------------------------------------------------------------------------------------------------------------------------------
function arc.reportlinesLog(toggle)
	local source = source
	local user_id = vRP.getUserId(source)
	local identity = vRP.userIdentity(user_id)
	if user_id then
        local imageurl = ""
        PerformHttpRequest(webhookwall, function(err, text, headers) end, 'POST', json.encode({username = ' Log AM ', avatar_url = imageurl, embeds = {
                { 	------------------------------------------------------------
                    title = "Log ``/lines`` ativado",
                    fields = {
                        { 
                            name = "**Staff:\n**",
                             value = "``📌 #"..user_id.." "..identity["name"].." "..identity["name2"].."``"
                        }
                    }, 
                    footer = { 
                        text = "Horario da log: "..os.date("%d/%m/%Y | %H:%M:%S"),
                        icon_url = imageurl
                    },
                    color = 3093194 
                }
            }
        }), { ['Content-Type'] = 'application/json' })
    end
end

function arc.reportunlinesLog(toggle)
	local source = source
	local user_id = vRP.getUserId(source)
	local identity = vRP.userIdentity(user_id)
	if user_id then
        local imageurl = "https://cdn.discordapp.com/attachments/1006735616328863764/1035403435979317348/Screenshot_20221028-010257_WhatsApp.jpg"
        PerformHttpRequest(webhookwall, function(err, text, headers) end, 'POST', json.encode({username = ' Log AM ', avatar_url = imageurl, embeds = {
                { 	------------------------------------------------------------
                    title = "Log ``/lines`` desativado",
                    fields = {
                        { 
                            name = "**Staff:\n**",
                             value = "``📌 #"..user_id.." "..identity["name"].." "..identity["name2"].."``"
                        }
                    }, 
                    footer = { 
                        text = "⏱️ Horario da log: "..os.date("%d/%m/%Y | %H:%M:%S"),
                        icon_url = imageurl
                    },
                    color = 3093194,
                }
            }
        }), { ['Content-Type'] = 'application/json' })
    end
end

-----------------------------------------------------------------------------------------------------------------------------------------
--LOG DO AM
-----------------------------------------------------------------------------------------------------------------------------------------
function arc.reportwallLog(toggle)
	local source = source
	local user_id = vRP.getUserId(source)
	local identity = vRP.userIdentity(user_id)
	if user_id then
        local imageurl = "https://cdn.discordapp.com/attachments/1006735616328863764/1035403435979317348/Screenshot_20221028-010257_WhatsApp.jpg"
        PerformHttpRequest(webhookwall, function(err, text, headers) end, 'POST', json.encode({username = ' Log AM ', avatar_url = imageurl, embeds = {
                { 	------------------------------------------------------------
                    title = "Log ``/am`` ativado",
                    fields = {
                        { 
                            name = "**Staff:\n**",
                             value = "``📌 #"..user_id.." "..identity["name"].." "..identity["name2"].."``"
                        }
                    }, 
                    footer = { 
                        text = "⏱️ Horario da log: "..os.date("%d/%m/%Y | %H:%M:%S"),
                        icon_url = imageurl
                    },
                    color = 1286027
                }
            }
        }), { ['Content-Type'] = 'application/json' })
    end
end

function arc.reportunwallLog(toggle)
	local source = source
	local user_id = vRP.getUserId(source)
	local identity = vRP.userIdentity(user_id)
	if user_id then
        local imageurl = "https://cdn.discordapp.com/attachments/1006735616328863764/1035403435979317348/Screenshot_20221028-010257_WhatsApp.jpg"
        PerformHttpRequest(webhookwall, function(err, text, headers) end, 'POST', json.encode({username = ' Log AM ', avatar_url = imageurl, embeds = {
                { 	------------------------------------------------------------
                    title = "Log ``/am`` desativado",
                    fields = {
                        { 
                            name = "**Staff:\n**",
                            value = "``📌 #"..user_id.." "..identity["name"].." "..identity["name2"].."``"
                        }
                    }, 
                    footer = { 
                        text = "⏱️ Horario da log: "..os.date("%d/%m/%Y | %H:%M:%S"),
                        icon_url = imageurl
                    },
                    color = 1286027
                }
            }
        }), { ['Content-Type'] = 'application/json' })
    end
end


print("^2 WALL INICIADO COM SUCESSO")