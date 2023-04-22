--
-- CSA.lua
--
-- Copyright (c) 2023 Vi'o'Lence / CarloMagazoni
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy of
-- this software and associated documentation files (the "Software"), to deal in
-- the Software without restriction, including without limitation the rights to
-- use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies
-- of the Software, and to permit persons to whom the Software is furnished to do
-- so, subject to the following conditions:
--
-- The above copyright notice and this permission notice shall be included in all
-- copies or substantial portions of the Software.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-- IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-- FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
-- AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
-- LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
-- OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
-- SOFTWARE.
--

local CSA = {_version = "0.1.0"}

function CSA.draw (name, class, parent, leftOffset, topOffset, height, width, isVisible, isEnabled, color, source)
    if class then
       if class == form then
          name = makeForm(name, height, width, isVisible, isEnabled, color)
       elseif class == label then
              name = makeLabel(name, parent, leftOffset, topOffset, height, width, isVisible, isEnabled, color)
       elseif class == button then
              name = makeButton(name, parent, leftOffset, topOffset, height, width, isVisible, isEnabled, color)
       elseif class == image then
              name = makeImage(name, parent, leftOffset, topOffset, height, width, isVisible, isEnabled, source)
       elseif class == panel then
              name = makePanel(name, parent, leftOffset, topOffset, height, width, isVisible, isEnabled, color)
       elseif class == progressBar then
              name = makeProgressBar(name, parent, leftOffset, topOffset, height, width, isVisible, isEnabled)
       end
    end
end

local function makeForm (name, height, width, isVisible, isEnabled, color)
    name = createForm()
    name.Height = height
    name.Width = width
    name.Visible = isVisible
    name.Enable = isEnabled
    name.color = color
    name.Position = "poScreenCenter"
    name.ShownInTaskBar = "stAlways"
    name.BorderStyle = "bsSingle"
end

local function makeLabel (name, parent, leftOffset, topOffset, height, width, isVisible, isEnabled, color)
    name = createLabel(parent)
    name.AutoSize = false
    name.Height = height
    name.Width = width
    name.Visible = isVisible
    name.Enable = isEnabled
    if color == "transparent" then
       name.transparent = true
    else name.color = color end
    name.Left = leftOffset
    name.Top = topOffset
    name.Caption = "-"
    name.Alignment = "taCenter"
    name.parentFont = true
end

local function makeButton (name, parent, leftOffset, topOffset, height, width, isVisible, isEnabled, color)
    name = createButton(parent)
    name.AutoSize = false
    name.Height = height
    name.Width = width
    name.Visible = isVisible
    name.Enable = isEnabled
    name.color = color
    name.Left = leftOffset
    name.Top = topOffset
    name.Caption = "-"
    name.parentFont = true
end

local function makeImage (name, parent, leftOffset, topOffset, height, width, isVisible, isEnabled, source)
    name = createImage(parent)
    name.AutoSize = false
    name.KeepOriginXWhenClipped = false
    name.KeepOriginYWhenClipped = false
    name.AntialiasingMode = "amOn"
    name.Height = height
    name.Width = width
    name.Visible = isVisible
    name.Enable = isEnabled
    name.Left = leftOffset
    name.Top = topOffset
    name.picture = getImage(source)
end

local function getImage (url)
    local WEB = getInternet()
    local img = WEB.getURL(url)
    local Stream = createStringStream(img)
    local pic = createPicture()
    pic.loadFromStream(Stream)
    Stream.destroy()
    WEB.destroy()
    return pic
end

local function makePanel (name, parent, leftOffset, topOffset, height, width, isVisible, isEnabled, color)
    name = createPanel(parent)
    name.AutoSize = false
    name.Height = height
    name.Width = width
    name.Visible = isVisible
    name.Enable = isEnabled
    name.color = color
    name.Left = leftOffset
    name.Top = topOffset
    name.parentFont = true
    name.BevelColor = color
    name.bevelInner = "bdNone"
    name.bevelOuter = "bvRaised"
    name.BevelWidth = 1
    name.BorderStyle = "bsNone"
    name.Borderwidt = 0
    name.Alignment = "taCenter"
end

local function makeProgressBar (name, parent, leftOffset, topOffset, height, width, isVisible, isEnabled)
    name = createProgressBar(parent)
    name.Height = height
    name.Width = width
    name.Visible = isVisible
    name.Enable = isEnabled
    name.color = color
    name.Left = leftOffset
    name.Top = topOffset
    name.Style = "pbstNormal"
    name.Smooth = true
    name.min = 0
    name.max = 100
    name.step = 10
    name.Orientation = "pbVertical"
    name.position = 100
    name.parentFont = true
end

return CSA