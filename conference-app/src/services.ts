import axios from "axios";
import { useState } from "react";


export async function privateQuery(method: string, endpoint: string, { data = null, params = null }: { data?: any, params?: any, port?: number } = {}) {
    console.log(method + " http://localhost:8000" + endpoint);
    const token = localStorage.getItem("token");
    const res = await axios({
        method: method,
        url: `http://localhost:8000` + endpoint,
        data: data,
        params: params,
        headers: { Authorization: `Bearer ${token}` },
    });
    return res.data;
}

// Function to manage token as a state
export function useToken() {
    const getToken = () => {
        const token = localStorage.getItem("token");
        if (token) {
            return token;
        } else {
            return "";
        }
    };

    const [token, setToken] = useState(getToken());

    const saveToken = (userToken: string) => {
        localStorage.setItem("token", userToken);
        setToken(userToken);
    };

    return {
        setToken: saveToken,
        token,
    };
}

