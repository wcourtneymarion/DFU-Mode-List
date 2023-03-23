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


type alias Device =
    { modelName : String, model : String, instructions : List String }


type alias Model =
    { devices : List Device
    }


init : Model
init =
    { devices =
        [ { modelName = "8th Generation wifi only"
          , model = "a2270"
          , instructions =
                [ "1. Connect the iPad to a computer with Apple Configurator installed."
                , "2. Press and hold the power button and home button simultaneously for 10 seconds."
                , "3. Release the power button but continue to hold the home button for an additional 5 seconds."
                , "4. Apple Configurator should detect the iPad in DFU mode and prompt you to restore or update the device."
                ]
          }
        , { modelName = "7th Generation wifi only"
          , model = "a2197"
          , instructions =
                [ "1. Connect the iPad to a computer with Apple Configurator installed."
                , "2. Press and hold the power button and home button simultaneously for 10 seconds."
                , "3. Release the power button but continue to hold the home button for an additional 5 seconds."
                , "4. Apple Configurator should detect the iPad in DFU mode and prompt you to restore or update the device."
                ]
          }
        , { modelName = "8th Generation cellular"
          , model = "a2429"
          , instructions =
                [ "1. Connect the iPad to a computer with Apple Configurator installed."
                , "2. Press and hold the power button and home button simultaneously for 10 seconds."
                , "3. Release the power button but continue to hold the home button for an additional 5 seconds."
                , "4. Apple Configurator should detect the iPad in DFU mode and prompt you to restore or update the device."
                ]
          }
        , { modelName = "11-inch iPad Pro 3rd generation"
          , model = "a1980"
          , instructions =
                [ "1. Connect the iPad to a computer with Apple Configurator installed."
                , "2. Press and quickly release the volume up button."
                , "3. Press and quickly release the volume down button."
                , "4. Press and hold the power button until the screen goes black."
                , "5. While continuing to hold the power button, press and hold the volume down button for 5 seconds."
                , "6. Release the power button but continue to hold the volume down button for an additional 10 seconds."
                , "7. Apple Configurator should detect the iPad in DFU mode and prompt you to restore or update the device."
                ]
          }
        , { modelName = "MacBook Air with Apple M1 chip"
          , model = "MacBookAir10,1"
          , instructions =
                [ "1. Connect the MacBook Air to another Mac using a USB-C cable."
                , "2. Press and hold the power button on the MacBook Air for about 6 seconds until it turns off."
                , "3. Press and hold the power button again, but this time also press and hold the left Shift key and the right Option key."
                , "4. Release all three keys after 10 seconds."
                , "5. Apple Configurator or Xcode should detect the MacBook Air in DFU mode and prompt you to restore or update the device."
                ]
          }
        , { modelName = "MacBook Pro 16-inch 2019"
          , model = "MacBookPro16,1"
          , instructions =
                [ "1. Connect the MacBook Pro to another Mac using a USB-C cable."
                , "2. Press and quickly release the power button on the MacBook Pro to turn it off."
                , "3. Press and hold the right Shift key, the left Option key, and the left Control key for 7 seconds."
                , "4. While still holding those keys, press and hold the power button for 7 seconds."
                , "5. Release all four keys after 7 seconds."
                , "6. Apple Configurator or Xcode should detect the MacBook Pro in DFU mode and prompt you to restore or update the device."
                ]
          }
        ]
    }


type Msg
    = UpdateNum Int


update msg model =
    case msg of
        UpdateNum newNumber ->
            model


view : Model -> Html Msg
view model =
    Element.layout
        [ paddingXY 10 60
        , Background.color <| grey 40
        ]
    <|
        Element.column [ centerX, spacing 50 ]
            [ Element.el
                [ centerX
                , Font.size 35
                , Font.bold
                , Font.color white
                , Font.shadow { blur = 10, color = black, offset = ( 2, 4 ) }
                ]
              <|
                text "Device Firmware Update (DFU Mode)"
            , Element.column
                [ width fill
                , height fill
                , spacing 30
                ]
              <|
                List.map deviceToElement model.devices
            ]


deviceToElement device =
    let
        titleWidth =
            300

        modelNumber =
            Element.el [ centerX, Font.color white, Font.bold ] <| text device.model

        modelName =
            Element.el [ centerX, Font.color white, Font.bold ] <| text device.modelName

        instructions =
            Element.column
                [ width fill
                , spacing 20
                , Font.color <| grey 225
                , Font.shadow { blur = 2, color = black, offset = ( 1, 1 ) }
                ]
            <|
                List.map (\y -> paragraph [] [ text y ]) device.instructions
    in
    Element.el
        [ centerX
        , width <| px 900
        , Background.color <| grey 90
        , Background.gradient { angle = pi, steps = [ grey 70, grey 90 ] }
        , Border.shadow
            { offset = ( 2, 4 )
            , color = black
            , size = 1
            , blur = 10
            }
        , Border.roundEach { topLeft = 0, topRight = 50, bottomRight = 25, bottomLeft = 100 }
        ]
    <|
        Element.row
            [ width fill
            , padding 20
            ]
            [ Element.column
                [ paddingXY 30 0
                , width <| px 350
                , spacing 15
                , moveUp 40
                , Font.shadow { blur = 10, color = black, offset = ( 2, 4 ) }
                ]
                [ modelName
                , modelNumber
                ]
            , instructions
            ]


red =
    rgb 1 0 0


green =
    rgb 0 1 0


blue =
    rgb 0 0 1


purple =
    rgb 1 0 1


grey x =
    rgb255 x x x


black =
    grey 0


white =
    grey 255
