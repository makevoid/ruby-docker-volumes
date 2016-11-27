require_relative 'env'



STATUS = Status.new


class App < Roda

  plugin :json

  route do |r|
    request_id = rand(10**10)
    up = true
    down, ethereum_down = true, true if STATUS.parity_down?          # when you program
    down, privacy_down  = true, true if STATUS.privacy_server_down?

    # down = true
    down = !up

    r.root {
      File.open("#{PATH}/db/test_#{request_id}.txt", 'w') do |f|
        f.write "foo"
      end

      {
        success: true,
        message: "123",
        h_check: {
          factor:   request_id,
          status:   !down,
          ethereum: !ethereum_down,
          privacy:  !privacy_down,
        },

      }
    }
  end

end
