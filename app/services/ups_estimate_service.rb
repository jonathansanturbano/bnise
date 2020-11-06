class UpsEstimateService
  def initialize(params)
    @address = params[:address]
    @postal_code = params[:postal_code]
    @country_code = params[:country_code]
    @total_weight = params[:total_weight]
  end

  def call
    message = {
                 RateRequest: {
                    Request: {
                       SubVersion: '1703'
                    },
                    Shipment: {
                       Shipper: {
                          Address: {
                             AddressLine: '36 rue Doudeauville',
                             PostalCode: '75018',
                             CountryCode: 'FR'
                          }
                       },
                       ShipTo: {
                          Address: {
                            AddressLine: @address,
                            PostalCode: @postal_code,
                            CountryCode: @country_code.upcase
                          }
                       },
                       Service: {
                          Code: '11'
                       },
                       ShipmentTotalWeight: {
                          UnitOfMeasurement: {
                             Code: 'KGS',
                             Description: 'Kilograms'
                          }
                       },
                       Package: {
                          PackagingType: {
                             Code: '02',
                             Description: 'Package'
                          },
                          PackageWeight: {
                             UnitOfMeasurement: {
                                Code: 'KGS'
                             },
                             Weight: @total_weight.to_s
                          }
                       }
                    }
                 }
               }

    response = HTTParty.post("https://onlinetools.ups.com/ship/v1/rating/Rate",
                body: message.to_json,
                headers: { 'Content-Type' => 'application/json',
                           'AccessLicenseNumber' => ENV['UPS_ACCESS_NUMBER'],
                           'Password' => ENV['UPS_PASSWORD'],
                           'Username' => ENV['UPS_USERNAME'] })

    answer = JSON.parse(response.body)
    (answer["RateResponse"]["RatedShipment"]["TotalCharges"]["MonetaryValue"].to_f * 100).to_i
  end
end
