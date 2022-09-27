require "application_helper"

RSpec.describe ErrorHandler do
  subject { described_class }

  describe "from_messages" do
    context "with single error message" do
      let(:message) { "Error message" }

      it "should return errors representation" do
        expect(subject.from_message(message)).to eq( errors: [{ detail: message }])
      end
    end

    context "with multiple error messages" do
      let(:messages) { ["Error message 1", "Error message 2"] }

      let(:expected_error) do
        {
          errors: [{ detail: messages[0] },
                   { detail: messages[1] }]
        }
      end

      it "should return errors representation" do
        expect(subject.from_messages(messages)).to eq(expected_error)
      end
    end

    context "with any meta" do
      let(:message) { "Error message" }
      let(:meta) { { level: "error" } }

      let(:expected_error) do
        {
          errors: [{ detail: message,
                     meta: meta }]
        }
      end

      it "should return errors representation" do
        expect(subject.from_message(message, meta: meta)).to eq(expected_error)
      end
    end
  end

  describe "in case of model" do
    let(:errors) do
      {
        errors: { blue: ["не может быть пустым"],
                  green: ["не может быть пустым", "имеет непредусмотренное значение"] }
      }
    end

    let(:model) do
      double("model", errors)
    end

    let(:expected_errors) do
      {
        errors: [{ detail: %(не может быть пустым),
                   source: { pointer: "/data/attributes/blue" } },
                 { detail: %(не может быть пустым),
                   source: { pointer: "/data/attributes/green" } },
                 { detail: %(имеет непредусмотренное значение),
                   source: { pointer: "/data/attributes/green" } }]
      }
    end

    it "returns errors representation" do
      expect(subject.from_model(model)).to eq(expected_errors)
    end
  end
end