# tassadar-server

This simple rack-based web service uses the pure-ruby [Tassadar](https://github.com/agoragames/tassadar) library
to parse uploaded Starcraft II replay files and send a JSON response.

This service is designed to enable Tassadar in polyglot or browser-based projects where Ruby may not be the significant language.

## Installation

    $ gem install tassadar-server

## Usage

#### Start the server

    $ rackup ./config.ru

You can also mount tassadar-server into a Rails 3 application, or use unicorn to set up a cluster of workers for increased load.

#### Parse a replay

    $ http -f POST http://localhost:9292/sc2/replay file@spec/replays/delta_quadrant.SC2Replay

    POST /sc2/replay HTTP/1.1
    Host: localhost:9292
    Content-Type: multipart/form-data; boundary=cd85979359044d7cac045667d
    cf591c3
    Accept-Encoding: gzip, deflate, compress
    Accept: */*
    Content-Type: application/json
    Content-Length: 633
    Server: WEBrick/1.3.1 (Ruby/1.9.3/2012-04-20)
    Date: Thu, 03 Jan 2013 01:32:21 GMT
    Connection: Keep-Alive

    {"replay":{"game":{"category":"Ladder","map":"Delta Quadrant","speed"
    :"Faster","time":"2011-07-05 18:01:08 -0400","type":"1v1","winner":{"
    actual_race":"Zerg","chosen_race":"Zerg","handicap":100,"id":2569192,
    "name":"redgar","won":true,"color":{"alpha":255,"red":0,"green":66,"b
    lue":255}}},"players":[{"player":{"actual_race":"Terran","chosen_race
    ":"Terran","handicap":100,"id":1918894,"name":"guitsaru","won":false,
    "color":{"alpha":255,"red":180,"green":20,"blue":30}}},{"player":{"ac
    tual_race":"Zerg","chosen_race":"Zerg","handicap":100,"id":2569192,"n
    ame":"redgar","won":true,"color":{"alpha":255,"red":0,"green":66,"blu
    e":255}}}]}}

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
