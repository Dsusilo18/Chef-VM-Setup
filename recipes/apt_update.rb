execute 'update && upgrade apt' do
    command 'sudo apt update && sudo apt upgrade -y'
end