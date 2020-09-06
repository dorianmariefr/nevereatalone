ActiveAdmin.register ::Comment, as: "MyComment" do
  controller do
    def permitted_params
      params.permit!
    end
  end
end
