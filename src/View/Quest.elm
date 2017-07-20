module View.Quest exposing (view)

-- import Data.Quest exposing (Dialog(..), Quest, Conversation, SpeechData, Choice, QuestState)

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



-- testSpeech : Dialog
-- testSpeech =
--     Speech
--         (SpeechData "QuestReceiver"
--             "Can you help me find XX"
--             [ Choice "yes" "key1"
--             , Choice "no" "key2"
--             ]
--         )
-- card for speech


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
-- TODO add selection var to this function
-- selectedConversation : Maybe Data.Quest.Quest -> Maybe Conversation
-- selectedConversation q =
--     case q of
--         Nothing ->
--             Nothing
--
--         Just quest_ ->
--             Just quest_.prolog
--
--
-- dialogAt : Int -> Maybe Conversation -> Maybe ( String, Dialog )
-- dialogAt pos conv =
--     case conv of
--         Nothing ->
--             Nothing
--
--         Just conv_ ->
--             (List.head conv_)
--
--
-- addChoice : QuestState -> Msg
-- addChoice qState =
--     QuestMsg <|
--         let
--             diag =
--                 selectedConversation qState.quest
--                     |> dialogAt 0
--
--             peka =
--                 Debug.log "diag" diag
--         in
--             case diag of
--                 Nothing ->
--                     qState
--
--                 Just diag_ ->
--                     qState
--
-- addChoice : QuestState -> Msg
-- addChoice qState =
--     QuestMsg <|
--         let
--             q =
--               if qState.quest == Nothing then
--                 QuestState Nothing 0
--             else
--                 qState
--
--             newChoice =
--                 Choice "empty" "noKey"
--         in


update : QuestState -> Int -> Msg
update qState someInt =
    QuestMsg qState


view : Model -> Html Msg
view model =
    speechCard model "ehj"



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
