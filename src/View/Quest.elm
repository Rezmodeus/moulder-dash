module View.Quest exposing (view)

import Data.Quest exposing (QuestState)
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


speechCard : Model -> String -> Html Msg
speechCard model speechData =
    let
        q =
            model.questState
    in
        Card.view
            [ Color.background (Color.color Color.DeepOrange Color.S400)
            , css "width" "492px"
            , css "height" "192px"
            ]
            [ Card.title [] [ Card.head [ white ] [ text "speechData.speaker" ] ]
            , Card.text [ white ] [ text "speechData.text" ]
            , Card.actions
                [ Card.border, css "vertical-align" "center", css "text-align" "right", white ]
                [ Button.render Mdl
                    [ 8, 1 ]
                    model.mdl
                    -- TODO handle messages locally for quests
                    [ Button.icon, Button.ripple, Options.onClick (update q 1) ]
                    [ Icon.i "favorite_border" ]
                , Button.render Mdl
                    [ 8, 2 ]
                    model.mdl
                    [ Button.icon, Button.ripple, Options.onClick (TestMsg "clickety") ]
                    [ Icon.i "event_available" ]
                ]
            ]



-- local quest handlers


update : QuestState -> Int -> Msg
update qState someInt =
    QuestMsg qState


view : Model -> Html Msg
view model =
    speechCard model "ehj"
