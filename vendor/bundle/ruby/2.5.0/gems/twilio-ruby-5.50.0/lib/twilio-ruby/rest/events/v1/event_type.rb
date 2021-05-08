##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
#
# frozen_string_literal: true

module Twilio
  module REST
    class Events < Domain
      class V1 < Version
        ##
        # PLEASE NOTE that this class contains beta products that are subject to change. Use them with caution.
        class EventTypeList < ListResource
          ##
          # Initialize the EventTypeList
          # @param [Version] version Version that contains the resource
          # @return [EventTypeList] EventTypeList
          def initialize(version)
            super(version)

            # Path Solution
            @solution = {}
            @uri = "/Types"
          end

          ##
          # Lists EventTypeInstance records from the API as a list.
          # Unlike stream(), this operation is eager and will load `limit` records into
          # memory before returning.
          # @param [Integer] limit Upper limit for the number of records to return. stream()
          #    guarantees to never return more than limit.  Default is no limit
          # @param [Integer] page_size Number of records to fetch per request, when
          #    not set will use the default value of 50 records.  If no page_size is defined
          #    but a limit is defined, stream() will attempt to read the limit with the most
          #    efficient page size, i.e. min(limit, 1000)
          # @return [Array] Array of up to limit results
          def list(limit: nil, page_size: nil)
            self.stream(limit: limit, page_size: page_size).entries
          end

          ##
          # Streams EventTypeInstance records from the API as an Enumerable.
          # This operation lazily loads records as efficiently as possible until the limit
          # is reached.
          # @param [Integer] limit Upper limit for the number of records to return. stream()
          #    guarantees to never return more than limit. Default is no limit.
          # @param [Integer] page_size Number of records to fetch per request, when
          #    not set will use the default value of 50 records. If no page_size is defined
          #    but a limit is defined, stream() will attempt to read the limit with the most
          #    efficient page size, i.e. min(limit, 1000)
          # @return [Enumerable] Enumerable that will yield up to limit results
          def stream(limit: nil, page_size: nil)
            limits = @version.read_limits(limit, page_size)

            page = self.page(page_size: limits[:page_size], )

            @version.stream(page, limit: limits[:limit], page_limit: limits[:page_limit])
          end

          ##
          # When passed a block, yields EventTypeInstance records from the API.
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
          # Retrieve a single page of EventTypeInstance records from the API.
          # Request is executed immediately.
          # @param [String] page_token PageToken provided by the API
          # @param [Integer] page_number Page Number, this value is simply for client state
          # @param [Integer] page_size Number of records to return, defaults to 50
          # @return [Page] Page of EventTypeInstance
          def page(page_token: :unset, page_number: :unset, page_size: :unset)
            params = Twilio::Values.of({
                'PageToken' => page_token,
                'Page' => page_number,
                'PageSize' => page_size,
            })

            response = @version.page('GET', @uri, params: params)

            EventTypePage.new(@version, response, @solution)
          end

          ##
          # Retrieve a single page of EventTypeInstance records from the API.
          # Request is executed immediately.
          # @param [String] target_url API-generated URL for the requested results page
          # @return [Page] Page of EventTypeInstance
          def get_page(target_url)
            response = @version.domain.request(
                'GET',
                target_url
            )
            EventTypePage.new(@version, response, @solution)
          end

          ##
          # Provide a user friendly representation
          def to_s
            '#<Twilio.Events.V1.EventTypeList>'
          end
        end

        ##
        # PLEASE NOTE that this class contains beta products that are subject to change. Use them with caution.
        class EventTypePage < Page
          ##
          # Initialize the EventTypePage
          # @param [Version] version Version that contains the resource
          # @param [Response] response Response from the API
          # @param [Hash] solution Path solution for the resource
          # @return [EventTypePage] EventTypePage
          def initialize(version, response, solution)
            super(version, response)

            # Path Solution
            @solution = solution
          end

          ##
          # Build an instance of EventTypeInstance
          # @param [Hash] payload Payload response from the API
          # @return [EventTypeInstance] EventTypeInstance
          def get_instance(payload)
            EventTypeInstance.new(@version, payload, )
          end

          ##
          # Provide a user friendly representation
          def to_s
            '<Twilio.Events.V1.EventTypePage>'
          end
        end

        ##
        # PLEASE NOTE that this class contains beta products that are subject to change. Use them with caution.
        class EventTypeContext < InstanceContext
          ##
          # Initialize the EventTypeContext
          # @param [Version] version Version that contains the resource
          # @param [String] type A string that uniquely identifies this Event Type.
          # @return [EventTypeContext] EventTypeContext
          def initialize(version, type)
            super(version)

            # Path Solution
            @solution = {type: type, }
            @uri = "/Types/#{@solution[:type]}"
          end

          ##
          # Fetch the EventTypeInstance
          # @return [EventTypeInstance] Fetched EventTypeInstance
          def fetch
            payload = @version.fetch('GET', @uri)

            EventTypeInstance.new(@version, payload, type: @solution[:type], )
          end

          ##
          # Provide a user friendly representation
          def to_s
            context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
            "#<Twilio.Events.V1.EventTypeContext #{context}>"
          end

          ##
          # Provide a detailed, user friendly representation
          def inspect
            context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
            "#<Twilio.Events.V1.EventTypeContext #{context}>"
          end
        end

        ##
        # PLEASE NOTE that this class contains beta products that are subject to change. Use them with caution.
        class EventTypeInstance < InstanceResource
          ##
          # Initialize the EventTypeInstance
          # @param [Version] version Version that contains the resource
          # @param [Hash] payload payload that contains response from Twilio
          # @param [String] type A string that uniquely identifies this Event Type.
          # @return [EventTypeInstance] EventTypeInstance
          def initialize(version, payload, type: nil)
            super(version)

            # Marshaled Properties
            @properties = {
                'type' => payload['type'],
                'schema_id' => payload['schema_id'],
                'date_created' => Twilio.deserialize_iso8601_datetime(payload['date_created']),
                'date_updated' => Twilio.deserialize_iso8601_datetime(payload['date_updated']),
                'description' => payload['description'],
                'url' => payload['url'],
                'links' => payload['links'],
            }

            # Context
            @instance_context = nil
            @params = {'type' => type || @properties['type'], }
          end

          ##
          # Generate an instance context for the instance, the context is capable of
          # performing various actions.  All instance actions are proxied to the context
          # @return [EventTypeContext] EventTypeContext for this EventTypeInstance
          def context
            unless @instance_context
              @instance_context = EventTypeContext.new(@version, @params['type'], )
            end
            @instance_context
          end

          ##
          # @return [String] The Event Type identifier.
          def type
            @properties['type']
          end

          ##
          # @return [String] The Schema identifier for this Event Type.
          def schema_id
            @properties['schema_id']
          end

          ##
          # @return [Time] The date this Event Type was created.
          def date_created
            @properties['date_created']
          end

          ##
          # @return [Time] The date this Event Type was updated.
          def date_updated
            @properties['date_updated']
          end

          ##
          # @return [String] Event Type description.
          def description
            @properties['description']
          end

          ##
          # @return [String] The URL of this resource.
          def url
            @properties['url']
          end

          ##
          # @return [String] The links
          def links
            @properties['links']
          end

          ##
          # Fetch the EventTypeInstance
          # @return [EventTypeInstance] Fetched EventTypeInstance
          def fetch
            context.fetch
          end

          ##
          # Provide a user friendly representation
          def to_s
            values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
            "<Twilio.Events.V1.EventTypeInstance #{values}>"
          end

          ##
          # Provide a detailed, user friendly representation
          def inspect
            values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
            "<Twilio.Events.V1.EventTypeInstance #{values}>"
          end
        end
      end
    end
  end
end