local AddonName, Table = ...
local function defaultFunc(_, key)
	return key
end
Table.Localize = setmetatable({}, {__index=defaultFunc})