##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
#
# frozen_string_literal: true

module Twilio
  module REST
    class Video < Domain
      class V1 < Version
        class RoomList < ListResource
          ##
          # Initialize the RoomList
          # @param [Version] version Version that contains the resource
          # @return [RoomList] RoomList
          def initialize(version)
            super(version)

            # Path Solution
            @solution = {}
            @uri = "/Rooms"
          end

          ##
          # Create the RoomInstance
          # @param [Boolean] enable_turn Deprecated, now always considered to be true.
          # @param [room.RoomType] type The type of room. Can be: `go`, `peer-to-peer`,
          #   `group-small`, or `group`. The default value is `group`.
          # @param [String] unique_name An application-defined string that uniquely
          #   identifies the resource. It can be used as a `room_sid` in place of the
          #   resource's `sid` in the URL to address the resource. This value is unique for
          #   `in-progress` rooms. SDK clients can use this name to connect to the room. REST
          #   API clients can use this name in place of the Room SID to interact with the room
          #   as long as the room is `in-progress`.
          # @param [String] status_callback The URL we should call using the
          #   `status_callback_method` to send status information to your application on every
          #   room event. See {Status
          #   Callbacks}[https://www.twilio.com/docs/video/api/status-callbacks] for more
          #   info.
          # @param [String] status_callback_method The HTTP method we should use to call
          #   `status_callback`. Can be `POST` or `GET`.
          # @param [String] max_participants The maximum number of concurrent Participants
          #   allowed in the room. Peer-to-peer rooms can have up to 10 Participants. Small
          #   Group rooms can have up to 4 Participants. Group rooms can have up to 50
          #   Participants.
          # @param [Boolean] record_participants_on_connect Whether to start recording when
          #   Participants connect. ***This feature is not available in `peer-to-peer`
          #   rooms.***
          # @param [Array[room.VideoCodec]] video_codecs An array of the video codecs that
          #   are supported when publishing a track in the room.  Can be: `VP8` and `H264`.
          #   ***This feature is not available in `peer-to-peer` rooms***
          # @param [String] media_region The region for the media server in Group Rooms.
          #   Can be: one of the {available Media
          #   Regions}[https://www.twilio.com/docs/video/ip-address-whitelisting#group-rooms-media-servers].
          #   ***This feature is not available in `peer-to-peer` rooms.***
          # @param [Hash] recording_rules A collection of Recording Rules that describe how
          #   to include or exclude matching tracks for recording
          # @return [RoomInstance] Created RoomInstance
          def create(enable_turn: :unset, type: :unset, unique_name: :unset, status_callback: :unset, status_callback_method: :unset, max_participants: :unset, record_participants_on_connect: :unset, video_codecs: :unset, media_region: :unset, recording_rules: :unset)
            data = Twilio::Values.of({
                'EnableTurn' => enable_turn,
                'Type' => type,
                'UniqueName' => unique_name,
                'StatusCallback' => status_callback,
                'StatusCallbackMethod' => status_callback_method,
                'MaxParticipants' => max_participants,
                'RecordParticipantsOnConnect' => record_participants_on_connect,
                'VideoCodecs' => Twilio.serialize_list(video_codecs) { |e| e },
                'MediaRegion' => media_region,
                'RecordingRules' => Twilio.serialize_object(recording_rules),
            })

            payload = @version.create('POST', @uri, data: data)

            RoomInstance.new(@version, payload, )
          end

          ##
          # Lists RoomInstance records from the API as a list.
          # Unlike stream(), this operation is eager and will load `limit` records into
          # memory before returning.
          # @param [room.RoomStatus] status Read only the rooms with this status. Can be:
          #   `in-progress` (default) or `completed`
          # @param [String] unique_name Read only rooms with the this `unique_name`.
          # @param [Time] date_created_after Read only rooms that started on or after this
          #   date, given as `YYYY-MM-DD`.
          # @param [Time] date_created_before Read only rooms that started before this date,
          #   given as `YYYY-MM-DD`.
          # @param [Integer] limit Upper limit for the number of records to return. stream()
          #    guarantees to never return more than limit.  Default is no limit
          # @param [Integer] page_size Number of records to fetch per request, when
          #    not set will use the default value of 50 records.  If no page_size is defined
          #    but a limit is defined, stream() will attempt to read the limit with the most
          #    efficient page size, i.e. min(limit, 1000)
          # @return [Array] Array of up to limit results
          def list(status: :unset, unique_name: :unset, date_created_after: :unset, date_created_before: :unset, limit: nil, page_size: nil)
            self.stream(
                status: status,
                unique_name: unique_name,
                date_created_after: date_created_after,
                date_created_before: date_created_before,
                limit: limit,
                page_size: page_size
            ).entries
          end

          ##
          # Streams RoomInstance records from the API as an Enumerable.
          # This operation lazily loads records as efficiently as possible until the limit
          # is reached.
          # @param [room.RoomStatus] status Read only the rooms with this status. Can be:
          #   `in-progress` (default) or `completed`
          # @param [String] unique_name Read only rooms with the this `unique_name`.
          # @param [Time] date_created_after Read only rooms that started on or after this
          #   date, given as `YYYY-MM-DD`.
          # @param [Time] date_created_before Read only rooms that started before this date,
          #   given as `YYYY-MM-DD`.
          # @param [Integer] limit Upper limit for the number of records to return. stream()
          #    guarantees to never return more than limit. Default is no limit.
          # @param [Integer] page_size Number of records to fetch per request, when
          #    not set will use the default value of 50 records. If no page_size is defined
          #    but a limit is defined, stream() will attempt to read the limit with the most
          #    efficient page size, i.e. min(limit, 1000)
          # @return [Enumerable] Enumerable that will yield up to limit results
          def stream(status: :unset, unique_name: :unset, date_created_after: :unset, date_created_before: :unset, limit: nil, page_size: nil)
            limits = @version.read_limits(limit, page_size)

            page = self.page(
                status: status,
                unique_name: unique_name,
                date_created_after: date_created_after,
                date_created_before: date_created_before,
                page_size: limits[:page_size],
            )

            @version.stream(page, limit: limits[:limit], page_limit: limits[:page_limit])
          end

          ##
          # When passed a block, yields RoomInstance records from the API.
          # This operation lazily loads records as efficiently as possible until the limit
          # is reached.
          def each
            limits = @version.read_limits

            page = self.page(page_size: limits[:page_size], )

            @version.stream(page,
                            limit: limits[:limit],
                            page_limit: limits[:page_limit]).each {|x| yield x}
          end

          ##
          # Retrieve a single page of RoomInstance records from the API.
          # Request is executed immediately.
          # @param [room.RoomStatus] status Read only the rooms with this status. Can be:
          #   `in-progress` (default) or `completed`
          # @param [String] unique_name Read only rooms with the this `unique_name`.
          # @param [Time] date_created_after Read only rooms that started on or after this
          #   date, given as `YYYY-MM-DD`.
          # @param [Time] date_created_before Read only rooms that started before this date,
          #   given as `YYYY-MM-DD`.
          # @param [String] page_token PageToken provided by the API
          # @param [Integer] page_number Page Number, this value is simply for client state
          # @param [Integer] page_size Number of records to return, defaults to 50
          # @return [Page] Page of RoomInstance
          def page(status: :unset, unique_name: :unset, date_created_after: :unset, date_created_before: :unset, page_token: :unset, page_number: :unset, page_size: :unset)
            params = Twilio::Values.of({
                'Status' => status,
                'UniqueName' => unique_name,
                'DateCreatedAfter' => Twilio.serialize_iso8601_datetime(date_created_after),
                'DateCreatedBefore' => Twilio.serialize_iso8601_datetime(date_created_before),
                'PageToken' => page_token,
                'Page' => page_number,
                'PageSize' => page_size,
            })

            response = @version.page('GET', @uri, params: params)

            RoomPage.new(@version, response, @solution)
          end

          ##
          # Retrieve a single page of RoomInstance records from the API.
          # Request is executed immediately.
          # @param [String] target_url API-generated URL for the requested results page
          # @return [Page] Page of RoomInstance
          def get_page(target_url)
            response = @version.domain.request(
                'GET',
                target_url
            )
            RoomPage.new(@version, response, @solution)
          end

          ##
          # Provide a user friendly representation
          def to_s
            '#<Twilio.Video.V1.RoomList>'
          end
        end

        class RoomPage < Page
          ##
          # Initialize the RoomPage
          # @param [Version] version Version that contains the resource
          # @param [Response] response Response from the API
          # @param [Hash] solution Path solution for the resource
          # @return [RoomPage] RoomPage
          def initialize(version, response, solution)
            super(version, response)

            # Path Solution
            @solution = solution
          end

          ##
          # Build an instance of RoomInstance
          # @param [Hash] payload Payload response from the API
          # @return [RoomInstance] RoomInstance
          def get_instance(payload)
            RoomInstance.new(@version, payload, )
          end

          ##
          # Provide a user friendly representation
          def to_s
            '<Twilio.Video.V1.RoomPage>'
          end
        end

        class RoomContext < InstanceContext
          ##
          # Initialize the RoomContext
          # @param [Version] version Version that contains the resource
          # @param [String] sid The SID of the Room resource to fetch.
          # @return [RoomContext] RoomContext
          def initialize(version, sid)
            super(version)

            # Path Solution
            @solution = {sid: sid, }
            @uri = "/Rooms/#{@solution[:sid]}"

            # Dependents
            @recordings = nil
            @participants = nil
            @recording_rules = nil
          end

          ##
          # Fetch the RoomInstance
          # @return [RoomInstance] Fetched RoomInstance
          def fetch
            payload = @version.fetch('GET', @uri)

            RoomInstance.new(@version, payload, sid: @solution[:sid], )
          end

          ##
          # Update the RoomInstance
          # @param [room.RoomStatus] status The new status of the resource. Set to
          #   `completed` to end the room.
          # @return [RoomInstance] Updated RoomInstance
          def update(status: nil)
            data = Twilio::Values.of({'Status' => status, })

            payload = @version.update('POST', @uri, data: data)

            RoomInstance.new(@version, payload, sid: @solution[:sid], )
          end

          ##
          # Access the recordings
          # @return [RoomRecordingList]
          # @return [RoomRecordingContext] if sid was passed.
          def recordings(sid=:unset)
            raise ArgumentError, 'sid cannot be nil' if sid.nil?

            if sid != :unset
              return RoomRecordingContext.new(@version, @solution[:sid], sid, )
            end

            unless @recordings
              @recordings = RoomRecordingList.new(@version, room_sid: @solution[:sid], )
            end

            @recordings
          end

          ##
          # Access the participants
          # @return [ParticipantList]
          # @return [ParticipantContext] if sid was passed.
          def participants(sid=:unset)
            raise ArgumentError, 'sid cannot be nil' if sid.nil?

            if sid != :unset
              return ParticipantContext.new(@version, @solution[:sid], sid, )
            end

            unless @participants
              @participants = ParticipantList.new(@version, room_sid: @solution[:sid], )
            end

            @participants
          end

          ##
          # Access the recording_rules
          # @return [RecordingRulesList]
          # @return [RecordingRulesContext]
          def recording_rules
            unless @recording_rules
              @recording_rules = RecordingRulesList.new(@version, room_sid: @solution[:sid], )
            end

            @recording_rules
          end

          ##
          # Provide a user friendly representation
          def to_s
            context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
            "#<Twilio.Video.V1.RoomContext #{context}>"
          end

          ##
          # Provide a detailed, user friendly representation
          def inspect
            context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
            "#<Twilio.Video.V1.RoomContext #{context}>"
          end
        end

        class RoomInstance < InstanceResource
          ##
          # Initialize the RoomInstance
          # @param [Version] version Version that contains the resource
          # @param [Hash] payload payload that contains response from Twilio
          # @param [String] sid The SID of the Room resource to fetch.
          # @return [RoomInstance] RoomInstance
          def initialize(version, payload, sid: nil)
            super(version)

            # Marshaled Properties
            @properties = {
                'sid' => payload['sid'],
                'status' => payload['status'],
                'date_created' => Twilio.deserialize_iso8601_datetime(payload['date_created']),
                'date_updated' => Twilio.deserialize_iso8601_datetime(payload['date_updated']),
                'account_sid' => payload['account_sid'],
                'enable_turn' => payload['enable_turn'],
                'unique_name' => payload['unique_name'],
                'status_callback' => payload['status_callback'],
                'status_callback_method' => payload['status_callback_method'],
                'end_time' => Twilio.deserialize_iso8601_datetime(payload['end_time']),
                'duration' => payload['duration'] == nil ? payload['duration'] : payload['duration'].to_i,
                'type' => payload['type'],
                'max_participants' => payload['max_participants'].to_i,
                'max_concurrent_published_tracks' => payload['max_concurrent_published_tracks'] == nil ? payload['max_concurrent_published_tracks'] : payload['max_concurrent_published_tracks'].to_i,
                'record_participants_on_connect' => payload['record_participants_on_connect'],
                'video_codecs' => payload['video_codecs'],
                'media_region' => payload['media_region'],
                'url' => payload['url'],
                'links' => payload['links'],
            }

            # Context
            @instance_context = nil
            @params = {'sid' => sid || @properties['sid'], }
          end

          ##
          # Generate an instance context for the instance, the context is capable of
          # performing various actions.  All instance actions are proxied to the context
          # @return [RoomContext] RoomContext for this RoomInstance
          def context
            unless @instance_context
              @instance_context = RoomContext.new(@version, @params['sid'], )
            end
            @instance_context
          end

          ##
          # @return [String] The unique string that identifies the resource
          def sid
            @properties['sid']
          end

          ##
          # @return [room.RoomStatus] The status of the room
          def status
            @properties['status']
          end

          ##
          # @return [Time] The ISO 8601 date and time in GMT when the resource was created
          def date_created
            @properties['date_created']
          end

          ##
          # @return [Time] The ISO 8601 date and time in GMT when the resource was last updated
          def date_updated
            @properties['date_updated']
          end

          ##
          # @return [String] The SID of the Account that created the resource
          def account_sid
            @properties['account_sid']
          end

          ##
          # @return [Boolean] Enable Twilio's Network Traversal TURN service
          def enable_turn
            @properties['enable_turn']
          end

          ##
          # @return [String] An application-defined string that uniquely identifies the resource
          def unique_name
            @properties['unique_name']
          end

          ##
          # @return [String] The URL to send status information to your application
          def status_callback
            @properties['status_callback']
          end

          ##
          # @return [String] The HTTP method we use to call status_callback
          def status_callback_method
            @properties['status_callback_method']
          end

          ##
          # @return [Time] The UTC end time of the room in UTC ISO 8601 format
          def end_time
            @properties['end_time']
          end

          ##
          # @return [String] The duration of the room in seconds
          def duration
            @properties['duration']
          end

          ##
          # @return [room.RoomType] The type of room
          def type
            @properties['type']
          end

          ##
          # @return [String] The maximum number of concurrent Participants allowed in the room
          def max_participants
            @properties['max_participants']
          end

          ##
          # @return [String] The maximum number of published tracks allowed in the room at the same time
          def max_concurrent_published_tracks
            @properties['max_concurrent_published_tracks']
          end

          ##
          # @return [Boolean] Whether to start recording when Participants connect
          def record_participants_on_connect
            @properties['record_participants_on_connect']
          end

          ##
          # @return [Array[room.VideoCodec]] An array of the video codecs that are supported when publishing a track in the room
          def video_codecs
            @properties['video_codecs']
          end

          ##
          # @return [String] The region for the media server in Group Rooms
          def media_region
            @properties['media_region']
          end

          ##
          # @return [String] The absolute URL of the resource
          def url
            @properties['url']
          end

          ##
          # @return [String] The URLs of related resources
          def links
            @properties['links']
          end

          ##
          # Fetch the RoomInstance
          # @return [RoomInstance] Fetched RoomInstance
          def fetch
            context.fetch
          end

          ##
          # Update the RoomInstance
          # @param [room.RoomStatus] status The new status of the resource. Set to
          #   `completed` to end the room.
          # @return [RoomInstance] Updated RoomInstance
          def update(status: nil)
            context.update(status: status, )
          end

          ##
          # Access the recordings
          # @return [recordings] recordings
          def recordings
            context.recordings
          end

          ##
          # Access the participants
          # @return [participants] participants
          def participants
            context.participants
          end

          ##
          # Access the recording_rules
          # @return [recording_rules] recording_rules
          def recording_rules
            context.recording_rules
          end

          ##
          # Provide a user friendly representation
          def to_s
            values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
            "<Twilio.Video.V1.RoomInstance #{values}>"
          end

          ##
          # Provide a detailed, user friendly representation
          def inspect
            values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
            "<Twilio.Video.V1.RoomInstance #{values}>"
          end
        end
      end
    end
  end
end