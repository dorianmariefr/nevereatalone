server "18.188.247.228", user: "ec2-user", roles: %w{app db web}
set :deploy_to, -> { "/home/#{fetch(:user)}/applications/#{fetch(:application)}-staging" }
