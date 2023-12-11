import React from 'react';
import './styles/App.css';
import CustomAppBar from './utils/CustomAppBar';
import { Routes, Route, BrowserRouter } from "react-router-dom";
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



function App() {

  const [filters, setFilters] = useState<Filters>(new Filters({}));
  const [showModal, setShowModal] = useState(false);

  useEffect(() => {
    console.log(filters);
  }, [filters]);

  return (  
    <div>
      <BrowserRouter>
        <CustomAppBar />
        <FiltersModal filters={filters} setFilters={setFilters} show={showModal} onHide={() => setShowModal(false)} />
        <div className='page'>
          <Routes >
            <Route path="/" element={<MainView openFilters={() => setShowModal(true)} />} />
            <Route path="/conference" element={<ConferenceView />} />
            <Route path="/login" element={<LoginView />} />
            <Route path="/submit" element={<SubmitConferenceView />} />
            <Route path="/submissions" element={<SubmissionsView />} />
            <Route path="/profile" element={<ProfileView user={new User({ nom: 'Doe', prenom: 'John', mail: 'john.doe@gmail.com' })} />} />
            <Route path="/about" element={<AboutView />} />

          </Routes>
        </div>
      </BrowserRouter>
    </div>
  );
}

export default App;
