import React from 'react';
import { AppAvatar } from '../utils/Avatar';
import { User } from '../models/Person';
import '../styles/Profile.css';

interface ProfileViewProps {
    user: User;

}

function ProfileView({ user }: ProfileViewProps) {
    return (
        <>  
            <div className='user-container'>
                <AppAvatar userName={user.prenom!} userImage='https://www.w3schools.com/howto/img_avatar.png' size={200} />
                <h2>{user.prenom} {user.nom}</h2>
                <p className='mail'>{user.mail}</p>

            </div>
        </>
    )
}

export default ProfileView;