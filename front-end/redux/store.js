import { configureStore } from '@reduxjs/toolkit';
import { playersSlice } from './slices/players';
import { createWrapper } from 'next-redux-wrapper';

const createStore = () =>
  configureStore({
    reducer: {
      [playersSlice.name]: playersSlice.reducer,
    },
    devTools: true,
  });

export const wrapper = createWrapper(createStore);
