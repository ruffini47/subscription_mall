##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
#
# frozen_string_literal: true

module Twilio
  module REST
    class Verify < Domain
      class V2 < Version
        class ServiceContext < InstanceContext
          class RateLimitContext < InstanceContext
            class BucketList < ListResource
              ##
              # Initialize the BucketList
              # @param [Version] version Version that contains the resource
              # @param [String] service_sid The SID of the
              #   {Service}[https://www.twilio.com/docs/verify/api/service] the resource is
              #   associated with.
              # @param [String] rate_limit_sid The Twilio-provided string that uniquely
              #   identifies the Rate Limit resource.
              # @return [BucketList] BucketList
              def initialize(version, service_sid: nil, rate_limit_sid: nil)
                super(version)

                # Path Solution
                @solution = {service_sid: service_sid, rate_limit_sid: rate_limit_sid}
                @uri = "/Services/#{@solution[:service_sid]}/RateLimits/#{@solution[:rate_limit_sid]}/Buckets"
              end

              ##
              # Create the BucketInstance
              # @param [String] max Maximum number of requests permitted in during the interval.
              # @param [String] interval Number of seconds that the rate limit will be enforced
              #   over.
              # @return [BucketInstance] Created BucketInstance
              def create(max: nil, interval: nil)
                data = Twilio::Values.of({'Max' => max, 'Interval' => interval, })

                payload = @version.create('POST', @uri, data: data)

                BucketInstance.new(
                    @version,
                    payload,
                    service_sid: @solution[:service_sid],
                    rate_limit_sid: @solution[:rate_limit_sid],
                )
              end

              ##
              # Lists BucketInstance records from the API as a list.
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
              # Streams BucketInstance records from the API as an Enumerable.
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
              # When passed a block, yields BucketInstance records from the API.
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
              # Retrieve a single page of BucketInstance records from the API.
              # Request is executed immediately.
              # @param [String] page_token PageToken provided by the API
              # @param [Integer] page_number Page Number, this value is simply for client state
              # @param [Integer] page_size Number of records to return, defaults to 50
              # @return [Page] Page of BucketInstance
              def page(page_token: :unset, page_number: :unset, page_size: :unset)
                params = Twilio::Values.of({
                    'PageToken' => page_token,
                    'Page' => page_number,
                    'PageSize' => page_size,
                })

                response = @version.page('GET', @uri, params: params)

                BucketPage.new(@version, response, @solution)
              end

              ##
              # Retrieve a single page of BucketInstance records from the API.
              # Request is executed immediately.
              # @param [String] target_url API-generated URL for the requested results page
              # @return [Page] Page of BucketInstance
              def get_page(target_url)
                response = @version.domain.request(
                    'GET',
                    target_url
                )
                BucketPage.new(@version, response, @solution)
              end

              ##
              # Provide a user friendly representation
              def to_s
                '#<Twilio.Verify.V2.BucketList>'
              end
            end

            class BucketPage < Page
              ##
              # Initialize the BucketPage
              # @param [Version] version Version that contains the resource
              # @param [Response] response Response from the API
              # @param [Hash] solution Path solution for the resource
              # @return [BucketPage] BucketPage
              def initialize(version, response, solution)
                super(version, response)

                # Path Solution
                @solution = solution
              end

              ##
              # Build an instance of BucketInstance
              # @param [Hash] payload Payload response from the API
              # @return [BucketInstance] BucketInstance
              def get_instance(payload)
                BucketInstance.new(
                    @version,
                    payload,
                    service_sid: @solution[:service_sid],
                    rate_limit_sid: @solution[:rate_limit_sid],
                )
              end

              ##
              # Provide a user friendly representation
              def to_s
                '<Twilio.Verify.V2.BucketPage>'
              end
            end

            class BucketContext < InstanceContext
              ##
              # Initialize the BucketContext
              # @param [Version] version Version that contains the resource
              # @param [String] service_sid The SID of the
              #   {Service}[https://www.twilio.com/docs/verify/api/service] the resource is
              #   associated with.
              # @param [String] rate_limit_sid The Twilio-provided string that uniquely
              #   identifies the Rate Limit resource.
              # @param [String] sid A 34 character string that uniquely identifies this Bucket.
              # @return [BucketContext] BucketContext
              def initialize(version, service_sid, rate_limit_sid, sid)
                super(version)

                # Path Solution
                @solution = {service_sid: service_sid, rate_limit_sid: rate_limit_sid, sid: sid, }
                @uri = "/Services/#{@solution[:service_sid]}/RateLimits/#{@solution[:rate_limit_sid]}/Buckets/#{@solution[:sid]}"
              end

              ##
              # Update the BucketInstance
              # @param [String] max Maximum number of requests permitted in during the interval.
              # @param [String] interval Number of seconds that the rate limit will be enforced
              #   over.
              # @return [BucketInstance] Updated BucketInstance
              def update(max: :unset, interval: :unset)
                data = Twilio::Values.of({'Max' => max, 'Interval' => interval, })

                payload = @version.update('POST', @uri, data: data)

                BucketInstance.new(
                    @version,
                    payload,
                    service_sid: @solution[:service_sid],
                    rate_limit_sid: @solution[:rate_limit_sid],
                    sid: @solution[:sid],
                )
              end

              ##
              # Fetch the BucketInstance
              # @return [BucketInstance] Fetched BucketInstance
              def fetch
                payload = @version.fetch('GET', @uri)

                BucketInstance.new(
                    @version,
                    payload,
                    service_sid: @solution[:service_sid],
                    rate_limit_sid: @solution[:rate_limit_sid],
                    sid: @solution[:sid],
                )
              end

              ##
              # Delete the BucketInstance
              # @return [Boolean] true if delete succeeds, false otherwise
              def delete
                 @version.delete('DELETE', @uri)
              end

              ##
              # Provide a user friendly representation
              def to_s
                context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
                "#<Twilio.Verify.V2.BucketContext #{context}>"
              end

              ##
              # Provide a detailed, user friendly representation
              def inspect
                context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
                "#<Twilio.Verify.V2.BucketContext #{context}>"
              end
            end

            class BucketInstance < InstanceResource
              ##
              # Initialize the BucketInstance
              # @param [Version] version Version that contains the resource
              # @param [Hash] payload payload that contains response from Twilio
              # @param [String] service_sid The SID of the
              #   {Service}[https://www.twilio.com/docs/verify/api/service] the resource is
              #   associated with.
              # @param [String] rate_limit_sid The Twilio-provided string that uniquely
              #   identifies the Rate Limit resource.
              # @param [String] sid A 34 character string that uniquely identifies this Bucket.
              # @return [BucketInstance] BucketInstance
              def initialize(version, payload, service_sid: nil, rate_limit_sid: nil, sid: nil)
                super(version)

                # Marshaled Properties
                @properties = {
                    'sid' => payload['sid'],
                    'rate_limit_sid' => payload['rate_limit_sid'],
                    'service_sid' => payload['service_sid'],
                    'account_sid' => payload['account_sid'],
                    'max' => payload['max'].to_i,
                    'interval' => payload['interval'].to_i,
                    'date_created' => Twilio.deserialize_iso8601_datetime(payload['date_created']),
                    'date_updated' => Twilio.deserialize_iso8601_datetime(payload['date_updated']),
                    'url' => payload['url'],
                }

                # Context
                @instance_context = nil
                @params = {
                    'service_sid' => service_sid,
                    'rate_limit_sid' => rate_limit_sid,
                    'sid' => sid || @properties['sid'],
                }
              end

              ##
              # Generate an instance context for the instance, the context is capable of
              # performing various actions.  All instance actions are proxied to the context
              # @return [BucketContext] BucketContext for this BucketInstance
              def context
                unless @instance_context
                  @instance_context = BucketContext.new(
                      @version,
                      @params['service_sid'],
                      @params['rate_limit_sid'],
                      @params['sid'],
                  )
                end
                @instance_context
              end

              ##
              # @return [String] A string that uniquely identifies this Bucket.
              def sid
                @properties['sid']
              end

              ##
              # @return [String] Rate Limit Sid.
              def rate_limit_sid
                @properties['rate_limit_sid']
              end

              ##
              # @return [String] The SID of the Service that the resource is associated with
              def service_sid
                @properties['service_sid']
              end

              ##
              # @return [String] The SID of the Account that created the resource
              def account_sid
                @properties['account_sid']
              end

              ##
              # @return [String] Max number of requests.
              def max
                @properties['max']
              end

              ##
              # @return [String] Number of seconds that the rate limit will be enforced over.
              def interval
                @properties['interval']
              end

              ##
              # @return [Time] The RFC 2822 date and time in GMT when the resource was created
              def date_created
                @properties['date_created']
              end

              ##
              # @return [Time] The RFC 2822 date and time in GMT when the resource was last updated
              def date_updated
                @properties['date_updated']
              end

              ##
              # @return [String] The URL of this resource.
              def url
                @properties['url']
              end

              ##
              # Update the BucketInstance
              # @param [String] max Maximum number of requests permitted in during the interval.
              # @param [String] interval Number of seconds that the rate limit will be enforced
              #   over.
              # @return [BucketInstance] Updated BucketInstance
              def update(max: :unset, interval: :unset)
                context.update(max: max, interval: interval, )
              end

              ##
              # Fetch the BucketInstance
              # @return [BucketInstance] Fetched BucketInstance
              def fetch
                context.fetch
              end

              ##
              # Delete the BucketInstance
              # @return [Boolean] true if delete succeeds, false otherwise
              def delete
                context.delete
              end

              ##
              # Provide a user friendly representation
              def to_s
                values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
                "<Twilio.Verify.V2.BucketInstance #{values}>"
              end

              ##
              # Provide a detailed, user friendly representation
              def inspect
                values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
                "<Twilio.Verify.V2.BucketInstance #{values}>"
              end
            end
          end
        end
      end
    end
  end
end