-- Quest


module Data.Quest exposing (..)

import Dict exposing (..)
import Array exposing (..)


-- keys


type alias Key =
    String


type alias QuestKey =
    String


type alias SpeakerKey =
    String


type alias Speaker =
    String


type alias SpeechText =
    String



-- dict data structures


type alias Choice =
    { speaker : Key
    , text : Key
    , nextKey : Key
    }


type QuestSegment
    = JustText QuestText
    | QuestEvent Int


type alias QuestText =
    { speaker : Key
    , text : Key
    , choices : Array Choice
    }


type alias Quest =
    { prolog : QuestKey
    , active : QuestKey
    , success : QuestKey
    , failure : QuestKey
    , rewardActions : List Int
    }



-- Dicts


type alias SpeechTexts =
    Dict.Dict Key SpeechText


type alias Speakers =
    Dict.Dict SpeakerKey Speaker


type alias QuestTexts =
    Dict.Dict Key QuestText


type alias Quests =
    Dict.Dict Key QuestSegment



-- Events WIP


type alias Event =
    { subject1 : Key
    , verb : VerbType
    , subject2 : Key
    }



-- VerbTypes need proper and valid subjects
-- StepQuest can't be run on anything that is not a quest


type VerbType
    = StartAttack
    | Attack
    | Receive
    | StepQuest
    | TriggerEvent



-- data for view


initSpeechTexts : Dict.Dict String SpeechText
initSpeechTexts =
    Dict.fromList [ ( "a", "text 1" ), ( "b", "text 2" ), ( "c", "text 3" ) ]


type alias QuestState =
    { quests : Quests
    , speechTexts : SpeechTexts
    , questKey : QuestKey
    }


initQuestState : QuestState
initQuestState =
    QuestState Dict.empty initSpeechTexts ""
