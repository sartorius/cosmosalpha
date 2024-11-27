<?php
// src/Security/CustomAuthenticationSuccessHandler.php

namespace App\Security;

use Psr\Log\LoggerInterface;
use App\Entity\User;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\RedirectResponse;
use Symfony\Component\Routing\RouterInterface;
use Symfony\Component\Security\Core\Authentication\Token\TokenInterface;
use Symfony\Component\Security\Http\Authentication\AuthenticationSuccessHandlerInterface;

class CustomAuthenticationSuccessHandler implements AuthenticationSuccessHandlerInterface
{
    private RouterInterface $router;
    private $logger;

    public function __construct(RouterInterface $router, LoggerInterface $logger)
    {
        $this->router = $router;
        $this->logger = $logger;
    }

    public function onAuthenticationSuccess(Request $request, TokenInterface $token): Response
    {
        // Get the authenticated user
        /**
         * @var User
         */
        $user = $token->getUser();

        // You can perform any action you need here, for example:
        // - Log the login
        // - Update the user's last login time
        // - Redirect the user to a different page based on roles or other conditions

        // Example: Redirect based on roles
        /*
        if (in_array('ADM', $user->getRoles())) {
            $response = new RedirectResponse($this->router->generate('app_register'));
        } else {
            $response = new RedirectResponse($this->router->generate('main'));
        }
        */

        /** DO here all operations */
        if (in_array('ADM', $user->getRoles())) {
            $this->logger->debug('*** *** *** *** *** *** *** *** *** Show me ROLE: ADMINISTRATOR');
        } else {
            $this->logger->debug('*** *** *** *** *** *** *** *** *** Show me ROLE: NOT ADMINISTRATOR');
        }

        
        $_SESSION["username"] = $user->getUsername();
        $_SESSION["firstname"] = 'Test';
        $_SESSION["lastname"] = 'Test';
        $_SESSION["id"] = 7;
        $_SESSION["scale_right"] = 100;

        /*
        $_SESSION["id"] = $result[0]['ID'];
        $_SESSION["firstname"] = $result[0]['FIRSTNAME'];
        $_SESSION["lastname"] = $result[0]['LASTNAME'];
        $_SESSION["scale_right"] = 0;
        $_SESSION["email"] = $result[0]['EMAIL'];
        */
        
        $response = new RedirectResponse($this->router->generate('main'));

        return $response;
    }
}