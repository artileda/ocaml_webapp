open Tyxml.Html

let index =
  Layout.t ~title:"Index" [ div 
    [p [txt "Test"]]
  ]