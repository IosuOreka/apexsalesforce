import { LightningElement, track } from 'lwc';

export default class Pokedex extends LightningElement {
    @track searchTerm = '';
    @track pokemons = [];
    @track selectedPokemon = null;
    @track offset = 0;
    @track limit = 20;

    columns = [
        { label: 'Nombre', fieldName: 'name' },
        { label: 'Imagen', type: 'image', fieldName: 'image' },
        { type: 'button', typeAttributes: { label: 'Ver Detalles', name: 'view_details' } }
    ];

    get isPreviousDisabled() {
        return this.offset === 0;
    }

    get isNextDisabled() {
        return this.pokemons.length < this.limit;
    }

    get formattedAbilities() {
        return this.selectedPokemon?.abilities.join(', ') || '';
    }

    get formattedTypes() {
        return this.selectedPokemon?.types.join(', ') || '';
    }

    handleSearch(event) {
        this.searchTerm = event.target.value.toLowerCase();
        this.offset = 0;
        this.fetchPokemons();
    }

    handleRowAction(event) {
        if (event.detail.action.name === 'view_details') {
            const pokemonId = event.detail.row.id;
            this.fetchPokemonDetails(pokemonId);
        }
    }

    handlePreviousPage() {
        this.offset = Math.max(this.offset - this.limit, 0);
        this.fetchPokemons();
    }

    handleNextPage() {
        this.offset += this.limit;
        this.fetchPokemons();
    }

    fetchPokemons() {
        const apiUrl = `https://pokeapi.co/api/v2/pokemon?limit=${this.limit}&offset=${this.offset}`;

        fetch(apiUrl)
            .then(response => response.json())
            .then(data => {
                const filteredPokemons = data.results
                    .filter(pokemon => pokemon.name.includes(this.searchTerm))
                    .map(pokemon => ({
                        id: pokemon.url.split('/').slice(-2, -1)[0],
                        name: pokemon.name,
                        image: `https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/${pokemon.url.split('/').slice(-2, -1)[0]}.png`
                    }));
                this.pokemons = filteredPokemons;
            });
    }

    fetchPokemonDetails(pokemonId) {
        const apiUrl = `https://pokeapi.co/api/v2/pokemon/${pokemonId}`;

        fetch(apiUrl)
            .then(response => response.json())
            .then(data => {
                this.selectedPokemon = {
                    name: data.name,
                    image: `https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/${pokemonId}.png`,
                    height: data.height / 10,
                    weight: data.weight / 10,
                    types: data.types.map(typeInfo => typeInfo.type.name),
                    abilities: data.abilities.map(abilityInfo => abilityInfo.ability.name)
                };
            });
    }
}
