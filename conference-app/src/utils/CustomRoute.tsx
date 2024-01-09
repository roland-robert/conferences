import React from 'react';
import { Navigate } from 'react-router-dom';
import { useToken } from '../services';
import { Buffer } from 'buffer';

export function AdminOnlyRoute({ children }: any) {
    const { token } = useToken();

    if (!token) return <Navigate to="/login" />;
    const claimsB64 = token.substring(token.indexOf("."), token.lastIndexOf("."));
    try {
        const claims = JSON.parse(Buffer.from(claimsB64, "base64").toString());
        const expireDate = new Date(claims.valid_until);
        if (expireDate.getTime() < Date.now()) {
            // jwt is expired, it is therefore cleared from local storage
            localStorage.clear();
            return <Navigate to="/login" />;
        }
        // jwt is still valid it will be sent in upcoming api calls
        if (claims.sub !== 'admin@admin.com') return <Navigate to="/" />;
        return children;
    } catch (err) {
        // jwt cannot be decoded : it is invalid and therefore cleared from local storage
        localStorage.clear();
        return <Navigate to="/login" />;
    }
}


export function PrivateRoute({ children }: any) {
    const { token } = useToken();

    if (!token) return <Navigate to="/login" />;
    const claimsB64 = token.substring(token.indexOf("."), token.lastIndexOf("."));
    try {
        const claims = JSON.parse(Buffer.from(claimsB64, "base64").toString());
        const expireDate = new Date(claims.valid_until);
        if (expireDate.getTime() < Date.now()) {
            // jwt is expired, it is therefore cleared from local storage
            localStorage.clear();
            return <Navigate to="/login" />;
        }
        // jwt is still valid it will be sent in upcoming api calls
        return children;
    } catch (err) {
        // jwt cannot be decoded : it is invalid and therefore cleared from local storage
        localStorage.clear();
        return <Navigate to="/login" />;
    }
}

export function PublicOnlyRoute({ children }: any) {
    const { token } = useToken();
    if (token) return <Navigate to="/" />;
    return children;
}