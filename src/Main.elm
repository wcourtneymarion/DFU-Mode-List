module Main exposing (..)

import Browser
import Element exposing (..)
import Element.Background as Background
import Element.Border as Border
import Element.Font as Font
import Element.Input as Input
import Html exposing (Html)


main =
    Browser.sandbox
        { init = init
        , update = update
        , view = view
        }


type alias Model =
    { myNum : Int
    }


init : Model
init =
    { myNum = 42
    }


type Msg
    = UpdateNum Int


update msg _ =
    case msg of
        UpdateNum newNumber ->
            { myNum = newNumber }


view : Model -> Html Msg
view model =
    Element.layout
        []
    <|
        Element.column
            [ width fill
            , height fill
            , spacing 5
            ]
            [ Element.el [ centerX, centerY, Font.size 50, Font.bold, paddingEach { top = 0, bottom = 20, left = 0, right = 0 } ] <| text <| String.fromInt model.myNum
            , customButton [ Background.color green ] incrementIt model.myNum "Increment"
            , customButton [ Background.color red ] decrementIt model.myNum "Decrement"
            , customButton [ Background.color purple ] doubleIt model.myNum "Double"
            , customButton [ Background.color green ] incrementIt model.myNum "Increment"
            ]


red =
    rgb 1 0 0


green =
    rgb 0 1 0


blue =
    rgb 0 0 1


purple =
    rgb 1 0 1


doubleIt x =
    x * 2


incrementIt x =
    x + 1


decrementIt x =
    x - 1


customButton attr fun myNum txt =
    Input.button
        ([ Background.color <| rgb 0 0 1
         , centerX
         , centerY
         , width <| px 140
         , paddingEach { bottom = 10, left = 10, right = 10, top = 10 }
         ]
            ++ attr
        )
        { onPress = Maybe.Just <| UpdateNum <| fun myNum
        , label = Element.el [ centerX, centerY ] <| text txt
        }
