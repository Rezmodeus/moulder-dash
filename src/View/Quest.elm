module View.Quest exposing (view)

import Data.Quest exposing (QuestState, SpeechText)
import Model exposing (Model)
import Msg exposing (Msg(..))
import Html exposing (Html, text, div, span)
import Material.Icon as Icon
import Material.Button as Button
import Material.Color as Color
import Material.Card as Card
import Material.Options as Options exposing (css, cs, when, onClick, onInput)
import Material.Textfield as Textfield
import Dict exposing (..)


white : Options.Property c m
white =
    Color.text Color.white


speechCard : Model -> SpeechText -> Html Msg
speechCard model speechText =
    Card.view
        [ Color.background (Color.color Color.DeepOrange Color.S400)
        , css "width" "292px"
        , css "height" "192px"
        ]
        [ Card.title [] [ Card.head [ white ] [ text "SpeechText" ] ]
        , Card.text [ white ] [ text speechText ]
        , Card.actions
            [ Card.border, css "vertical-align" "center", css "text-align" "right", white ]
            [ Button.render Mdl
                [ 8, 1 ]
                model.mdl
                [ Button.icon, Button.ripple, Options.onClick (TestMsg "clickety") ]
                [ Icon.i "favorite_border" ]
            , Button.render Mdl
                [ 8, 2 ]
                model.mdl
                [ Button.icon, Button.ripple, Options.onClick (TestMsg "clickety") ]
                [ Icon.i "event_available" ]
            ]
        ]


speechCards : Model -> List (Html Msg)
speechCards model =
    let
        texts =
            model.questState.speechTexts
    in
        Dict.values texts
            |> List.map (speechCard model)


testCard : Model -> String -> Html Msg
testCard model speechData =
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


textField : Model -> String -> Html Msg
textField model label =
    Textfield.render Mdl
        [ 2 ]
        model.mdl
        [ Textfield.label label
        , Textfield.floatingLabel
        , Textfield.text_
        , Textfield.value model.speechTextField
        , Options.onInput SpeechTextField
        ]
        []


addButton : Model -> Html Msg
addButton model =
    Button.render Mdl
        [ 8, 1 ]
        model.mdl
        [ Button.icon, Button.ripple, Options.onClick (addSpeechText model) ]
        [ Icon.i "note_add" ]



-- local quest handlers


getKey : Model -> String
getKey model =
    "kek" ++ (toString model.questState.keyNr)


addSpeechText : Model -> Msg
addSpeechText model =
    let
        newTexts =
            Dict.insert (getKey model) model.speechTextField model.questState.speechTexts

        qState =
            model.questState

        newState =
            { qState
                | speechTexts = newTexts
                , keyNr = model.questState.keyNr + 1
            }
    in
        AddSpeechText newState


update : QuestState -> Int -> Msg
update qState someInt =
    QuestMsg qState


view : Model -> Html Msg
view model =
    div []
        [ div []
            [ textField model "Speech text"
            , addButton model
            ]
        , div [] (speechCards model)
        ]
