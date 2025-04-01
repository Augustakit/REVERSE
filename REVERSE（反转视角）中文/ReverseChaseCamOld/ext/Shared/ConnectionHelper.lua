class "ConnectionHelper"


local fieldTypeMap = {
	eventConnections = "EventConnection",
	propertyConnections = "PropertyConnection",
	linkConnections = "LinkConnection",
}

function ConnectionHelper:AddEventConnection(blueprint, source, sourceEvent, target, targetEvent, targetType)
	local sourceEventSpec = EventSpec()
	sourceEventSpec.id = tonumber(sourceEvent) or MathUtils:FNVHash(sourceEvent)
	local targetEventSpec = EventSpec()
	targetEventSpec.id = tonumber(targetEvent) or MathUtils:FNVHash(targetEvent)
	local eventConnection = EventConnection()
	eventConnection.source = source
	eventConnection.sourceEvent = sourceEventSpec
	eventConnection.target = target
	eventConnection.targetEvent = targetEventSpec
	eventConnection.targetType = targetType
  blueprint.eventConnections:add(eventConnection)
	return eventConnection
end

function ConnectionHelper:_AddSimpleConnection(field, blueprint, source, sourceFieldId, target, targetFieldId)
	local connection = _G[fieldTypeMap[field]]()
	connection.source = source
	connection.sourceFieldId = tonumber(sourceFieldId) or MathUtils:FNVHash(sourceFieldId)
	connection.target = target
	connection.targetFieldId = tonumber(targetFieldId) or MathUtils:FNVHash(targetFieldId)
  blueprint[field]:add(connection)
  return connection
end

function ConnectionHelper:AddLinkConnection(...)
	return self:_AddSimpleConnection('eventConnections', ...)
end

function ConnectionHelper:AddPropertyConnection(...)
	return self:_AddSimpleConnection('propertyConnections', ...)
end



-- Clone connections to and from an instance inside the same blueprint
function ConnectionHelper:CloneConnections(blueprint, original, new)
	for field, type in pairs(fieldTypeMap) do
		for _, connection in pairs(blueprint[field]) do
      for _, sourceOrTarget in ipairs({ 'source, target' }) do
        if connection[sourceOrTarget].instanceGuid == original.instanceGuid then
          local clonedConnection = _G[type](connection:Clone())
          clonedConnection[sourceOrTarget] = new
          blueprint[field]:add(clonedConnection)
        end
      end
		end
	end
end

function ConnectionHelper:CreateNodeConnection(source, target, sourcePort, targetPort, screensToPop)
	local uiNodeConnection = UINodeConnection()
	uiNodeConnection.sourceNode = source
	uiNodeConnection.targetNode = target
	uiNodeConnection.sourcePort = sourcePort
	uiNodeConnection.targetPort = targetPort
	uiNodeConnection.numScreensToPop = screensToPop or 0
	return uiNodeConnection
end

function ConnectionHelper:AddNodeConnection(graphAsset, source, target, sourcePort, targetPort, screensToPop)
	graphAsset.connections:add(self:CreateNodeConnection(source, target, sourcePort, targetPort, screensToPop))
end

function ConnectionHelper:GetNode(typeName, parentGraphAsset, fieldsToPopulate)
	local node = _G[typeName]()
	node.parentGraph = parentGraphAsset
	for _, field in ipairs(fieldsToPopulate or {}) do
		node[field] = UINodePort()
	end
	parentGraphAsset.nodes:add(node)
	return node
end

return ConnectionHelper()