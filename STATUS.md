# Ruma Status

The following chart shows the status of support for the endpoints in the [client-server API specification](https://matrix.org/docs/spec/client_server/latest.html).
If you're interested in working on an API, take a look at the corresponding tracking issue and leave a comment indicating your interest!

Legend:

:white_check_mark: Supported :construction: Partially supported :no_entry_sign: Not supported

<table>
  <tr>
    <th>Status</th>
    <th>Issue</th>
    <th>API endpoint</th>
  </tr>
  <tr>
    <th align="left" colspan="3">Versions</th>
  </tr>
  <tr>
    <td align="center">:no_entry_sign:</td>
    <a href="https://github.com/gperdomor/matrix-swift-sdk/issues/1">#1</a>
    <td>GET /versions</td>
  </tr>
  <tr>
    <th align="left" colspan="3">Session</th>
  </tr>
  <tr>
    <td align="center">:no_entry_sign:</td>
    <a href="https://github.com/gperdomor/matrix-swift-sdk/issues/2">#2</a>
    <td>POST /login</td>
  </tr>
  <tr>
    <td align="center">:no_entry_sign:</td>
    <a href="https://github.com/gperdomor/matrix-swift-sdk/issues/3">#3</a>
    <td>POST /tokenrefresh</td>
  </tr>
  <tr>
    <td align="center">:no_entry_sign:</td>
    <a href="https://github.com/gperdomor/matrix-swift-sdk/issues/4">#4</a>
    <td>POST /logout</td>
  </tr>
  <tr>
    <th align="left" colspan="3">Account registration and management</th>
  </tr>
  <tr>
    <td align="center">:no_entry_sign:</td>
    <a href="https://github.com/gperdomor/matrix-swift-sdk/issues/5">#5</a>
    <td>POST /register</td>
  </tr>
  <tr>
    <td align="center">:no_entry_sign:</td>
    <a href="https://github.com/gperdomor/matrix-swift-sdk/issues/6">#6</a>
    <td>POST /account/password/email/requestToken</td>
  </tr>
  <tr>
    <td align="center">:no_entry_sign:</td>
    <a href="https://github.com/gperdomor/matrix-swift-sdk/issues/7">#7</a>
    <td>POST /account/deactivate</td>
  </tr>
  <tr>
    <td align="center">:no_entry_sign:</td>
    <a href="https://github.com/gperdomor/matrix-swift-sdk/issues/8">#8</a>
    <td>POST /account/password</td>
  </tr>
  <tr>
    <td align="center">:no_entry_sign:</td>
    <a href="https://github.com/gperdomor/matrix-swift-sdk/issues/9">#9</a>
    <td>POST /register/email/requestToken</td>
  </tr>
  <tr>
    <th align="left" colspan="3">Adding account administrative contact information</th>
  </tr>
  <tr>
    <td align="center">:no_entry_sign:</td>
    <a href="https://github.com/gperdomor/matrix-swift-sdk/issues/20">#10</a>
    <td>POST /account/3pid</td>
  </tr>
  <tr>
    <td align="center">:no_entry_sign:</td>
    <a href="https://github.com/gperdomor/matrix-swift-sdk/issues/11">#11</a>
    <td>GET /account/3pid</td>
  </tr>
  <tr>
    <td align="center">:no_entry_sign:</td>
    <a href="https://github.com/gperdomor/matrix-swift-sdk/issues/12">#12</a>
    <td>POST /account/3pid/email/requestToken</td>
  </tr>
  <tr>
    <th align="left" colspan="3">Filtering</th>
  </tr>
  <tr>
    <td align="center">:no_entry_sign:</td>
    <a href="https://github.com/gperdomor/matrix-swift-sdk/issues/13">#13</a>
    <td>GET /user/:user_id/filter/:filter_id</td>
  </tr>
  <tr>
    <td align="center">:no_entry_sign:</td>
    <a href="https://github.com/gperdomor/matrix-swift-sdk/issues/14">#14</a>
    <td>POST /user/:user_id/filter</td>
  </tr>
  <tr>
    <th align="left" colspan="3">Syncing events</th>
  </tr>
  <tr>
    <td align="center">:no_entry_sign:</td>
    <a href="https://github.com/gperdomor/matrix-swift-sdk/issues/15">#15</a>
    <td>GET /sync</td>
  </tr>
  <tr>
    <th align="left" colspan="3">Getting events for a room</th>
  </tr>
  <tr>
    <td align="center">:no_entry_sign:</td>
    <a href="https://github.com/gperdomor/matrix-swift-sdk/issues/16">#16</a>
    <td>GET /rooms/:room_id/state</td>
  </tr>
  <tr>
    <td align="center">:no_entry_sign:</td>
    <a href="https://github.com/gperdomor/matrix-swift-sdk/issues/17">#17</a>
    <td>GET /rooms/:room_id/members</td>
  </tr>
  <tr>
    <td align="center">:no_entry_sign:</td>
    <a href="https://github.com/gperdomor/matrix-swift-sdk/issues/18">#18</a>
    <td>GET /rooms/:room_id/state/:event_type/:state_key</td>
  </tr>
  <tr>
    <td align="center">:no_entry_sign:</td>
    <a href="https://github.com/gperdomor/matrix-swift-sdk/issues/19">#19</a>
    <td>GET /rooms/:room_id/state/:event_type</td>
  </tr>
  <tr>
    <td align="center">:no_entry_sign:</td>
    <a href="https://github.com/gperdomor/matrix-swift-sdk/issues/20">#20</a>
    <td>GET /rooms/:room_id/messages</td>
  </tr>
  <tr>
    <th align="left" colspan="3">Sending events to a room</th>
  </tr>
  <tr>
    <td align="center">:no_entry_sign:</td>
    <a href="https://github.com/gperdomor/matrix-swift-sdk/issues/21">#21</a>
    <td>PUT /rooms/:room_id/state/:event_type</td>
  </tr>
  <tr>
    <td align="center">:no_entry_sign:</td>
    <a href="https://github.com/gperdomor/matrix-swift-sdk/issues/22">#22</a>
    <td>PUT /rooms/:room_id/state/:event_type/:state_key</td>
  </tr>
  <tr>
    <td align="center">:no_entry_sign:</td>
    <a href="https://github.com/gperdomor/matrix-swift-sdk/issues/23">#23</a>
    <td>PUT /rooms/:room_id/send/:event_type/:transaction_id</td>
  </tr>
  <tr>
    <th align="left" colspan="3">Redactions</th>
  </tr>
  <tr>
    <td align="center">:no_entry_sign:</td>
    <a href="https://github.com/gperdomor/matrix-swift-sdk/issues/24">#24</a>
    <td>PUT /rooms/:room_id/redact/:event_id/:transaction_id</td>
  </tr>
  <tr>
    <th align="left" colspan="3">Room creation</th>
  </tr>
  <tr>
    <td align="center">:no_entry_sign:</td>
    <a href="https://github.com/gperdomor/matrix-swift-sdk/issues/25">#25</a>
    <td>POST /createRoom</td>
  </tr>
  <tr>
    <th align="left" colspan="3">Room aliases</th>
  </tr>
  <tr>
    <td align="center">:no_entry_sign:</td>
    <a href="https://github.com/gperdomor/matrix-swift-sdk/issues/26">#26</a>
    <td>PUT /directory/room/:room_alias</td>
  </tr>
  <tr>
    <td align="center">:no_entry_sign:</td>
    <a href="https://github.com/gperdomor/matrix-swift-sdk/issues/27">#27</a>
    <td>DELETE /directory/room/:room_alias</td>
  </tr>
  <tr>
    <td align="center">:no_entry_sign:</td>
    <a href="https://github.com/gperdomor/matrix-swift-sdk/issues/28">#28</a>
    <td>GET /directory/room/:room_alias</td>
  </tr>
  <tr>
    <th align="left" colspan="3">Joining rooms</th>
  </tr>
  <tr>
    <td align="center">:no_entry_sign:</td>
    <a href="https://github.com/gperdomor/matrix-swift-sdk/issues/29">#29</a>
    <td>POST /rooms/:room_id/invite</td>
  </tr>
  <tr>
    <td align="center">:no_entry_sign:</td>
    <a href="https://github.com/gperdomor/matrix-swift-sdk/issues/30">#30</a>
    <td>POST /join/:room_id_or_alias</td>
  </tr>
  <tr>
    <td align="center">:no_entry_sign:</td>
    <a href="https://github.com/gperdomor/matrix-swift-sdk/issues/31">#31</a>
    <td>POST /rooms/:room_id/join</td>
  </tr>
  <tr>
    <td align="center">:no_entry_sign:</td>
    <a href="https://github.com/gperdomor/matrix-swift-sdk/issues/32">#32</a>
    <td>POST /rooms/:room_id/kick</td>
  </tr>
  <tr>
    <td align="center">:no_entry_sign:</td>
    <a href="https://github.com/gperdomor/matrix-swift-sdk/issues/33">#33</a>
    <td>POST /rooms/:room_id/unban</td>
  </tr>
  <tr>
    <td align="center">:no_entry_sign:</td>
    <a href="https://github.com/gperdomor/matrix-swift-sdk/issues/34">#34</a>
    <td>POST /rooms/:room_id/ban</td>
  </tr>
  <tr>
    <th align="left" colspan="3">Leaving rooms</th>
  </tr>
  <tr>
    <td align="center">:no_entry_sign:</td>
    <a href="https://github.com/gperdomor/matrix-swift-sdk/issues/35">#35</a>
    <td>POST /rooms/:room_id/forget</td>
  </tr>
  <tr>
    <td align="center">:no_entry_sign:</td>
    <a href="https://github.com/gperdomor/matrix-swift-sdk/issues/36">#36</a>
    <td>POST /rooms/:room_id/leave</td>
  </tr>
  <tr>
    <th align="left" colspan="3">Listing rooms</th>
  </tr>
  <tr>
    <td align="center">:no_entry_sign:</td>
    <a href="https://github.com/gperdomor/matrix-swift-sdk/issues/37">#37</a>
    <td>GET /publicRooms</td>
  </tr>
  <tr>
    <th align="left" colspan="3">Profiles</th>
  </tr>
  <tr>
    <td align="center">:no_entry_sign:</td>
    <a href="https://github.com/gperdomor/matrix-swift-sdk/issues/38">#38</a>
    <td>PUT /profile/:user_id/displayname</td>
  </tr>
  <tr>
    <td align="center">:no_entry_sign:</td>
    <a href="https://github.com/gperdomor/matrix-swift-sdk/issues/39">#39</a>
    <td>GET /profile/:user_id/displayname</td>
  </tr>
  <tr>
    <td align="center">:no_entry_sign:</td>
    <a href="https://github.com/gperdomor/matrix-swift-sdk/issues/40">#40</a>
    <td>PUT /profile/:user_id/avatar_url</td>
  </tr>
  <tr>
    <td align="center">:no_entry_sign:</td>
    <a href="https://github.com/gperdomor/matrix-swift-sdk/issues/41">#41</a>
    <td>GET /profile/:user_id/avatar_url</td>
  </tr>
  <tr>
    <td align="center">:no_entry_sign:</td>
    <a href="https://github.com/gperdomor/matrix-swift-sdk/issues/42">#42</a>
    <td>GET /profile/:user_id</td>
  </tr>
  <tr>
    <th align="left" colspan="3">Voice over IP</th>
  </tr>
  <tr>
    <td align="center">:no_entry_sign:</td>
    <a href="https://github.com/gperdomor/matrix-swift-sdk/issues/43">#43</a>
    <td>GET /voip/turnServer</td>
  </tr>
  <tr>
    <th align="left" colspan="3">Typing notifications</th>
  </tr>
  <tr>
    <td align="center">:no_entry_sign:</td>
    <a href="https://github.com/gperdomor/matrix-swift-sdk/issues/44">#44</a>
    <td>PUT /rooms/:room_id/typing/:user_id</td>
  </tr>
  <tr>
    <th align="left" colspan="3">Receipts</th>
  </tr>
  <tr>
    <td align="center">:no_entry_sign:</td>
    <a href="https://github.com/gperdomor/matrix-swift-sdk/issues/45">#45</a>
    <td>POST /rooms/:room_id/receipt/:receipt_type/:event_id</td>
  </tr>
  <tr>
    <th align="left" colspan="3">Presence</th>
  </tr>
  <tr>
    <td align="center">:no_entry_sign:</td>
    <a href="https://github.com/gperdomor/matrix-swift-sdk/issues/46">#46</a>
    <td>PUT /presence/:user_id/status</td>
  </tr>
  <tr>
    <td align="center">:no_entry_sign:</td>
    <a href="https://github.com/gperdomor/matrix-swift-sdk/issues/47">#47</a>
    <td>GET /presence/:user_id/status</td>
  </tr>
  <tr>
    <td align="center">:no_entry_sign:</td>
    <a href="https://github.com/gperdomor/matrix-swift-sdk/issues/48">#48</a>
    <td>POST /presence/list/:user_id</td>
  </tr>
  <tr>
    <td align="center">:no_entry_sign:</td>
    <a href="https://github.com/gperdomor/matrix-swift-sdk/issues/49">#49</a>
    <td>GET /presence/list/:user_id</td>
  </tr>
  <tr>
    <th align="left" colspan="3">Content repository</th>
  </tr>
  <tr>
    <td align="center">:no_entry_sign:</td>
    <a href="https://github.com/gperdomor/matrix-swift-sdk/issues/50">#50</a>
    <td>GET /download/:server_name/:media_id</td>
  </tr>
  <tr>
    <td align="center">:no_entry_sign:</td>
    <a href="https://github.com/gperdomor/matrix-swift-sdk/issues/51">#51</a>
    <td>POST /upload</td>
  </tr>
  <tr>
    <td align="center">:no_entry_sign:</td>
    <a href="https://github.com/gperdomor/matrix-swift-sdk/issues/52">#52</a>
    <td>GET /thumbnail/:server_name/:media_id</td>
  </tr>
  <tr>
    <th align="left" colspan="3">Push notifications</th>
  </tr>
  <tr>
    <td align="center">:no_entry_sign:</td>
    <a href="https://github.com/gperdomor/matrix-swift-sdk/issues/53">#53</a>
    <td>POST /pushers/set</td>
  </tr>
  <tr>
    <td align="center">:no_entry_sign:</td>
    <a href="https://github.com/gperdomor/matrix-swift-sdk/issues/54">#54</a>
    <td>GET /pushers</td>
  </tr>
  <tr>
    <th align="left" colspan="3">Push notification rules</th>
  </tr>
  <tr>
    <td align="center">:no_entry_sign:</td>
    <a href="https://github.com/gperdomor/matrix-swift-sdk/issues/55">#55</a>
    <td>PUT /pushrules/:scope/:kind/:rule_id/enabled</td>
  </tr>
  <tr>
    <td align="center">:no_entry_sign:</td>
    <a href="https://github.com/gperdomor/matrix-swift-sdk/issues/56">#56</a>
    <td>GET /pushrules/:scope/:kind/:rule_id/enabled</td>
  </tr>
  <tr>
    <td align="center">:no_entry_sign:</td>
    <a href="https://github.com/gperdomor/matrix-swift-sdk/issues/57">#57</a>
    <td>PUT /pushrules/:scope/:kind/:rule_id</td>
  </tr>
  <tr>
    <td align="center">:no_entry_sign:</td>
    <a href="https://github.com/gperdomor/matrix-swift-sdk/issues/58">#58</a>
    <td>DELETE /pushrules/:scope/:kind/:rule_id</td>
  </tr>
  <tr>
    <td align="center">:no_entry_sign:</td>
    <a href="https://github.com/gperdomor/matrix-swift-sdk/issues/59">#59</a>
    <td>GET /pushrules/:scope/:kind/:rule_id</td>
  </tr>
  <tr>
    <td align="center">:no_entry_sign:</td>
    <a href="https://github.com/gperdomor/matrix-swift-sdk/issues/60">#60</a>
    <td>GET /pushrules</td>
  </tr>
  <tr>
    <td align="center">:no_entry_sign:</td>
    <a href="https://github.com/gperdomor/matrix-swift-sdk/issues/61">#61</a>
    <td>PUT /pushrules/:scope/:kind/:rule_id/actions</td>
  </tr>
  <tr>
    <td align="center">:no_entry_sign:</td>
    <a href="https://github.com/gperdomor/matrix-swift-sdk/issues/62">#62</a>
    <td>GET /pushrules/:scope/:kind/:rule_id/actions</td>
  </tr>
  <tr>
    <th align="left" colspan="3">Server side search</th>
  </tr>
  <tr>
    <td align="center">:no_entry_sign:</td>
    <a href="https://github.com/gperdomor/matrix-swift-sdk/issues/63">#63</a>
    <td>POST /search</td>
  </tr>
  <tr>
    <th align="left" colspan="3">Room previews</th>
  </tr>
  <tr>
    <td align="center">:no_entry_sign:</td>
    <a href="https://github.com/gperdomor/matrix-swift-sdk/issues/64">#64</a>
    <td>GET /events</td>
  </tr>
  <tr>
    <th align="left" colspan="3">Room tagging</th>
  </tr>
  <tr>
    <td align="center">:no_entry_sign:</td>
    <a href="https://github.com/gperdomor/matrix-swift-sdk/issues/65">#65</a>
    <td>PUT /user/:user_id/rooms/:room_id/tags/:tag</td>
  </tr>
  <tr>
    <td align="center">:no_entry_sign:</td>
    <a href="https://github.com/gperdomor/matrix-swift-sdk/issues/66">#66</a>
    <td>DELETE /user/:user_id/rooms/:room_id/tags/:tag</td>
  </tr>
  <tr>
    <td align="center">:no_entry_sign:</td>
    <a href="https://github.com/gperdomor/matrix-swift-sdk/issues/67">#67</a>
    <td>GET /user/:user_id/rooms/:room_id/tags</td>
  </tr>
  <tr>
    <th align="left" colspan="3">Client config</th>
  </tr>
  <tr>
    <td align="center">:no_entry_sign:</td>
    <a href="https://github.com/gperdomor/matrix-swift-sdk/issues/68">#68</a>
    <td>PUT /user/:user_id/rooms/:room_id/account_data/:type</td>
  </tr>
  <tr>
    <td align="center">:no_entry_sign:</td>
    <a href="https://github.com/gperdomor/matrix-swift-sdk/issues/69">#69</a>
    <td>PUT /user/:user_id/account_data/:type</td>
  </tr>
  <tr>
    <th align="left" colspan="3">Server administration</th>
  </tr>
  <tr>
    <td align="center">:no_entry_sign:</td>
    <a href="https://github.com/gperdomor/matrix-swift-sdk/issues/70">#70</a>
    <td>GET /admin/whois/:user_id</td>
  </tr>
  <tr>
    <th align="left" colspan="3">Event context</th>
  </tr>
  <tr>
    <td align="center">:no_entry_sign:</td>
    <a href="https://github.com/gperdomor/matrix-swift-sdk/issues/71">#71</a>
    <td>GET /rooms/:room_id/context/:event_id</td>
  </tr>
</table>