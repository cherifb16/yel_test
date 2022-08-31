json.extract! reservation, :id, :checkin_date, :checkout_date, :created_at, :updated_at
json.url reservation_url(reservation, format: :json)
