defmodule BlogPhoenix.Kaffy.Resources do
  def build_resources(_conn) do
    [
      upload: [
        name: "Upload",
        resources: [
          upload: [schema: BlogPhoenix.Documents.Upload, admin: BlogPhoenix.UploadAdmin]
        ]
      ]
    ]
  end
end
