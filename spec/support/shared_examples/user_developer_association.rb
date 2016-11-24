# frozen_string_literal: true
RSpec.shared_examples "it cannot be assigned to developer or division" do
  it "cannot be assigned to a developer" do
    user = build(role, developer: create(:developer))

    user.validate

    expect(user.errors.full_messages)
      .to include("Role other than Client User must not have a Developer or Division."\
                  " Please leave those fields blank.")
  end

  it "cannot be assigned to a division" do
    user = build(role, division: create(:division))

    user.validate

    expect(user.errors.full_messages)
      .to include("Role other than Client User must not have a Developer or Division."\
                  " Please leave those fields blank.")
  end
end
