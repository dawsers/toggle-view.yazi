-- Toggle different views on/off: parent, current, preview
local function entry(st, args)
  local action = args[1]
  if not action then
    return
  end

  if st.view == nil then
    st.old_parent = MANAGER.ratio.parent
    st.old_current = MANAGER.ratio.current
    st.old_preview = MANAGER.ratio.preview
    st.parent = st.old_parent
    st.current = st.old_current
    st.preview = st.old_preview
    st.layout = Tab.layout
    st.view = true -- initialized
  end

  if action == "parent" then
    if st.parent > 0 then
      st.parent = 0
    else
      st.parent = st.old_parent
    end
  elseif action == "current" then
    if st.current > 0 then
      st.current = 0
    else
      st.current = st.old_current
    end
  elseif action == "preview" then
    if st.preview > 0 then
      st.preview = 0
    else
      st.preview = st.old_preview
    end
  else
    return
  end
  Tab.layout = function(self)
    local all = st.parent + st.current + st.preview
    self._chunks = ui.Layout()
      :direction(ui.Layout.HORIZONTAL)
      :constraints({
        ui.Constraint.Ratio(st.parent, all),
        ui.Constraint.Ratio(st.current, all),
        ui.Constraint.Ratio(st.preview, all),
      })
      :split(self._area)
  end
	ya.app_emit("resize", {})
end

local function enabled(st) return st.view ~= nil end

return { entry = entry, enabled = enabled }
