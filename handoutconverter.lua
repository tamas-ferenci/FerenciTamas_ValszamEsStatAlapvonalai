function Meta(m)
  if FORMAT=="beamer" then m.documentclass="beamer" end
  return m
end

function Pandoc(doc)
    if FORMAT=="beamer" then
      local hblocks = {}
      for i,el in pairs(doc.blocks) do
          if (el.t == "Div" and el.classes[1] == "handout") or
             (el.t == "BlockQuote") or
             (el.t == "RawBlock" and el.format == "tex" and string.match( el.text, "includegraphics" ) ) or
             (el.t == "RawBlock" and el.format == "tex" and string.match( el.text, "handout" ) ) or
             (el.t == "OrderedList" and el.style == "Example") or
             (el.t == "Para" and el.c[1].t == "Image") or
             (el.t == "Header") then
             table.insert(hblocks, el)
          end
      end
      return pandoc.Pandoc(hblocks, doc.meta)
    end
end