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
        class SchemaContext < InstanceContext
          ##
          # PLEASE NOTE that this class contains beta products that are subject to change. Use them with caution.
          class VersionList < ListResource
            ##
            # Initialize the VersionList
            # @param [Version] version Version that contains the resource
            # @param [String] id The unique identifier of the schema. Each schema can have
            #   multiple versions, that share the same id.
            # @return [VersionList] VersionList
            def initialize(version, id: nil)
              super(version)

              # Path Solution
              @solution = {id: id}
              @uri = "/Schemas/#{@solution[:id]}/Versions"
            end

            ##
            # Lists VersionInstance records from the API as a list.
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
            # Streams VersionInstance records from the API as an Enumerable.
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
            # When passed a block, yields VersionInstance records from the API.
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
            # Retrieve a single page of VersionInstance records from the API.
            # Request is executed immediately.
            # @param [String] page_token PageToken provided by the API
            # @param [Integer] page_number Page Number, this value is simply for client state
            # @param [Integer] page_size Number of records to return, defaults to 50
            # @return [Page] Page of VersionInstance
            def page(page_token: :unset, page_number: :unset, page_size: :unset)
              params = Twilio::Values.of({
                  'PageToken' => page_token,
                  'Page' => page_number,
                  'PageSize' => page_size,
              })

              response = @version.page('GET', @uri, params: params)

              VersionPage.new(@version, response, @solution)
            end

            ##
            # Retrieve a single page of VersionInstance records from the API.
            # Request is executed immediately.
            # @param [String] target_url API-generated URL for the requested results page
            # @return [Page] Page of VersionInstance
            def get_page(target_url)
              response = @version.domain.request(
                  'GET',
                  target_url
              )
              VersionPage.new(@version, response, @solution)
            end

            ##
            # Provide a user friendly representation
            def to_s
              '#<Twilio.Events.V1.VersionList>'
            end
          end

          ##
          # PLEASE NOTE that this class contains beta products that are subject to change. Use them with caution.
          class VersionPage < Page
            ##
            # Initialize the VersionPage
            # @param [Version] version Version that contains the resource
            # @param [Response] response Response from the API
            # @param [Hash] solution Path solution for the resource
            # @return [VersionPage] VersionPage
            def initialize(version, response, solution)
              super(version, response)

              # Path Solution
              @solution = solution
            end

            ##
            # Build an instance of VersionInstance
            # @param [Hash] payload Payload response from the API
            # @return [VersionInstance] VersionInstance
            def get_instance(payload)
              VersionInstance.new(@version, payload, id: @solution[:id], )
            end

            ##
            # Provide a user friendly representation
            def to_s
              '<Twilio.Events.V1.VersionPage>'
            end
          end

          ##
          # PLEASE NOTE that this class contains beta products that are subject to change. Use them with caution.
          class VersionContext < InstanceContext
            ##
            # Initialize the VersionContext
            # @param [Version] version Version that contains the resource
            # @param [String] id The unique identifier of the schema. Each schema can have
            #   multiple versions, that share the same id.
            # @param [String] schema_version The version of the schema
            # @return [VersionContext] VersionContext
            def initialize(version, id, schema_version)
              super(version)

              # Path Solution
              @solution = {id: id, schema_version: schema_version, }
              @uri = "/Schemas/#{@solution[:id]}/Versions/#{@solution[:schema_version]}"
            end

            ##
            # Fetch the VersionInstance
            # @return [VersionInstance] Fetched VersionInstance
            def fetch
              payload = @version.fetch('GET', @uri)

              VersionInstance.new(
                  @version,
                  payload,
                  id: @solution[:id],
                  schema_version: @solution[:schema_version],
              )
            end

            ##
            # Provide a user friendly representation
            def to_s
              context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
              "#<Twilio.Events.V1.VersionContext #{context}>"
            end

            ##
            # Provide a detailed, user friendly representation
            def inspect
              context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
              "#<Twilio.Events.V1.VersionContext #{context}>"
            end
          end

          ##
          # PLEASE NOTE that this class contains beta products that are subject to change. Use them with caution.
          class VersionInstance < InstanceResource
            ##
            # Initialize the VersionInstance
            # @param [Version] version Version that contains the resource
            # @param [Hash] payload payload that contains response from Twilio
            # @param [String] id The unique identifier of the schema. Each schema can have
            #   multiple versions, that share the same id.
            # @param [String] schema_version The version of the schema
            # @return [VersionInstance] VersionInstance
            def initialize(version, payload, id: nil, schema_version: nil)
              super(version)

              # Marshaled Properties
              @properties = {
                  'id' => payload['id'],
                  'schema_version' => payload['schema_version'].to_i,
                  'date_created' => Twilio.deserialize_iso8601_datetime(payload['date_created']),
                  'url' => payload['url'],
                  'raw' => payload['raw'],
              }

              # Context
              @instance_context = nil
              @params = {'id' => id, 'schema_version' => schema_version || @properties['schema_version'], }
            end

            ##
            # Generate an instance context for the instance, the context is capable of
            # performing various actions.  All instance actions are proxied to the context
            # @return [VersionContext] VersionContext for this VersionInstance
            def context
              unless @instance_context
                @instance_context = VersionContext.new(@version, @params['id'], @params['schema_version'], )
              end
              @instance_context
            end

            ##
            # @return [String] The unique identifier of the schema.
            def id
              @properties['id']
            end

            ##
            # @return [String] The version of this schema.
            def schema_version
              @properties['schema_version']
            end

            ##
            # @return [Time] The date the schema version was created.
            def date_created
              @properties['date_created']
            end

            ##
            # @return [String] The URL of this resource.
            def url
              @properties['url']
            end

            ##
            # @return [String] The raw
            def raw
              @properties['raw']
            end

            ##
            # Fetch the VersionInstance
            # @return [VersionInstance] Fetched VersionInstance
            def fetch
              context.fetch
            end

            ##
            # Provide a user friendly representation
            def to_s
              values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
              "<Twilio.Events.V1.VersionInstance #{values}>"
            end

            ##
            # Provide a detailed, user friendly representation
            def inspect
              values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
              "<Twilio.Events.V1.VersionInstance #{values}>"
            end
          end
        end
      end
    end
  end
end