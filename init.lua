local function entry(st)
  if st.view == nil then
    st.parent = MANAGER.ratio.parent
    st.current = MANAGER.ratio.current
    st.layout = Tab.layout
    st.view = 1 -- maximized
  end

  if st.view == 0 then
    Tab.layout = st.layout
    st.view = 1 -- maximized preview
  elseif st.view == 1 then
		Tab.layout = function(self)
			self._chunks = ui.Layout()
				:direction(ui.Layout.HORIZONTAL)
				:constraints({
					ui.Constraint.Percentage(0),
					ui.Constraint.Percentage(0),
					ui.Constraint.Percentage(100),
				})
				:split(self._area)
		end
    st.view = 2 -- no preview
  elseif st.view == 2 then
		Tab.layout = function(self)
			local all = st.parent + st.current
			self._chunks = ui.Layout()
				:direction(ui.Layout.HORIZONTAL)
				:constraints({
					ui.Constraint.Ratio(st.parent, all),
					ui.Constraint.Ratio(st.current, all),
					ui.Constraint.Length(1),
				})
				:split(self._area)
		end
    st.view = 3 -- only current
  else
		Tab.layout = function(self)
			self._chunks = ui.Layout()
				:direction(ui.Layout.HORIZONTAL)
				:constraints({
					ui.Constraint.Percentage(0),
					ui.Constraint.Percentage(100),
					ui.Constraint.Percentage(0),
				})
				:split(self._area)
		end
    st.view = 0  -- default
  end
	ya.app_emit("resize", {})
end

local function enabled(st) return st.view ~= nil end

return { entry = entry, enabled = enabled }
