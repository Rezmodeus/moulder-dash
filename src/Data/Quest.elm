-- Quest dialog


module Data.Quest exposing (..)


type alias Choice =
    { text : String
    , nextId : String
    }


type alias SpeechData =
    { speaker : String
    , text : String
    , choices : List Choice
    }


type Dialog
    = Speech SpeechData
    | DoEvents (List Event)


type alias Conversation =
    List ( String, Dialog )


type alias QuestState =
    { str : String }


initQuestState : QuestState
initQuestState =
    QuestState "aa"



-- standard move to next speech


nextSpeech : String -> List Choice
nextSpeech key =
    [ Choice "ok" key ]


fetchQuestConversationProlog : Conversation
fetchQuestConversationProlog =
    [ ( "key0"
      , Speech
            (SpeechData "QuestReceiver"
                "Can you help me find XX"
                [ Choice "yes" "key1"
                , Choice "no" "key2"
                ]
            )
      )
    , ( "key0", Speech (SpeechData "QuestGiver" "Great" (nextSpeech "key3")) )
    , ( "key0", Speech (SpeechData "QuestGiver" "ok later then" (nextSpeech "key0")) )
    , ( "key3", DoEvents ([]) )
    ]



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
