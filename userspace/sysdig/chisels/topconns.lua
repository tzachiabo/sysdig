--[[

 
This program is free software: you can redistribute it and/or modify




This program is distributed in the hope that it will be useful,





along with this program.  If not, see <http://www.gnu.org/licenses/>.
--]]

-- Chisel description
description = "Shows the top network connections in terms of total (in+out) bandwidth";
short_description = "top connections by total bytes";
category = "net";

-- Chisel argument list
args = {}

-- The number of items to show
TOP_NUMBER = 10

-- Argument notification callback
function on_set_arg(name, val)
	return false
end

-- Initialization callback
function on_init()
	chisel.exec("fdbytes_by_internal", 
		"fd.name", 
		"evt.rawarg.res",
		"(fd.type=ipv4 or fd.type=ipv6) and evt.is_io=true", 
		"" .. TOP_NUMBER)
	return true
end
