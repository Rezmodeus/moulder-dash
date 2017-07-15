module View.Quest exposing (view)

import Model exposing (Model)
import Msg exposing (Msg(..))
import Html exposing (Html, text, div, span)
import Material.Icon as Icon
import Material.Button as Button
import Material.Color as Color
import Material.Card as Card
import Material.Options as Options exposing (css, cs, when, onClick)


white : Options.Property c m
white =
    Color.text Color.white


view : Model -> Html Msg
view model =
    Card.view
        [ Color.background (Color.color Color.DeepOrange Color.S400)
        , css "width" "192px"
        , css "height" "192px"
        ]
        [ Card.title [] [ Card.head [ white ] [ text "Roskilde Festival" ] ]
        , Card.text [ white ] [ text "Buy tickets before May" ]
        , Card.actions
            [ Card.border, css "vertical-align" "center", css "text-align" "right", white ]
            [ Button.render Mdl
                [ 8, 1 ]
                model.mdl
                [ Button.icon, Button.ripple ]
                [ Icon.i "favorite_border" ]
            , Button.render Mdl
                [ 8, 2 ]
                model.mdl
                [ Button.icon, Button.ripple, Options.onClick (TestMsg "clickety") ]
                [ Icon.i "event_available" ]
            ]
        ]
