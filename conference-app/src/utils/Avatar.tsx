import Avatar from '@mui/material/Avatar';
import React from 'react';

interface AppAvatarProps {
    userName: string;
    userImage: string;
    size?: number;
}

export function AppAvatar({userName, userImage, size}: AppAvatarProps) {
    return (
        <Avatar alt={userName} src={userImage} sx={{width:size, height:size}}/>
    )
}