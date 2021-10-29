# frozen_string_literal: true

module RuberDialog
  module Parser
    # groups tokens like Character together
    module Tokens
      # Character Token class for parsing
      class Character
        attr_reader :name

        def initialize(name)
          throw ArgumentError unless name.is_a?(String)
          @name = name
        end

        def to_s
          @name
        end

        def ==(other)
          @name == other.name
        end
      end

      class Line
        attr_accessor :char_name, :phrase

        def as_json(options = {})
          {
            char_name: char_name,
            phrase: phrase
          }
        end

        def to_json(*options)
          as_json(*options).to_json(*options)
        end
      end

      class Response
        attr_accessor :response, :next_node

        def as_json(options = {})
          {
            response: response,
            next_node: next_node
          }
        end
      end
    end
  end
end
