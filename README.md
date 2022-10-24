# API Wrapper
This project was built to practice creating customized wrappers for third-party APIs using different tools.

### [Calendarific API](https://calendarific.com/api-documentation)
Calendarific provides data by passing an `api_key` token in the request parameters. In this project, request-response cycles were handled using `Net::HTTP`.

#### Endpoints created: 

`/calendars/holidays`
```
@holidays = Calendarific::Client.holidays(options)
```

- returns the list of holidays in a certain country
- accepts the following options: `country`, `year`, `type`
- `country` will default to the country code provided by [Country API](http://country.is/) if not provided
- `year` will default to the current year of the date accessed if not provided
- `type` is optional and will accept inputs among `national`, `local`, `religious`, `observance`

### [Exchange Rates Data API](https://apilayer.com/marketplace/exchangerates_data-api#documentation-tab)
Exchange Rates Data from APILayer provides data by passing an `apikey` token in the request headers. In this project, request-response cycles were handled using `Faraday`.

#### Usage:
```
@exchange_rates = ExchangeRates::Client.new
```

#### Endpoints created:

`exchange-rates/symbols`
 ```
 @exchange_rates.symbols
 ```
- returns the list of three-letter currency codes of different countries

`exchange-rates/latest`
```
 @exchange_rates.latest(options)
 ```
- returns the real-time exchange rate data
- accepts the following options: `base`, `symbols`
- both `base` and `symbols` are optional

`exchange-rates/convert`
```
 @exchange_rates.convert(options)
 ```
- returns the amount when converted from one currency to another
- accepts the following options: `date`, `amount`, `from`, `to`
- requires `amount` for the basis of currency conversion
- requires `from` and `to` and must be a three-letter currency code

### Tool Documentation
- [Net::HTTP](https://ruby-doc.org/stdlib-3.1.2/libdoc/net/http/rdoc/Net/HTTP.html)
- [Faraday](https://lostisland.github.io/faraday/)
