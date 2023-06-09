import { createSlice } from '@reduxjs/toolkit';

// Initial state
const initialState = {
  loading: false,
  items: [],
  pagination: { currentPage: 1, numberOfPages: 1 },
  queryParams: {},
  modals: { showSubscription: false, showNotification: false },
  selected: {},
};

// Actual Slice
export const playersSlice = createSlice({
  name: 'players',
  initialState,
  reducers: {
    setPlayersLoading(state, action) {
      state.loading = action.payload;
    },
    setPlayersPagination(state, action) {
      state.pagination = action.payload;
    },
    setPlayersItems(state, action) {
      state.items = action.payload;
    },
    setSelectedPlayer(state, action) {
      state.selected = action.payload;
    },
    setPlayersQueryParams(state, action) {
      state.queryParams = action.payload;
    },
    setPlayersModalsParams(state, action) {
      state.modals = action.payload;
    },
  },
});

export const {
  setPlayersItems,
  setSelectedPlayer,
  setPlayersLoading,
  setPlayersPagination,
  setPlayersQueryParams,
  setPlayersModalsParams,
} = playersSlice.actions;

export const selectPlayersState = (state) => state.players.items;
export const selectSelectedPlayerState = (state) => state.players.selected;
export const selectPlayersLoadingState = (state) => state.players.loading;
export const selectPlayersPaginationState = (state) => state.players.pagination;
export const selectPlayersModalsState = (state) => state.players.modals;
export const selectPlayersqueryParamsState = (state) =>
  state.players.queryParams;

export default playersSlice.reducer;
