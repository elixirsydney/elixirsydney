module ExHtml (..) where

import Html as T


main =
  T.ol
    []
    [ T.li [] [ T.text "hey" ]
    , T.li [] [ T.text "ho" ]
    ]
