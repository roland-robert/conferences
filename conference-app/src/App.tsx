import React from 'react';
import './styles/App.css';
import CustomAppBar from './utils/CustomAppBar';
import { Routes, Route, BrowserRouter, Navigate } from "react-router-dom";
import MainView from './views/MainView';
import ConferenceView from './views/ConferenceView';
import LoginView from './views/LoginView';
import SubmitConferenceView from './views/SubmitConferenceView';
import SubmissionsView from './views/SubmissionsView';
import ProfileView from './views/ProfileView';
import AboutView from './views/AboutView';
import { useState, useEffect } from 'react';
import { Filters } from './models/Filters';
import { FiltersModal } from './utils/FiltersModal';
import "@fontsource/montserrat"; // Defaults to weight 400
import { User } from './models/Person';
import { useToken } from './services';
import { AdminOnlyRoute, PrivateRoute, PublicOnlyRoute } from './utils/CustomRoute';
import SearchUsersView from './views/SearchUsersView';



function App() {

  const [filters, setFilters] = useState<Filters>(new Filters({}));
  const [showModal, setShowModal] = useState(false);
  const { token } = useToken();


  return (
    <div>
      <BrowserRouter>
        <CustomAppBar />
        <FiltersModal filters={filters} setFilters={setFilters} show={showModal} onHide={() => setShowModal(false)} />
        <div className='page'>
          <Routes >
            {/* routes for any user (signed in or not) */}
            <Route path="/" element={<MainView openFilters={() => setShowModal(true)} filters={filters} />} />
            <Route path="/conference" element={<ConferenceView />} />

            <Route path="/about" element={<AboutView />} />
            {/* routes for signed in users only*/}
            <Route path="/submit" element={
              <PrivateRoute>
                <SubmitConferenceView />
              </PrivateRoute>
            } />
            <Route path="/submissions" element={
              <PrivateRoute>
                <SubmissionsView />
              </PrivateRoute>
            } />
            <Route path="/profile" element={
              <PrivateRoute>
                <ProfileView  />
              </PrivateRoute>
            } />
            {/* routes for non-signed in users only*/}
            <Route path="/login" element={
              <PublicOnlyRoute>
                <LoginView />
              </PublicOnlyRoute>
            } />
            <Route path="/search_users" element={
              <AdminOnlyRoute>
                <SearchUsersView />
              </AdminOnlyRoute>
            } />
          </Routes>
        </div>
      </BrowserRouter>
    </div>
  );
}

export default App;
