defmodule BlogPhoenix.Struct do
  # Use TypedStruct to import the typedstruct macro.
  use TypedStruct

  # Define your struct.
  typedstruct do
    # Define each field with the field macro.
    field :a_string, String.t()

    # You can set a default value.
    field :string_with_default, String.t(), default: "default"

    # You can enforce a field.
    field :enforced_field, integer(), enforce: true
  end
end
