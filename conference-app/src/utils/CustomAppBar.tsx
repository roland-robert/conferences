import * as React from 'react';
import AppBar from '@mui/material/AppBar';
import Box from '@mui/material/Box';
import Toolbar from '@mui/material/Toolbar';
import IconButton from '@mui/material/IconButton';
import Typography from '@mui/material/Typography';
import Menu from '@mui/material/Menu';
import Button from '@mui/material/Button';
import Tooltip from '@mui/material/Tooltip';
import MenuItem from '@mui/material/MenuItem';
import { useNavigate } from 'react-router-dom';
import { AppAvatar } from './Avatar';
import { FaGlobe } from "react-icons/fa6";




function CustomAppBar() {
  const [anchorElUser, setAnchorElUser] = React.useState<null | HTMLElement>(null);
  const navigate = useNavigate();

  const handleOpenUserMenu = (event: React.MouseEvent<HTMLElement>) => {
    setAnchorElUser(event.currentTarget);
  };

  const handleCloseUserMenu = () => {
    setAnchorElUser(null);
  };

  const handlePageChange = (link: string) => {
    return () => {
      if (link === '/login') {
        localStorage.clear();
      }
      navigate(link);
    }
  }

  const token = localStorage.getItem('token');
  const isSignedIn = token !== null;
  
  var pages = [{ name: 'Appel à communication', link: '/' }];
  if (isSignedIn) {
    pages = [...pages, { name: 'Mes Contributions', link: '/submissions' }, { name: 'Soumettre une Contribution', link: '/submit' }];
  }
  pages = [...pages, { name: 'A propos', link: '/about' }];
  
  const settings = [{ name: 'Profil', link: '/profile' }, { name: 'Déconnexion', link: '/login' }];


  return (
    <AppBar style={{ background: '#2E3B55' }} position="static">
      <div style={{ marginRight: 20, marginLeft: 20 }}>
        <Toolbar disableGutters>
          <FaGlobe />
          <Typography
            variant="h6"
            noWrap
            component="a"
            sx={{
              ml: 1,
              mr: 2,
              display: 'flex',
              fontWeight: 700,
              letterSpacing: '.3rem',
              color: 'inherit',
              textDecoration: 'none',
            }}
          >
            CONF+
          </Typography>
          <Box sx={{ flexGrow: 1, display: 'flex' }}>
            {pages.map((page, index) => (
              <Button
                key={index}
                onClick={handlePageChange(page.link)}
                sx={{ my: 2, color: 'white', display: 'block' }}
              >
                {page.name}
              </Button>
            ))}
          </Box>
          {!isSignedIn &&
            <Button
              onClick={handlePageChange('/login')}
              sx={{ my: 2, color: 'white', display: 'block' }}
            >
              Connexion
            </Button>
          }
          {isSignedIn &&
            <Box sx={{ flexGrow: 0 }}>
              <Tooltip title="Open settings">
                <IconButton onClick={handleOpenUserMenu} sx={{ p: 0 }}>
                  <AppAvatar userName="John Doe" userImage="https://www.w3schools.com/howto/img_avatar.png" size={50} />
                </IconButton>
              </Tooltip>
              <Menu
                sx={{ mt: '45px' }}
                id="menu-appbar"
                anchorEl={anchorElUser}
                anchorOrigin={{
                  vertical: 'top',
                  horizontal: 'right',
                }}
                keepMounted
                transformOrigin={{
                  vertical: 'top',
                  horizontal: 'right',
                }}
                open={Boolean(anchorElUser)}
                onClose={handleCloseUserMenu}
              >
                {settings.map((setting, index) => (
                  <MenuItem key={index} onClick={handlePageChange(setting.link)}>
                    <Typography textAlign="center">{setting.name}</Typography>
                  </MenuItem>
                ))}
              </Menu>
            </Box>
          }
        </Toolbar>
      </div>
    </AppBar>
  );
}
export default CustomAppBar;