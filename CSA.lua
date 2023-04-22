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

--local CSA = {_version = "0.1.2"}
local CSA ={}

function CSA.draw (class, parent, leftOffset, topOffset, height, width, isVisible, isEnabled, color, source)
    local uiComponent
    if class then
       if class == "form" then
          uiComponent = makeForm(height, width, isVisible, isEnabled, color)
       elseif class == label then
              uiComponent = makeLabel(parent, leftOffset, topOffset, height, width, isVisible, isEnabled, color)
       elseif class == button then
              uiComponent = makeButton(parent, leftOffset, topOffset, height, width, isVisible, isEnabled, color)
       elseif class == image then
              uiComponent = makeImage(parent, leftOffset, topOffset, height, width, isVisible, isEnabled, source)
       elseif class == panel then
              uiComponent = makePanel(parent, leftOffset, topOffset, height, width, isVisible, isEnabled, color)
       elseif class == progressBar then
              uiComponent = makeProgressBar(parent, leftOffset, topOffset, height, width, isVisible, isEnabled)
       end
    return uiComponent
    end
end

function makeForm (height, width, isVisible, isEnabled, color)
    ui = createForm()
    ui.Height = height
    ui.Width = width
    ui.Visible = isVisible
    ui.Enable = isEnabled
    ui.color = color
    ui.Position = "poScreenCenter"
    ui.ShownInTaskBar = "stAlways"
    ui.BorderStyle = "bsSingle"
    return ui
end

function makeLabel (parent, leftOffset, topOffset, height, width, isVisible, isEnabled, color)
    ui = createLabel(parent)
    ui.AutoSize = false
    ui.Height = height
    ui.Width = width
    ui.Visible = isVisible
    ui.Enable = isEnabled
    if color == "transparent" then
       ui.transparent = true
    else ui.color = color end
    ui.Left = leftOffset
    ui.Top = topOffset
    ui.Caption = "-"
    ui.Alignment = "taCenter"
    ui.parentFont = true
    return ui
end

function makeButton (parent, leftOffset, topOffset, height, width, isVisible, isEnabled, color)
    ui = createButton(parent)
    ui.AutoSize = false
    ui.Height = height
    ui.Width = width
    ui.Visible = isVisible
    ui.Enable = isEnabled
    ui.color = color
    ui.Left = leftOffset
    ui.Top = topOffset
    ui.Caption = "-"
    ui.parentFont = true
    return ui
end

function makeImage (parent, leftOffset, topOffset, height, width, isVisible, isEnabled, source)
    ui = createImage(parent)
    ui.AutoSize = false
    ui.KeepOriginXWhenClipped = false
    ui.KeepOriginYWhenClipped = false
    ui.AntialiasingMode = "amOn"
    ui.Height = height
    ui.Width = width
    ui.Visible = isVisible
    ui.Enable = isEnabled
    ui.Left = leftOffset
    ui.Top = topOffset
    ui.picture = getImage(source)
    return ui
end

function getImage (url)
    local WEB = getInternet()
    local img = WEB.getURL(url)
    local Stream = createStringStream(img)
    local pic = createPicture()
    pic.loadFromStream(Stream)
    Stream.destroy()
    WEB.destroy()
    return pic
end

function makePanel (parent, leftOffset, topOffset, height, width, isVisible, isEnabled, color)
    ui = createPanel(parent)
    ui.AutoSize = false
    ui.Height = height
    ui.Width = width
    ui.Visible = isVisible
    ui.Enable = isEnabled
    ui.color = color
    ui.Left = leftOffset
    ui.Top = topOffset
    ui.parentFont = true
    ui.BevelColor = color
    ui.bevelInner = "bdNone"
    ui.bevelOuter = "bvRaised"
    ui.BevelWidth = 1
    ui.BorderStyle = "bsNone"
    ui.Borderwidt = 0
    ui.Alignment = "taCenter"
    return ui
end

function makeProgressBar (parent, leftOffset, topOffset, height, width, isVisible, isEnabled)
    ui = createProgressBar(parent)
    ui.Height = height
    ui.Width = width
    ui.Visible = isVisible
    ui.Enable = isEnabled
    ui.color = color
    ui.Left = leftOffset
    ui.Top = topOffset
    ui.Style = "pbstNormal"
    ui.Smooth = true
    ui.min = 0
    ui.max = 100
    ui.step = 10
    ui.Orientation = "pbVertical"
    ui.position = 100
    ui.parentFont = true
    return ui
end

return CSA