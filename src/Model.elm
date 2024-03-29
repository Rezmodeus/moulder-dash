module Model exposing (Model, init, initialModel)

import Msg exposing (Msg(Mdl))
import Material
import Material.Snackbar as Snackbar
import Route exposing (Route)
import Types exposing (User)
import Dict exposing (Dict)
import Navigation
import Data.Quest exposing (QuestState, initQuestState)


type alias Model =
    { mdl : Material.Model
    , snackbar : Snackbar.Model (Maybe Msg)
    , history : List (Maybe Route)
    , users : List User
    , toggles : Dict (List Int) Bool
    , selectedMail : String
    , speechTextField : String
    , questState : QuestState
    }


initialModel : Maybe Route -> Model
initialModel location =
    { mdl = Material.model
    , snackbar = Snackbar.model
    , history = Route.init location
    , users = mockUsers
    , toggles = Dict.empty
    , selectedMail = "elm.mdl@example.0"
    , speechTextField = "nada"
    , questState = initQuestState
    }


init : Navigation.Location -> ( Model, Cmd Msg )
init location =
    (location |> Route.locFor |> initialModel) ! [ Material.init Mdl ]


mockUsers : List User
mockUsers =
    []
