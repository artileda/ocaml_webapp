open Tyxml.Html

let t ~title:title_ body_ =
  html
    ~a:[ a_lang "en" ]
    (head
       (title (txt title_))
       [ meta ~a:[ a_charset "utf-8" ] ()
       ; meta ~a:[ a_name "viewport"; a_content "width=device-width, initial-scale=1" ] ()
       ; meta ~a:[ a_name "theme-color"; a_content "#ffffff" ] ()
       ; link
           ~rel:[ `Stylesheet ]
           ~href:"https://unpkg.com/tailwindcss@^1.8/dist/tailwind.min.css"
           ()
       ])
    (body body_)
;;
