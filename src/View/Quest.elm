module View.Quest exposing (view)

import Data.Quest exposing (Dialog(..), SpeechData, Choice, QuestState)
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


testSpeech : Dialog
testSpeech =
    Speech
        (SpeechData "QuestReceiver"
            "Can you help me find XX"
            [ Choice "yes" "key1"
            , Choice "no" "key2"
            ]
        )



-- card for speech


speechCard : Model -> SpeechData -> Html Msg
speechCard model speechData =
    Card.view
        [ Color.background (Color.color Color.DeepOrange Color.S400)
        , css "width" "192px"
        , css "height" "192px"
        ]
        [ Card.title [] [ Card.head [ white ] [ text speechData.speaker ] ]
        , Card.text [ white ] [ text speechData.text ]
        , Card.actions
            [ Card.border, css "vertical-align" "center", css "text-align" "right", white ]
            [ Button.render Mdl
                [ 8, 1 ]
                model.mdl
                -- TODO handle messages locally for quests
                [ Button.icon, Button.ripple, Options.onClick (update "hej") ]
                [ Icon.i "favorite_border" ]
            , Button.render Mdl
                [ 8, 2 ]
                model.mdl
                [ Button.icon, Button.ripple, Options.onClick (TestMsg "clickety") ]
                [ Icon.i "event_available" ]
            ]
        ]



-- TODO handle messages locally for quests


update : String -> Msg
update msg =
    QuestMsg (QuestState msg)


view : Model -> Html Msg
view model =
    case testSpeech of
        Speech data ->
            -- TODO: remove hardcoded
            speechCard model data

        _ ->
            text "no no"



-- Card.view
--     [ Color.background (Color.color Color.DeepOrange Color.S400)
--     , css "width" "192px"
--     , css "height" "192px"
--     ]
--     [ Card.title [] [ Card.head [ white ] [ text "Roskilde Festival" ] ]
--     , Card.text [ white ] [ text "Buy tickets before May" ]
--     , Card.actions
--         [ Card.border, css "vertical-align" "center", css "text-align" "right", white ]
--         [ Button.render Mdl
--             [ 8, 1 ]
--             model.mdl
--             [ Button.icon, Button.ripple ]
--             [ Icon.i "favorite_border" ]
--         , Button.render Mdl
--             [ 8, 2 ]
--             model.mdl
--             [ Button.icon, Button.ripple, Options.onClick (TestMsg "clickety") ]
--             [ Icon.i "event_available" ]
--         ]
--     ]
