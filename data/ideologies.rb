require './ideology'

module Ideologies

    module_function
    def get(sym)
        begin
            return const_get(sym.upcase)
        rescue
            warn "Ideology not found! Returning centrism..."
            return CENTRISM
        end
    end

    CENTRISM = Ideology.new(
        name: "Centrism",
        adjective: "Centrist",
        category: :moderate,
        ethos: [1.0, 1.0, 1.0],
        preferred_govt: :anocracy,
        bonuses: {}
    )
    SYNDICALISM = Ideology.new(
        name: "Syndicalism",
        adjective: "Syndicalist",
        category: :leftist,
        ethos: [3.0, 0.0, 0.0],
        preferred_govt: :anocracy,
        bonuses: {}
    )
    COMMUNISM = Ideology.new(
        name: "Communism",
        adjective: "Communist",
        category: :leftist,
        ethos: [2.0, 0.0, 1.0],
        preferred_govt: :autocracy,
        bonuses: {}
    )
    SOCIALISM = Ideology.new(
        name: "Socialism",
        adjective: "Socialist",
        category: :leftist,
        ethos: [2.0, 1.0, 0.0],
        preferred_govt: :anocracy,
        bonuses: {}
    )
    PROGRESSIVISM = Ideology.new(
        name: "Progressivism",
        adjective: "Progressive",
        category: :moderate,
        ethos: [1.0, 2.0, 0.0],
        preferred_govt: :democracy,
        bonuses: {}
    )
    LIBERALISM = Ideology.new(
        name: "Liberalism",
        adjective: "Liberal",
        category: :moderate,
        ethos: [0.0, 3.0, 0.0],
        preferred_govt: :democracy,
        bonuses: {}
    )
    CONSERVATISM = Ideology.new(
        name: "Conservatism",
        adjective: "Conservative",
        category: :moderate,
        ethos: [0.0, 2.0, 1.0],
        preferred_govt: :democracy,
        bonuses: {}
    )
    NATIONALISM = Ideology.new(
        name: "Nationalism",
        adjective: "Nationalist",
        category: :rightist,
        ethos: [0.0, 1.0, 2.0],
        preferred_govt: :anocracy,
        bonuses: {}
    )
    REACTIONISM = Ideology.new(
        name: "Reactionism",
        adjective: "Reactionary",
        category: :rightist,
        ethos: [0.0, 0.0, 3.0],
        preferred_govt: :autocracy,
        bonuses: {}
    )
    FASCISM = Ideology.new(
        name: "Fascism",
        adjective: "Fascist",
        category: :rightist,
        ethos: [1.0, 0.0, 2.0],
        preferred_govt: :autocracy,
        bonuses: {}
    )
end
