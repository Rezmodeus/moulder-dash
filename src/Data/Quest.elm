-- Quest dialog


module Data.Quest exposing (..)

import Dict exposing (..)
import Array exposing (..)


type alias Key =
    String


type alias Speaker =
    String


type alias SpeechText =
    String


type alias Choice =
    { speaker : Key
    , text : Key
    , nextKey : Key
    }


type alias QuestText =
    { speaker : Key
    , text : Key
    , choices : Array Choice
    }


type alias Quest =
    { prolog : QuestTextKey
    , active : QuestTextKey
    , success : QuestTextKey
    , failure : QuestTextKey
    , rewardActions : List Int
    }


type alias SpeechTexts =
    Dict.Dict Key SpeechText


type alias Speakers =
    Dict.Dict Key Speaker


type alias QuestTextKey =
    String


type alias QuestTexts =
    Dict.Dict Key QuestText


type alias Quests =
    Dict.Dict Key Quest



-- type alias Choice =
--     { text : String
--     , nextId : String
--     }
--
--
--
--
-- type alias SpeechData =
--     { speaker : String
--     , text : String
--     , choices : List Choice
--     }
--
--
-- type Dialog
--     = Speech SpeechData
--     | DoEvents (List Event)
--     | Test Int
--
--
-- type alias Conversation =
--     List ( String, Dialog )
--
--
-- type alias Quest =
--     { prolog : Conversation
--     , active : Conversation
--     , success : Conversation
--     , failure : Conversation
--     , rewardActions : List Int
--     }
-- Editor data


type alias QuestState =
    { quests : Quests
    , questKey : Key
    }


initQuestState : QuestState
initQuestState =
    QuestState Dict.empty ""



-- standard move to next speech
-- nextSpeech : String -> List Choice
-- nextSpeech key =
--     [ Choice "ok" key ]
-- fetchQuestConversationProlog : Conversation
-- fetchQuestConversationProlog =
--     [ ( "key0"
--       , Speech
--             (SpeechData "QuestReceiver"
--                 "Can you help me find XX"
--                 [ Choice "yes" "key1"
--                 , Choice "no" "key2"
--                 ]
--             )
--       )
--     , ( "key0", Speech (SpeechData "QuestGiver" "Great" (nextSpeech "key3")) )
--     , ( "key0", Speech (SpeechData "QuestGiver" "ok later then" (nextSpeech "key0")) )
--     , ( "key3", DoEvents ([]) )
--     ]
-- subjects can be items, players, npc, quests etc, any thing
-- animal : start_attack : player
-- player : TriggerEvent : event
-- works both directions
-- player : receive : reward
-- sometimes parameters are omitted or not used
-- current_quest : step_quest : current_quest


type alias Event =
    { subject1 : String
    , verb : VerbType
    , subject2 : String
    }



-- VerbTypes need proper and valid subjects
-- StepQuest can't be run on anything that is not a quest


type VerbType
    = StartAttack
    | Attack
    | Receive
    | StepQuest
    | TriggerEvent
